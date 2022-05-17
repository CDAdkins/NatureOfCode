Mover guy;

void setup() {
    fullScreen();
    size(500, 500);
    background(40);
    noCursor();
    smooth();
    frameRate(60);
    textSize(20);

    guy = new Mover(255, 0, 0);

}

void draw() {
    background(40);
    guy.update();
    guy.display();


    stroke(255);
    fill(255);
    
    text("X Velocity: " + guy.velocity.x, 5, 20);
    text("Y Velocity: " + guy.velocity.y, 5, 40);
    text("X Acceleration: " + nf(guy.acceleration.x, 1, 3), 5, 60);
    text("Y Acceleration: " + nf(guy.acceleration.y, 1, 3), 5, 80);
    text("X Position: " + guy.location.x, 5, 100);
    text("Y Position: " + guy.location.y, 5, 120);
}