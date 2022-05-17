Mover guy;
Mover[] fellas;

void setup() {
    fullScreen();
    //size(500, 500);
    background(0, 80, 0);
    noCursor();
    smooth();
    textSize(20);

    guy = new Mover(255, 0, 0);
    fellas = new Mover[20];

    for (int i = 0; i < 20; i++) {
        fellas[i] = new Mover();
    }
}

void draw() {
    background(0, 80, 0);
    guy.update();
    guy.display();

    for (int i = 0; i < fellas.length; i++) {
        fellas[i].update();
        fellas[i].display();
    }

    stroke(255);
    fill(255);
    
    text("X Velocity: " + guy.velocity.x, 5, 20);
    text("Y Velocity: " + guy.velocity.y, 5, 40);
    text("X Acceleration: " + nf(guy.acceleration.x, 1, 3), 5, 60);
    text("Y Acceleration: " + nf(guy.acceleration.y, 1, 3), 5, 80);
    text("X Position: " + guy.location.x, 5, 100);
    text("Y Position: " + guy.location.y, 5, 120);
}