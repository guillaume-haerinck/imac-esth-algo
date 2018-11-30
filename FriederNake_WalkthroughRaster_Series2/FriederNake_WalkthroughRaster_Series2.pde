// TODO baser la longueur des traits sur l'image comme leur spawn
// TODO faire moyenne des valeurs de l'image autour du point choppé
// TODO traits horizontaux sur le bas

/* Free to change values */
float stepX = 20.0;
float stepY = 20.0;
int lineHeightUnit = 20;
int lineHeightMultiplies[] = {1, 2, 4, 6, 8};
float padding = 30;
float reduceHoleChance = 1.5;

/* Good default, don't touch if you don't know */
float posX = padding;
float posY = padding;
int lineHeight = 0;
PImage distributionImage;
final int SIZE_X = 690 - (int) padding;
final int SIZE_Y = 690 - (int) padding;
final int MAX_COLOR = lineHeightMultiplies.length - 1;

void setup() {
  size(690, 690);
  background(255);
  stroke(0);
  strokeWeight(4);
  
  // Map every color from 0-255 to 0-100
  colorMode(RGB, MAX_COLOR);
  try {
    distributionImage = loadImage("./distribution/fifty-full.png");
    if (distributionImage == null) { exit(); }
  } catch (Exception e) {
    println(e);
  }
}

void draw() {  
  while(posX < SIZE_X) { // Columns
    while(posY < SIZE_Y) { // Rows
      // Draw or not based on image transparency on this area
      float distrib = alpha(distributionImage.get((int) posX, (int) posY));
      println(distrib); // debug
      if (random(MAX_COLOR) <  distrib + reduceHoleChance) {
        // Vertical lines
        int lineHeightMultipliesMiddle = lineHeightMultiplies.length / 2;
        
        // TODO ameliorer pour englober pour ne pas limiter a une range, mais juste avoir plus de
        // chance de tomber dedans
        if (distrib > lineHeightMultipliesMiddle) {
          lineHeight = lineHeightUnit * lineHeightMultiplies[(int) random(lineHeightMultipliesMiddle, lineHeightMultiplies.length)]; //<>//
        } else {
          lineHeight = lineHeightUnit * lineHeightMultiplies[(int) random(lineHeightMultipliesMiddle)];
        }
        
        float posYend = posY + lineHeight;
        if (posYend > SIZE_Y) { posYend = SIZE_Y; }
        line(posX, posY, posX, posYend);
        // Horizontal lines
        if ((posX + stepX) < SIZE_X) {
          if (posY <= SIZE_Y) {
            if ((random(10) > 6)) {
              line(posX, posY, posX + stepX, posY);
            }
          }
        }
      }
      posY += lineHeight + stepY;
    }
    posY = padding;
    posX += stepX;
  }
}
