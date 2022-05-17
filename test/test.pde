void setup() {
    size(500, 500);
    background(24);
    stroke(255);
}

void draw() {
    background(24);
    PVector center = new PVector(width/2, height/2);
    PVector mouse = new PVector(mouseX, mouseY);
    center.add(mouse);

    line(0, 0, center.x, center.y);
    line(0, 0, mouse.x, mouse.y);
    line(0, 0, width/2, height/2);
}