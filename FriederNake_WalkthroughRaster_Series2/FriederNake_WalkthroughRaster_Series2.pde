float stepX = 20.0;
float stepY = 20.0;
int lineHeight = 0;
float padding = 30;
float posX = padding;
float posY = padding;

final int SIZE_X = 640 - (int) padding;
final int SIZE_Y = 640 - (int) padding;

void setup() {
  size(640, 640);
  background(255);
  stroke(0);
  strokeWeight(4);
}

void draw() {
  while(posX < SIZE_X) { // Columns
    while(posY < SIZE_Y) { // Rows
      // Vertical lines
      lineHeight = (int) random(1, 7) * 20;
      float posYend = posY + lineHeight;
      if (posYend > SIZE_Y) { posYend = SIZE_Y; }
      line(posX, posY, posX, posYend);
 //<>//
      // Horizontal lines
      if (posY <= SIZE_Y) {
        if ((random(0, 10) > 6)) {
          line(posX, posY, posX + stepX, posY);
        }
      }
      posY += lineHeight + stepY;
    }
    posY = padding;
    posX += stepX;
  }
}
