class Genome {

  Triangle[] triangles = new Triangle[120];
  Triangle[] duplicated = new Triangle[120];

  Genome() {
    for (int i = 0; i < triangles.length; i++) {
      triangles[i] = new Triangle();
      duplicated[i] = new Triangle();
    }
  }

  Triangle[] duplicate() {
    arrayCopy(triangles, duplicated);
    return duplicated;
  }

  void replace(Triangle[] replaceThis) {
    arrayCopy(replaceThis, triangles);
  }
}

