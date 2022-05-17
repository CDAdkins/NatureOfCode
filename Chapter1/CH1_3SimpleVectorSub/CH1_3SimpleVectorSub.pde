void setup() {
    size(500, 500);
    background(24);
    stroke(255);
}

void draw() {
    background(24);
    PVector mouse = new PVector(mouseX, mouseY);
    PVector center = new PVector(width/2, height/2);

    mouse.sub(center);

    translate(width/2, height/2);
    line(0, 0, mouse.x, mouse.y);
}