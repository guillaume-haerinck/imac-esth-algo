// TODO if grey fifty pourcent chance to spawn only //<>//

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
int guiHeight = 20;
int guiWidth = 100;
float posX = padding;
float posY = padding + guiHeight;
int lineHeight = 0;
PImage distributionImage;
final int SIZE_X = 690;
final int SIZE_Y = 690;
final int MAX_COLOR = lineHeightMultiplies.length - 1;

void setup() {
  size(690, 690);
  background(255, 255, 255);
  stroke(0);
  strokeWeight(4);

  // Map every color from 0-255 to MAX_COLOR
  colorMode(RGB, MAX_COLOR);
  loadDistributionImage("slash-medium");

  // Add Graphical user interface
  addGui();
  setLabelsToBlack();
}

void draw() {
  while (posX < SIZE_X - padding) { // Columns
    while (posY < SIZE_Y - padding) { // Rows
      float posXMapped = map(posX, 0f, SIZE_X, 0f, distributionImage.width);
      float posYMapped = map(posY, 0f, SIZE_Y, 0f, distributionImage.height);
      float distrib = getImageBrightnessNear(posXMapped, posYMapped, distributionImage);

      // println(distrib);

      // Draw or not based on image brightness on this area
      if (random(MAX_COLOR) <  distrib + reduceHoleChance) {
        // Vertical lines
        float gaussian = randomGaussian() * distrib * alterheightChance;
        gaussian = constrain(gaussian, -lineHeightMultiplies.length + 1, lineHeightMultiplies.length - 1);
        if (gaussian < 0) { 
          gaussian = -gaussian;
        }
        lineHeight = lineHeightUnit * lineHeightMultiplies[(int) gaussian]; //<>//

        float posYend = posY + lineHeight;
        if (posYend > SIZE_Y - padding) { 
          posYend = SIZE_Y - padding;
        }
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
    posY = padding + guiHeight;
    posX += stepX;
  }
}

/* Drawing help functions */
float getImageBrightnessNear(float posX, float posY, PImage image) {
  float mediumBrightnessX = 0;
  float mediumBrightnessY = 0;
  
  float maxPos = posX + 10;
  if (maxPos > image.width) { maxPos =  image.width; }
  for (float i = posX; i < maxPos; i++) {
    mediumBrightnessX += image.get((int) posX, (int) posY);
  }
  mediumBrightnessX = mediumBrightnessX / maxPos;
  
  // println(mediumBrightnessX);
  
  maxPos = posY + 10;
  if (maxPos > image.height) { maxPos =  image.height; }
  for (float i = posX; i < maxPos; i++) {
    mediumBrightnessY += image.get((int) posX, (int) posY);
  }
  mediumBrightnessY = mediumBrightnessY / maxPos;
  
  return brightness((int) (mediumBrightnessX + mediumBrightnessY) / 2);
}
