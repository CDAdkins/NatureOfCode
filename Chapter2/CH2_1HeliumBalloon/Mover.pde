/* This iteration of the Mover class implemented the applyForce() function which allows us to
   handle multiple different sources of force to manipulate our acceleration in more natural
   looking ways. */

class Mover {
    // Mover Class

    // Attributes
    PVector location;
    PVector velocity;
    PVector acceleration;
    float maxSpeed;
    float size;
    color myColor;

    // Constructor
    Mover() { // Default no arg
        size = 50;
        maxSpeed = 1000;
        location = new PVector(width/2, height/2);
        velocity = new PVector(0, 0);
        acceleration = new PVector(0, 0);
        myColor = 100;
    }

    Mover(float r, float g, float b) { // Color Constructor
        size = 16;
        maxSpeed = 2.5;
        location = new PVector(random(width), random(height));
        velocity = new PVector(0, 0);
        acceleration = new PVector(0, 0);
        myColor = color(r, g, b);
    }

    void update() { // Function to hold all "moving" logic
        //speedCheck();

        // Choose either edgeWrap, edgeBounce, or neither to handle edgeChecking
        // edgeWrap();
        edgeBounce();

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
        acceleration.add(force); // Add the force to the acceleration
    }

    void changeAcceleration() { // no arg, random acceleration change
        acceleration = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
    }

    void changeAcceleration(float x, float y) { // arguments to force acceleration in a direction
        acceleration = new PVector(x, y);
    }
}
