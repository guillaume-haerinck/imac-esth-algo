float stepX = 2.0;
float stepY = 2.0;
float stepVariation = 1.0;
float lineHeight = 50;
float posX = 0;
float posY = 0;
final int SIZE_X = 640;
final int SIZE_Y = 360;

void setup() {
  size(SIZE_X, SIZE_Y);
  background(255);
}

void draw() {
  while(posY < SIZE_Y) {
    while(posX < SIZE_X) {
    
    }
    posX = 0;
    posY += stepX;
  }
}
