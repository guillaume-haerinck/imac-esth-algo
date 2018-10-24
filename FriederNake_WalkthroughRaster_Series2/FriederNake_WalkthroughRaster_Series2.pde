float stepX = 20.0;
float stepY = 20.0;
float padding = 30.0;
int lineHeight = 0;
float posX = padding;
float posY = padding;
final int SIZE_X = 640;
final int SIZE_Y = 640;

void setup() {
  size(640, 640);
  background(255);
  stroke(0);
  strokeWeight(4);
}

void draw() {
  while(posX < (SIZE_X - padding)) { // Columns
    while(posY < SIZE_Y) { // Rows
      // Vertical lines
      lineHeight = (int) random(1, 7) * 20;
      line(posX, posY, posX, posY + lineHeight); //<>//
      
      // Horizontal lines
      if ((random(0, 10) > 6) && (posY != padding)) {
        line(posX, posY, posX + stepX, posY);
      }
      posY += lineHeight + stepY;
    }
    posY = padding;
    posX += stepX;
  }
}
