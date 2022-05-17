float x; // X position of the rectangle
float y; // Y position of the ellipse - Perlin noise
float t; // Perlin noise time increment, smaller is smoother

void setup() {
    fullScreen();
    size(1000, 400);
    background(24);
    noStroke();
    textSize(50);

    x = 0; // Starting on the left hand side
    t = random(10000);
    y = noise(t);
}

void draw() {
    //background(24);
    //y=noise(t);
    y = map(noise(t), 0, 1, 0, height);
    //text(y * 400, width/2, height/2);
    t+=0.001;

    ellipse(x, y, 3, 3);
    x+=2;

    if (x >= width) {
        background(24);
        x = 0;
    }
}

void keyPressed() {
    x = 0;
    background(24);
    t = random(10000);
}