Mover balloon;
PVector gravity;
PVector wind;
float noiseValue;
float noiseOffset;
float t; // Perlin noise time seed

void setup() {
    size(1000, 500);
    background(24);
    textSize(24);

    balloon = new Mover();

    gravity = new PVector(0, -0.02);

    t = random(10000);
    noiseValue = 0;
    noiseOffset = 0.00001;
}

void draw() {
    background(24);

    noiseOffset += 0.00001;
    wind = new PVector(noise(noiseOffset), 0);

    balloon.applyForce(gravity);

    calculateNoise();
    balloon.applyForce(wind);

    balloon.display();

    text("Wind Speed: " + wind.x * 1000, 24, 24);
}
void calculateNoise() {
    t += noiseOffset;
    noiseValue = map(noise(t), 0, 1, -0.01, 0.01);
    wind = new PVector(noiseValue, 0);
}