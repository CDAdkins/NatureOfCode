float x; // x position of ball
float y; // y position of ball
float xSpeed; // x speed of ball
float ySpeed; // y speed of ball
float xSize; // size of ball
float ySize;
float maxySpeed;

void setup() {
    fullScreen();
    //size(600, 300);
    background(24);
    frameRate(60);

    // Randomly start the ball somewhere
    x = random(width);
    y = random(height/2, height/10);
    xSpeed = 3;
    ySpeed = 0;
    xSize = 50;
    ySize = 80;
    maxySpeed = 35;

    rect(x, y, xSize, ySize);
}

void draw() {
    if (ySpeed < maxySpeed) {
        ySpeed+=0.5;
    }
    if (x >= width - xSize/2 || x <= 0 + xSize/2) {
        xSpeed *= -1;
        ySpeed -= 5;
    }

    if (y >= height - ySize/2 || y <= 0 + ySize/2) {
        ySpeed *= -1;
    }

    x += xSpeed;
    y += ySpeed;
    rect(x, y, xSize, ySize);
}