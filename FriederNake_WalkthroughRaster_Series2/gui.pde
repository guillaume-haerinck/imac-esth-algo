void loadDistributionImage(String imageName) {
  try {
    distributionImage = loadImage("./distribution/" + imageName + ".png");
    if (distributionImage == null) { exit(); }
  } catch (Exception e) {
    println(e);
  }
}

void dropdown(int n) {
  redraw();
  Map selectedItem = cp5.get(ScrollableList.class, "dropdown").getItem(n);
  loadDistributionImage(selectedItem.get("name").toString());
}

void lineHeightUnit(int n) {
  lineHeightUnit = n;
  redraw();
}

void stepX(float n) {
  stepX = n;
  redraw();
}

void stepY(float n) {
  stepY = n;
  redraw();
}

void reduceHoleChance(float n) {
  reduceHoleChance = n;
  redraw();
}

void alterheightChance(float n) {
  alterheightChance = n;
  redraw();
}

void padding(float n) {
  padding = n;
  redraw();
}

void redraw() {
  background(255, 255, 255);
  posX = padding;
  posY = padding + guiHeight;
}

void setLabelsToBlack() {
  cp5.getController("lineHeightUnit").getCaptionLabel().setColor(0);
  cp5.getController("lineHeightUnit").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("stepX").getCaptionLabel().setColor(0);
  cp5.getController("stepX").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("stepY").getCaptionLabel().setColor(0);
  cp5.getController("stepY").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("reduceHoleChance").getCaptionLabel().setColor(0);
  cp5.getController("reduceHoleChance").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("alterheightChance").getCaptionLabel().setColor(0);
  cp5.getController("alterheightChance").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("padding").getCaptionLabel().setColor(0);
  cp5.getController("padding").getCaptionLabel().align(ControlP5.CENTER, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
}
