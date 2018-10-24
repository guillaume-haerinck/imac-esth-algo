float stepX = 50.0;
float stepY = 50.0;
float heightVariation = 1.0;
float lineHeight = 50;
float posX = 0;
float posY = 0;
final int SIZE_X = 640;
final int SIZE_Y = 360;

void setup() {
  size(640, 360);
  background(255);
  
  stroke(0);
  strokeWeight(4);
}

void draw() {
  stroke(0);
  strokeWeight(4);
  
  while(posX < SIZE_X) {
    while(posY < SIZE_Y) {
      line(posX, posY, posX, posY + (lineHeight * heightVariation)); //<>//
      posY += posY + (lineHeight * heightVariation) + stepY;
    }
    posY = 0;
    posX += stepX;
  }
}
