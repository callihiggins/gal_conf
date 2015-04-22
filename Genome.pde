class Genome {

  Triangle[] triangles = new Triangle[120];
  Triangle[] duplicated = new Triangle[120];

  Genome() {
    for (int i = 0; i < triangles.length; i++) {
      triangles[i] = new Triangle();
      // maybe objects in an array need to be init before copying 
      duplicated[i] = new Triangle();
    }
  }

  Triangle[] duplicate() {
    //copy array
    //    for (int i=0; i< triangles.length; i++) {
    //      duplicated[i] = this.triangles[i];
    //    }
    //    return duplicated;

    arrayCopy(triangles, duplicated);
    return duplicated;
  }

  void replace(Triangle[] replaceThis) {
    for (int i=0; i< triangles.length; i++) {
      this.triangles[i] = replaceThis[i];
    }
  }
}

