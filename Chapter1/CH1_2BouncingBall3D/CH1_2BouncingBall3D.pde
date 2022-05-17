PVector location;
PVector velocity;
float z;
float zSpeed;
float size;
boolean physics;

void setup() {
    //fullScreen();
    size(1000, 700, P3D);
    smooth();
    physics = false;
    background(24);
    noStroke();
    stroke(255);
    location = new PVector(random(width), random(height/2));
    velocity = new PVector(5, 5);
    z = 0;
    size = 25;
    zSpeed = 5;
}

void draw() {
    background(24);
    lights();

    line(0, 0, 0, 0, 0, -500);
    line(0, height, 0, 0, height, -500);
    line(width, 0, 0, width, 0, -500);
    line(width, height, 0, width, height, -500);
    line(0, 0, -500, width, 0, -500);
    line(0, height, -500, width, height, -500);
    line(0, 0, -500, 0, height, -500);
    line(width, 0, -500, width, height, -500);
    line(0, 0, 0, 0, height, 0);
    line(0, 0, 0, width, 0, 0);
    line(0, height, 0, width, height, 0);
    line(width, height, 0, width, 0, 0);


    translate(location.x, location.y, z);
    sphere(size);

    if (location.x >= width - size || location.x <= 0 + size) {
        velocity.x *= -1;
    }

    if (location.y >= height - size || location.y <= 0 + size) {
        velocity.y *= -1;
    }

    if (z >= 0 || z <= -500) {
        zSpeed *= -1;
    }

    if (location.y > height - 1) {
        location.y = height - 5;
    }

    if (physics) {
        velocity.y += 1;
    }
    
    location.add(velocity);
    z += zSpeed;

    
}

void keyPressed() {
    if (!physics) {
        physics = true;
    } else {
        physics = false;
    }
}