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

void redraw() {
  background(255);
  posX = padding;
  posY = padding;
}
