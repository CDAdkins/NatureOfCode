Mover car;

void setup() {
    size(1300, 500);
    background(40);
    textSize(20);
    frameRate(60);

    car = new Mover();
}

void draw() {
    background(40);
    car.update();
    text("acceleration: " + car.acceleration.x, 10, 20);
}