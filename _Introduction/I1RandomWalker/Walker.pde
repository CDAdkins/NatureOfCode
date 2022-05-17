class Walker {
    int xpos;
    int ypos;
    int size;

    color myColor;

    public Walker() {
        xpos = width/2;
        ypos = height/2;
        stroke(0);
        myColor = color(150, 150, 150, 255);
        fill(myColor);
        size = 10;
    }

        public Walker(int r, int g, int b, int aSize, int anAlpha) {
        xpos = width/2;
        ypos = height/2;
        size = aSize;
        stroke(0);
        noStroke();
        myColor = color(r, g, b, anAlpha);
        fill(myColor);
    }

    void display() {
        fill(myColor);
        rect(xpos, ypos, size, size);
    }

    void walk() {
        int choice = int(random(4));

        if (choice == 0 && xpos <= width) {
            xpos += size;
        } else if (choice == 1 && xpos >= 0) {
            xpos -= size;
        } else if (choice == 2 && ypos <= height) {
            ypos += size;
        } else if (choice == 3 && ypos >= 0) {
            ypos -= size;
        } else {
            return;
        }
    }
}