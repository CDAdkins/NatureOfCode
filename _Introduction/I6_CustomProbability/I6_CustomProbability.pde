int numRectangles; // Number of rectangles we're going to have
int[] randomNumbers; // Array to hold our randomly generated numbers
int chosenNum; // The number that has been randomly selected
int p; // Number to decide whether or not the chosenNum is picked.
int generations; // The number of random numbers you want to generate per frame. More is faster.
boolean pause = false;

void setup() {
    size(1000, 700);
    background(24);
    fill(100, 100, 100);
    textSize(height / 30);
    

    numRectangles = 100; // Changing this number will not break the visuals, go for it
    randomNumbers = new int[numRectangles]; // Creating an array to hold the generated numbers
    generations = 25; // Changing this number increases / decreases the speed of the sim

}

void draw() {
    text("Y=X^2 Distribution between 0 and " + numRectangles, (width/3), height/2);

    if (!pause) {
        for (int i = 0; i < generations; i++) { // This code runs once per 'generation' defined above 
            // chosenNum = int(random(0, numRectangles)); // This is where we generate a random number with a min of 0
            randomNumbers[choseNumber()]--;               // and a max based on the number of rectangles.
        }

        for (int i = 0; i < numRectangles; i++) { // Goes through every rectangle and redraws it with a new height based on the value of the corresponding int in randomNumbers.
            rect(i * (width/numRectangles), height, width/numRectangles, randomNumbers[i]);
        }  
    }


}

int choseNumber() {
    while(true) {
        p = int(random(100)); // p is a random int from 0-100
        chosenNum = int(random(100*100));

        if (chosenNum < p*p) {
            return p;
        }
    }
}

void keyPressed() {
    if (pause) {
        pause = false;
    } else {
        pause = true;
    }
}