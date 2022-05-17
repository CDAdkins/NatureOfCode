void setup() {
    size(700, 700);
    background(24);
    stroke(255);
    textSize(15);
}

void draw() {
    background(24);
    float myMouseX = mouseX - width/2;
    float myMouseY = mouseY - height/2;
    PVector mouse = new PVector(myMouseX, myMouseY);
    PVector center = new PVector(width/4, height/4);
    mouse.sub(center);

    translate(width/2, height/2);

    stroke(0, 255, 0);
    line(0, 0, mouseX - width/2, mouseY - height/2); // Points from the center to my mouse coords
    
    stroke(255, 0, 255); // Points from the center in a direction as an example
    line(0, 0, center.x, center.y);

    stroke(255, 255, 255);
    line(0, 0, mouse.x, mouse.y); // Points to the result of mouse - center

    fill(0, 255, 0);
    text("Mouse: (" + myMouseX + ", " + myMouseY + ")", -width/2, -height/2 + 20);
    fill(255, 0, 255);
    text("Center: (" + center.x + ", " + center.y + ")", -width/2, -height/2 + 40);
    fill(255, 255, 255);
    text("mouse.sub(Center): (" + mouse.x + ", " + mouse.y + ")", -width/2, -height/2 + 60);
}