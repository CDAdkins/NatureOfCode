// This program creates a random walker that tends to move down and to the right.
Walker guy;

void setup() {
    size(700, 700);
    background(24);
    guy = new Walker();
}

void draw() {
    guy.display();
    guy.walk();
}

class Walker {
    int x; // x position
    int y; // y position
    int size; // Size of square
    int choice; // Randomly generated number to decide the direction to walk.

    Walker() {
        x = width/2;
        y = height/2;
        size = 2;
    }

    void walk() {
        choice = int(random(6)); // Genreates a number between 0 and 5
        if (choice == 0) {
            x-=size; // Move Left
        } else if (choice == 1) {
            y-=size; // Move Up
        } else if (choice <= 3) { // If we roll a 2 or 3
            x+=size; // Move Right
        } else { // if we roll a 4 or 5
            y+=size; // move Down.
        }
    }

    void display() {
        rect(x, y, size, size);
    }
}