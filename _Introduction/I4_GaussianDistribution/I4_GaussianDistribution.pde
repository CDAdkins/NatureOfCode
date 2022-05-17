
int numRectangles; // Number of rectangles we're going to have
int[] randomNumbers; // Array to hold our randomly generated numbers
int chosenNum; // The number that has been randomly selected
int generations; // The number of random numbers you want to generate per frame. More is faster.

void setup() {
    size(1000, 700);
    background(24);
    fill(100, 100, 100);
    textSize(height / 30);
    

    numRectangles = 100; // Changing this number will not break the visuals, go for it
    randomNumbers = new int[numRectangles]; // Creating an array to hold the generated numbers
    generations = 5; // Changing this number increases / decreases the speed of the sim

}

void draw() {
    text("Normal Distribution between with a mean of " + numRectangles/2 + " and standard deviation of " + numRectangles/9, (width/7), height/3);

    for (int i = 0; i < generations; i++) { // This code runs once per 'generation' defined above 
        chosenNum = (int)(randomGaussian() * numRectangles/10 + (numRectangles/2)); // This is where we generate a random number with a min of 0
        randomNumbers[chosenNum]--;               // and a max based on the number of rectangles.
    }

    for (int i = 0; i < numRectangles; i++) { // Goes through every rectangle and redraws it with a new height based on the value of the corresponding int in randomNumbers.
        rect(i * (width/numRectangles), height, width/numRectangles, randomNumbers[i]);
    }
}