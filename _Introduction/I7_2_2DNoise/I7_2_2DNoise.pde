float bright; // Value generted for noise on the x axis
float xoff;
float yoff;
float xinit;
float yinit;
float zoff;
int lod = 0;

void setup() {
    //fullScreen();
    size(1000, 1000);
    loadPixels();

    //generate();
}

void draw() {

    float xoff = xinit;
    for (int x = 0; x < width; x++) {
        float yoff = yinit; // For each xoff, start yoff at 0;
        for (int y = 0; y < height; y++) {
            bright = map(noise(xoff, yoff, zoff), 0, 1, 0, 255);
            pixels[x + y * height] = color(bright);
            yoff += 0.01;
        }
        xoff += 0.01;
    }
    zoff += 0.008;
    updatePixels();
}

void keyPressed() {

    noiseDetail(lod);
    generate();
    lod++;
}

void generate() {
    xinit = random(10000);
    yinit = random(10000);
    float xoff = xinit;
    for (int x = 0; x < width; x++) {
        float yoff = yinit; // For each xoff, start yoff at 0;
        for (int y = 0; y < height; y++) {
            bright = map(noise(xoff, yoff), 0, 1, 0, 255);
            pixels[x + y * height] = color(bright, 0, bright);
            yoff += 0.01;
        }
        xoff += 0.01;
    }
    updatePixels();
}