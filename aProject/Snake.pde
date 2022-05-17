class Snake {
    // Mover Class

    // Attributes
    public PVector location;
    PVector velocity;
    PVector acceleration;
    float maxSpeed;
    float size;
    color myColor;
    ellipse[] body = new ellipse[10];

    // Constructor
    Snake() { // Default no arg
        size = 50;
        maxSpeed = 1000;
        location = new PVector(random(width), random(height));
        velocity = new PVector(0, 0);
        acceleration = new PVector(0, 0);
        myColor = 0;
    }

    Snake(float r, float g, float b) { // Color Constructor
        size = 16;
        maxSpeed = 2.5;
        location = new PVector(random(width), random(height));
        velocity = new PVector(0, 0);
        acceleration = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
        myColor = color(r, g, b);
    }

    void update() { // Function to hold all "moving" logic
        // Make sure the edges are checked so we don't leave the screen.
        //checkEdges();
        //speedCheck();
        velocity.limit(maxSpeed);
        velocity.add(acceleration);
        location.add(velocity);
    }

    void display() { // Function to handle what the object looks like
        // Set proper colors
        stroke(255);
        fill(myColor);

        // Draw our circle
        ellipse(location.x, location.y, size, size);
        guy.update();
    }

    void checkEdges() {
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

    void speedCheck() {
        changeAcceleration();
    }

    void changeAcceleration() { // no arg, random acceleration change
        acceleration = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
    }

    void changeAcceleration(float x, float y) { // arguments to force acceleration in a direction
        acceleration = new PVector(x, y);
    }
}
