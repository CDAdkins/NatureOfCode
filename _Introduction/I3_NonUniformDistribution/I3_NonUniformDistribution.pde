Walker[] flies;

void setup() {
    fullScreen();
    size(700, 700);
    background(24);
    flies = new Walker[2000];

    for (int i = 0; i < flies.length; i++) {
        flies[i] = new Walker();
    }
}

void draw() {
    background(24);
    for (int i = 0; i < flies.length; i++) {
        flies[i].display();
        flies[i].walk();
    }
}

class Walker {
    float x; // x position
    float y; // y position
    int size; // size of walker
    int speed;

    Walker() {
        x = width/2;
        y = height/2;
        size = 20;
        fill(50, 150, 255);
        speed = 5;
    }

    void walk() {
        float choice; // Random number being generated
        choice = random(1);
        if (choice <= .5) { // 50% probability
            if (mouseX > x) { // If the mouse is to the right of the walker.
                x+=speed/2; // Move right
            } else { // Otherwise
                x-=speed/2; // Move left
            }

            if (mouseY > y) { // If the mouse is below the walker
                y+=speed/2; // Move down
            } else { // Otherwise
                y-=speed/2; // Move up
            }
        } else if (choice <= .625) { // 12.5% Probability
            y-=speed; // Move up
        } else if (choice <= .75) { // 12.5% Probability
            y+=speed; // Move down
        } else if (choice <= .875) { // 12.5% Probability
            x+=speed; // Move right
        } else { // 12.5% Probability
            x-=speed; // Move left
        }
    }

    void display() {
        ellipse(x, y, size, size);
    }
}