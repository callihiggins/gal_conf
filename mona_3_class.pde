Genome[] genomes = new Genome[1];
Triangle[] genomeTest;
double fitOne, fitTwo;
PImage mona;
int alpha = 75;
int elements = 11;
float mutationRate = 0.005; //0.1
float red1, red2, red3, green1, green2, green3, blue1, blue2, blue3, mutationCheck;
int pixelOne, pixelTwo;
int margins = 50;

void setup() {
  size(350, 200);
  mona = loadImage("mona.jpg");
  for (int i = 0; i < genomes.length; i++) {
    genomes[i] = new Genome();
  }
}


void draw() {
  fitOne = fitness(genomes[0].triangles);
  genomeTest = genomes[0].duplicate();
  mutate(genomeTest);
  fitTwo = fitness(genomeTest);
  if (fitOne > fitTwo) {
    //copy 
    genomes[0].replace(genomeTest);
  }
  image(mona, 0, 0, width / 2, height);
}



void display(Triangle[] tri) {
  for (int i = 0; i < tri.length; i++) {
    // draw
    beginShape();
    fill(tri[i].r, tri[i].g, tri[i].b, alpha);
    noStroke();
    vertex(tri[i].x1, tri[i].y2);
    vertex(tri[i].x2, tri[i].y2);
    vertex(tri[i].x3, tri[i].y3);
    //vertex(tri[i].x4, tri[i].y4);
    endShape();
  }
}


void mutate(Triangle[] tri) {
  for (int i = 0; i < tri.length; i++) {
    for (int j = 0; j < elements; j++) {
      mutationCheck = random(0, 1);
      if (j == 0) {
        tri[i].x1 = int(random(width / 2 - margins, width + margins));
      } 
      mutationCheck = random(0, 1);
      if (j == 1) {
        tri[i].x2 = int(random(width / 2 - margins, width + margins));
      } 
      mutationCheck = random(0, 1);
      if (j == 2) {
        tri[i].x3 = int(random(width / 2 - margins, width + margins));
      } 
      mutationCheck = random(0, 1);
      if (j == 3) {
        tri[i].x4 = int(random(width / 2 - margins, width + margins));
      } 
      mutationCheck = random(0, 1);
      if (j == 4) {
        tri[i].y1 = int(random(0, height));
      } 
      mutationCheck = random(0, 1);
      if (j == 5) {
        tri[i].y2 = int(random(0, height));
      } 
      mutationCheck = random(0, 1);
      if (j == 6) {
        tri[i].y3 = int(random(0, height));
      } 
      mutationCheck = random(0, 1);
      if (j == 7) {
        tri[i].y4 = int(random(0, height));
      } 
      mutationCheck = random(0, 1);
      if (j == 8) {
        tri[i].r = int(random(0, 255));
      } 
      mutationCheck = random(0, 1);
      if (j == 9) {
        tri[i].g = int(random(0, 255));
      } 
      mutationCheck = random(0, 1);
      if (j == 10) {
        tri[i].b = int(random(0, 255));
      }
    }
  }
}


double fitness(Triangle[] tri) {

  double fitness = 0;
  float pixelFit = 0;
  fill(255);
  noStroke();
  rect(width / 2, 0, width, height);
  display(tri);
  for (int x = 0; x < width / 2; x = x + 3) {
    for (int y = 0; y < height; y = y + 2) {
      //original pixels
      pixelOne = get(x, y);
      red1 = red(pixelOne);
      green1 = green(pixelOne);
      blue1 = blue(pixelOne);
      if (y > height / 2) {
        //println("left:", "R", red1, "G", green1, "B", blue1);
        // println(" ");
      }
      //GA pixels
      pixelTwo = get(x + width / 2, y);
      red2 = red(pixelTwo);
      green2 = green(pixelTwo);
      blue2 = blue(pixelTwo);
      if (y > height / 2) {
        //println("Right:", "R", red2, "G", green2, "B", blue1);
      }
      //calculate fitness
      red3 = red1 - red2;
      green3 = green1 - green2;
      blue3 = blue1 - blue2;

      pixelFit = (red3 * red3) + (green3 * green3) + (blue3 * blue3); //sqrt(pow(red3, 2)  + pow(green3, 2) + pow(blue3, 2));
      fitness = fitness + pixelFit;
    }
  }
  return fitness; //The lower the better
}

