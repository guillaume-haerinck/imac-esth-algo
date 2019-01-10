void addGui() {
  cp5 = new ControlP5(this);
  List l = Arrays.asList("slash",
    "slash-medium",
    "empty", 
    "empty-full", 
    "fifty",
    "circle",
    "full", 
    "row-empty", 
    "row-fifty");

  cp5.addScrollableList("dropdown")
    .setPosition(0, 0)
    .setSize(100, 100)
    .setBarHeight(20)
    .setItemHeight(guiHeight)
    .addItems(l)
    .close();

  cp5.addSlider("lineHeightUnit")
    .setPosition(guiWidth, 0)
    .setSize(guiWidth, guiHeight)
    .setRange(1, 50)
    .setValue(20);
    
  cp5.addSlider("stepX")
    .setPosition(guiWidth * 2, 0)
    .setSize(guiWidth, guiHeight)
    .setRange(1, 50)
    .setValue(20);
    
  cp5.addSlider("stepY")
    .setPosition(guiWidth * 3, 0)
    .setSize(guiWidth, guiHeight)
    .setRange(1, 50)
    .setValue(20);
    
  cp5.addSlider("reduceHoleChance")
    .setPosition(guiWidth * 4, 0)
    .setSize(guiWidth, guiHeight)
    .setRange(-2.5, 2.5)
    .setValue(1.5);
    
  cp5.addSlider("alterheightChance")
    .setPosition(guiWidth * 5, 0)
    .setSize(guiWidth, guiHeight)
    .setRange(0, 5)
    .setValue(1);
    
  cp5.addSlider("padding")
    .setPosition(guiWidth * 6, 0)
    .setSize(guiWidth, guiHeight)
    .setRange(30, 300)
    .setValue(30);
    
  cp5.addButton("saveSVG")
     .setValue(0)
     .setPosition(SIZE_X - 100, SIZE_Y - 20)
     .setSize(100, 20);
     
  cp5.addButton("screenshot")
     .setValue(0)
     .setPosition(SIZE_X - 200, SIZE_Y - 20)
     .setSize(100, 20);
}

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

void saveSVG(int event) {
    bSaveSVG = true;
}

void screenshot(int event) {
    saveFrame("screenshots/screenshot-######.png");
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