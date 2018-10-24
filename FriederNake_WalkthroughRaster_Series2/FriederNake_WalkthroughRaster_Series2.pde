float stepX = 50.0;
float stepY = 50.0;
float heightVariation = 1.0;
float lineHeight = 50;
float posX = stepX;
float posY = stepY;
float random = 0;
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
      lineHeight = random(10, 200); // TODO random by step
      line(posX, posY, posX, posY + (lineHeight * heightVariation)); //<>//
      
      random = random(0, 10);
      if (random > 7) {
        line(posX, posY, posX + stepX, posY);
      }
      
      posY += (lineHeight * heightVariation) + stepY;
    }
    posY = stepY;
    posX += stepX;
  }
}
