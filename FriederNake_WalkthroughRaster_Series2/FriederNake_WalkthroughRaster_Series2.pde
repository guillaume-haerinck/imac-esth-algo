float stepX = 20.0;
float stepY = 20.0;
int lineHeightUnit = 20;
int lineHeightMultiplies[] = {1, 2, 4, 6};
float padding = 30;
float posX = padding;
float posY = padding;
int lineHeight = 0;

final int SIZE_X = 690 - (int) padding;
final int SIZE_Y = 690 - (int) padding;

void setup() {
  size(690, 690);
  background(255);
  stroke(0);
  strokeWeight(4);
}

void draw() {
  while(posX < SIZE_X) { // Columns
    while(posY < SIZE_Y) { // Rows
      // Vertical lines
      lineHeight = lineHeightUnit * lineHeightMultiplies[(int) random(lineHeightMultiplies.length)];
      float posYend = posY + lineHeight;
      if (posYend > SIZE_Y) { posYend = SIZE_Y; }
      line(posX, posY, posX, posYend);
 //<>//
      // Horizontal lines
      if ((posX + stepX) < SIZE_X) {
        if (posY <= SIZE_Y) {
          if ((random(0, 10) > 6)) {
            line(posX, posY, posX + stepX, posY);
          }
        }
      }
      posY += lineHeight + stepY;
    }
    posY = padding;
    posX += stepX;
  }
}
