PVector location;
PVector velocity;
float size; // Size of ball
boolean physics = false;

void setup() {
    fullScreen();
    size(1000, 500);
    background(24);
    frameRate(60);
    smooth();

    size = 30;
    location = new PVector(random(width), random(height));
    velocity = new PVector(5, 5);

    ellipse(location.x, location.y, size, size);
}

void draw() {
    background(24);
    if (location.x >= width - size/2 || location.x < 0 + size/2) { // If we hit the left or right edge
        velocity.x *= -1; // Reverse the velocity's x value
    }

    if (location.y >= height - size/2 || location.y <= 0 + size/2) { // If we hit the top or bottom edge
        velocity.y *= -1; // Reverse the velocity's y value
        velocity.x *= 0.95;
    }

    if (physics) {
        velocity.y += 1;
    }

    if (location.y > height - size/2) {
        location.y = height - size/2;
    }

    location.add(velocity);
    ellipse(location.x, location.y, size, size);
}

void keyPressed() {
    if (!physics) {
        physics = true;
    } else {
        physics = false;
    }
}