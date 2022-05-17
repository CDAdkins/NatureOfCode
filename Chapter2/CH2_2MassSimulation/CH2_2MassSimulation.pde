PVector gravity;
PVector wind;
float noiseValue;
float noiseOffset;
float t; // Perlin noise time seed
Mover[] balloons;

void setup() {
    fullScreen();
    //size(1000, 500);
    background(24);
    textSize(24);
    balloons = new Mover[1000];

    for (int i = 0; i < 1000; i++) {
        balloons[i] = new Mover(1);
    }

    gravity = new PVector(0, -0.0);

    t = random(10000);
    noiseValue = 0;
    noiseOffset = 0.000000000001;
}

void draw() {
    background(24);

    noiseOffset += 0.0001;
    wind = new PVector(noise(noiseOffset), 0);
    calculateNoise();

    for (int i = 0; i < 1000; i++) {
        balloons[i].applyForce(gravity);
        balloons[i].applyForce(wind);
        balloons[i].display();
    }

    text("Wind Speed: " + wind.x * 1000, 24, 24);
}
void calculateNoise() {
    t += noiseOffset;
    noiseValue = map(noise(t), 0, 1, -0.75, 0.8);
    wind = new PVector(noiseValue, 0);
}