class Triangle {

  int x1, x2, x3, x4, y1, y2, y3, y4, r, g, b, pixelOne, pixelTwo;

  Triangle() {

    x1 = int(random(width / 2 - margins, width + margins));
    x2 = int(random(width / 2 - margins, width + margins));
    x3 = int(random(width / 2 - margins, width + margins));
    x4 = int(random(width / 2 - margins, width + margins));
    y1 = int(random(0, height));
    y2 = int(random(0, height));
    y3 = int(random(0, height));
    y4 = int(random(0, height));
    r = int(random(0, 255));
    g = int(random(0, 255));
    b = int(random(0, 255));
  }
}

