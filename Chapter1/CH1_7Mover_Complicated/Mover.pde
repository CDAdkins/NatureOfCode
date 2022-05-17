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
        size = 16;
        maxSpeed = 0;
        location = new PVector(random(width), random(height));
        velocity = new PVector(0, 0);
        acceleration = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
        myColor = 255;
        velocity.limit(0.2);
    }

    Mover(float r, float g, float b) { // Color Condtructor
        size = 16;
        maxSpeed = 2.5;
        location = new PVector(random(width), random(height));
        velocity = new PVector(0, 0);
        acceleration = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
        myColor = color(r, g, b);
    }

    void update() { // Function to hold all "moving" logic
        // Make sure the edges are checked so we don't leave the screen.
        checkEdges();
        //speedCheck();
        velocity.limit(10);
        velocity.add(acceleration);
        location.add(velocity);
    }

    void display() { // Function to handle what the object looks like
        // Set proper colors
        stroke(0);
        fill(myColor);

        // Draw our circle
        ellipse(location.x, location.y, 16, 16);
    }

    void checkEdges() {
        if (location.x > width - size/2) { // If too far right
            //location.x = 0 + size/2;
            changeAcceleration(random(-1, 0), acceleration.y);
        } else if (location.x < 0 + size/2) { // If too far left
            //location.x = width - size/2;
            changeAcceleration(random(0, 1), acceleration.y);
        } else if (location.y > height - size/2) { // If too low
            //location.y = 0 + size/2;
            changeAcceleration(acceleration.x, random(-1, 0));
        } else if (location.y < 0 + size/2) { // If too high
            //location.y = height - size/2;
            changeAcceleration(acceleration.x, random(0, 1));
        } else { // If we are in bounds
            speedCheck();
        }
    }

    void speedCheck() {
        changeAcceleration();

        // Uncomment if you want to, it makes the circle boring though.
        // if (abs(velocity.x) > maxSpeed || abs(velocity.y) > maxSpeed) {
        //     if (velocity.x > maxSpeed) { // If we are moving right too quickly
        //         changeAcceleration(random(-0.2, 0.1), acceleration.y);
        //     } else if (velocity.x < (maxSpeed * -1)) { // If we're moving left too quickly
        //         changeAcceleration(random(-0.1, 0.2), acceleration.y);
        //     }

        //     if (velocity.y > maxSpeed) { // If we're going down too fast
        //         println("Sum Ting Wong, Wi Tu Low");
        //         changeAcceleration(acceleration.x, random(-0.2, 0.1));
        //     } else if (velocity.y < (maxSpeed * -1)) {
        //         changeAcceleration(acceleration.x, random(-0.1, 0.2));
        //     }
        // }
    }

    void changeAcceleration() { // no arg, random acceleration change
        acceleration = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
    }

    void changeAcceleration(float x, float y) { // arguments to force acceleration in a direction
        acceleration = new PVector(x, y);
    }
}
