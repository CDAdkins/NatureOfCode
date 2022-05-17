/* This iteration of the Mover class implemented the mass variable which allows for more accurate
   depictions of events with multiple movers. For now, mass is tied to the size of the mover
   so if this mover is 10 pixels wide, mass will be 10. This iteration also removed the color
   constructor since I wasn't using it and I don't feel like updating it. */

class Mover {
    // Attributes
    PVector location; // Where on the screen we are
    PVector velocity; // How fast we're moving currently
    PVector acceleration; // How quickly are we speeding up, or slowing down
    float mass; // How heavy are we
    float maxSpeed; // How fast are we allowed to go *Only if speedCheck is used*
    float size; // Size of the object, in pixels
    color myColor; // Color of the object's fill

    // Constructor
    Mover() { // Default no arg
        size = 10;
        mass = size; // Setting mass equal to the size of the mover
        maxSpeed = 1000;
        location = new PVector(width/2, height/2); // Starts right in the center of the window
        velocity = new PVector(0, 0); // Starts stationary, no velocity
        acceleration = new PVector(0, 0); // No acceleration at the start
        myColor = 100;
    }

    Mover(int i) { // Another constructor, this one makes the starting location & size random
        size = random(1, 50);
        mass = size; // Setting mass equal to the size of the mover
        maxSpeed = 1000;
        location = new PVector(random(size/2, width - size/2), random(size/2, height - size/2)); // Starts right in the center of the window
        velocity = new PVector(0, 0); // Starts stationary, no velocity
        acceleration = new PVector(0, 0); // No acceleration at the start
        myColor = 100;
    }

    void update() { // Function to hold all "moving" logic
        //speedCheck(); // Usually not necessary, probably needs updating

        // Choose either edgeWrap, edgeBounce, or neither to handle edgeChecking
        // edgeWrap(); // Teleport from one side of the wall, to the other (*o*)
        // edgeBounce(); // Bounce off the walls

        velocity.add(acceleration);
        location.add(velocity);
        velocity.limit(maxSpeed);
        acceleration.mult(0);
    }

    void display() { // Function to handle what the object looks like
        // Set proper colors
        stroke(0);
        fill(myColor);

        // Draw our circle
        ellipse(location.x, location.y, size, size);
        update();
    }

    void edgeWrap() { // Use this if oyu want the mover to wrap around the window when hitting an edge
        if (location.x > width - size/2) { // If too far right
            location.x = 0 + size/2;
        } else if (location.x < 0 + size/2) { // If too far left
            location.x = width - size/2;
        } else if (location.y > height - size/2) { // If too low
            location.y = 0 + size/2;
        } else if (location.y < 0 + size/2) { // If too high
            location.y = height - size/2;
        }
    }

    void edgeBounce() { // Use this if you want the mover to bounce off of the edge of the window
        if (location.x > width - size/2 || location.x < 0 + size/2) { // If hitting left or right edge
            velocity.x *= -1.0; // invert x velocity
        }
        if (location.y > height - size/2 || location.y < 0 + size/2) { // If hit top or bottom
            velocity.y *= -1.0; // Invert y velocity
        }
    }

    void speedCheck() {
        changeAcceleration();
    }

    void applyForce(PVector force) {
        PVector f = PVector.div(force, mass); // Static method so we don't overwrite the force directly

        acceleration.add(f); // Add the force to the acceleration
    }

    void applyGravity(PVector gravity) { // Same as applyForce but ignores mass calculations because gravity lol
        acceleration.add(gravity);
    }

    void changeAcceleration() { // no arg, random acceleration change
        acceleration = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
    }

    void changeAcceleration(float x, float y) { // arguments to force acceleration in a direction
        acceleration = new PVector(x, y);
    }

}
