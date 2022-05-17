int numWalkers; // The number of walkers per color.
int walkerSize;
int walkerAlpha;

Walker[] redGuys;
Walker[] blueGuys;
Walker[] yellowGuys;

void setup() {
    fullScreen();
    noCursor();
    //size(400, 400);

    numWalkers = 100; // Change this to change the number of total walkers.
    walkerSize = 10; // Change this to change the size of each walker.
    walkerAlpha = 255; // Change this to change walker transparency.

    redGuys = new Walker[numWalkers];
    blueGuys = new Walker[numWalkers];
    yellowGuys = new Walker[numWalkers];


    for (int i = 0; i < numWalkers; i++) {
        redGuys[i] = new Walker(255, 0, 0, walkerSize, walkerAlpha);
        blueGuys[i] = new Walker(0, 0, 255, walkerSize, walkerAlpha);
        yellowGuys[i] = new Walker(255, 255, 0, walkerSize, walkerAlpha);
    }
    
    background(24);
}

void draw() {
    //background(24);
    for (int i = 0; i < numWalkers; i++) {
        redGuys[i].display();
        blueGuys[i].display();
        yellowGuys[i].display();

        redGuys[i].walk();
        //redGuys[i].walk();
        blueGuys[i].walk();
        //blueGuys[i].walk();
        //yellowGuys[i].walk();
        yellowGuys[i].walk();
    }
}