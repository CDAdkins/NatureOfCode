PVector mouse;
PVector object;
PVector direction;
float distance;
float xVelo;
float yVelo;
float totalVelo;
boolean redraw = true;

Mover guy;

void setup() {
    fullScreen();
    noCursor();
    textSize(24);
    //size(1000, 800); test change
    background(24);
    stroke(255);
    fill(255);

    guy = new Mover();
}

void draw() {
    if (redraw) {
        background(24);
    }


    stroke(255);
    fill(255);

    xVelo = abs(guy.velocity.x);
    yVelo = abs(guy.velocity.y);
    totalVelo = xVelo + yVelo;
    // Rounding velo
    totalVelo *= 100;
    totalVelo = round(totalVelo);
    //totalVelo /= 100;

    text("Planet Velocity: " + int(totalVelo) + " m/s", 10, 30);

    ellipse(mouseX, mouseY, 5, 5);

    mouse = new PVector(mouseX, mouseY);
    
    direction = PVector.sub(mouse, guy.location);

    distance = direction.mag();

    direction.normalize();
    direction.div(distance * 0.005);
    guy.acceleration = new PVector(direction.x, direction.y);

    guy.display();
    
}

void keyPressed() {
    if (redraw) {
        redraw = false;
    } else {
        redraw = true;
    }
}