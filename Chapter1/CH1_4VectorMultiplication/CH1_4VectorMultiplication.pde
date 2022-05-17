PVector mouse;
PVector center;

void setup() {
    size (500, 500);
    background(24);
    stroke(255);
    fill(255);

    //mouse = new PVector(mouseX, mouseY);
    //center = new PVector(width/2, height/2);
    //mouse.sub(center);
}

void draw() {
    mouse = new PVector(mouseX, mouseY);
    center = new PVector(width/2, height/2);
    mouse.sub(center);
    mouse.mult(0.5);

    background(24);
    translate(width/2, height/2);
    line(0, 0, mouse.x, mouse.y);
}