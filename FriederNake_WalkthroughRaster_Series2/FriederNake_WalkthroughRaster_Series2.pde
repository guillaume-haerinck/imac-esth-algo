// TODO faire moyenne des valeurs de l'image autour du point choppé
// TODO traits horizontaux sur le bas

import controlP5.*;
import java.util.*;
ControlP5 cp5;

/* Free to change values */
float stepX = 20.0;
float stepY = 20.0;
int lineHeightUnit = 20;
int lineHeightMultiplies[] = {1, 2, 4, 6, 8};
float padding = 30;
float reduceHoleChance = 1.5;
float alterheightChance = 1;

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
  
  // Map every color from 0-255 to MAX_COLOR
  colorMode(RGB, MAX_COLOR);
  loadDistributionImage("circle");
  
  // Add the dropdown list
  cp5 = new ControlP5(this);
  List l = Arrays.asList("circle",
  "empty",
  "empty-full",
  "fifty",
  "full",
  "row-empty",
  "row-fifty");
  
  cp5.addScrollableList("dropdown")
     .setPosition(0, 0)
     .setSize(200, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(l);
}

void draw() {
  while(posX < SIZE_X) { // Columns //<>//
    while(posY < SIZE_Y) { // Rows
      float posXMapped = map(posX, 0f, SIZE_X, 0f, distributionImage.width);
      float posYMapped = map(posY, 0f, SIZE_Y, 0f, distributionImage.height);
      float distrib = getImageBrightnessNear(posXMapped, posYMapped, distributionImage);
      
      // Draw or not based on image brightness on this area
      if (random(MAX_COLOR) <  distrib + reduceHoleChance) {
        // Vertical lines
        float gaussian = randomGaussian() * distrib * alterheightChance;
        gaussian = constrain(gaussian, -lineHeightMultiplies.length + 1, lineHeightMultiplies.length - 1);
        if (gaussian < 0) { gaussian = -gaussian; }
        lineHeight = lineHeightUnit * lineHeightMultiplies[(int) gaussian]; //<>// //<>//
        
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

/* Drawing help functions */
float getImageBrightnessNear(float posX, float posY, PImage image) {
  // TODO
  return brightness(image.get((int) posX, (int) posY));
}
