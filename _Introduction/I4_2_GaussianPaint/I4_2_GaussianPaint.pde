float mean; // Average
float sd; // Standard Variation
float num; // Our random number
float xPos; // xpos of paint splatter
float yPos; // ypos of paint splatter
float size; // Size of splatter
float r; // red value
float g; // green value
float b; // blue value

void setup() {
    size(500, 500);
    background(24);
    noStroke();

    mean = width/2;
    sd = width/10;

    paint();
}

void draw() {

}

void keyPressed() {
    background(24);
    paint();
}

void paint() {
    for (int i = 0; i < 20; i++) {
        r = (float) randomGaussian() * sd + mean;
        g = (float) randomGaussian() * sd + mean;
        b = (float) randomGaussian() * sd + mean;

        xPos = (float) randomGaussian() * sd + mean;
        yPos = (float) randomGaussian() * sd + mean;
        size = (float) randomGaussian() * sd/3 + mean/6;
        fill(r, g, b);
        ellipse(xPos, yPos, size, size);
    }
}