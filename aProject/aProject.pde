Snake guy;

void setup() {
    fullScreen();
    //size(500, 500);
    background(24);

    guy = new Snake();
}

void draw() {

    guy.display();
}