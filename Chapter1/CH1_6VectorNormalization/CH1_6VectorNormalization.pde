PVector mouse;

void setup() {
    size(1000, 500);
    background(24);
    stroke(255);
    fill(255);
    textSize(20);
    mouse = new PVector(mouseX, mouseY);
}

void draw() {
    background(24);
    mouse = new PVector(mouseX, mouseY);
    mouse.normalize();
    mouse.mult(width/2);
    line(0, 0, mouse.x, mouse.y);

    rect(0, height - 20, map(mouse.mag(), 0, (width + height / 4), 0, width), 20);
    text("Vector X: " + mouse.x, 10, height - 70);
    text("Vector Y: " + mouse.y, 10, height - 50);
    text("Vector Magnitude: " + mouse.mag(), 10, height - 30);
}