class Mover {
    PVector location;
    PVector velocity;
    PVector acceleration;
    float size;
    float maxSpeed;

    Mover() {
        location = new PVector(random(width), random(height));
        velocity = new PVector(0, 0);
        acceleration = new PVector(0, 0);
        size = 50;
        maxSpeed = 10;
    }

    void getInput() {
        if (keyPressed) {
            if (keyCode == UP) {
                acceleration.x += 0.001;
            }
            
            if (keyCode == DOWN) {
                acceleration.x -= 0.001;
            }
        } else {
            acceleration.x = 0;
        }
    }

    void update() {
        checkEdges();
        getInput();
        velocity.limit(maxSpeed);
        velocity.add(acceleration);
        location.add(velocity);
        display();
    }

    void display() {
        fill(255);
        stroke(0);
        rect(location.x, location.y, size, size);
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

    void decelerate() {
        if (velocity.x > 0 && acceleration.x > 0) {
            acceleration.x -= 0.005;
        }

        if (velocity.y > 0 && acceleration.y > 0) {
            acceleration.y -= 0.005;
        }

    }
}