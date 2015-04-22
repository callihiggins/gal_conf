Genome genome;
Genome newGenome;

double fitOne, fitTwo;
PImage mona;
int alpha = 75;
int elements = 11;
float mutationRate = 0.005; //0.1
float red1, red2, red3, green1, green2, green3, blue1, blue2, blue3, mutationCheck;
int pixelOne, pixelTwo;
int margins = 50;

void setup() {
  size(450, 275);
  mona = loadImage("mona.jpg");
  fill(255);
  noStroke();
  rect(0, 0, width / 2, height);
  genome = new Genome();
}


void draw() {
  frameRate(10);
  fitOne = fitness(genome.triangles);
  fitTwo = fitness(mutate(genome.triangles));

  if (fitOne > fitTwo ) {
    //copy 
    println("fitonebigger" + frameCount);
    genome.replace(mutate(genome.triangles));
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


Triangle[] mutate(Triangle[] tri) {
  for (int i = 0; i < tri.length; i++) {
    for (int j = 0; j < elements; j++) {
      mutationCheck = random(0, 1);
      if ( mutationCheck <= mutationRate) {
        if (j == 0) {
          tri[i].x1 = int(random(width / 2 - margins, width + margins));
        } 
        if (j == 1) {
          tri[i].x2 = int(random(width / 2 - margins, width + margins));
        } 
        if (j == 2) {
          tri[i].x3 = int(random(width / 2 - margins, width + margins));
        } 
        if (j == 3) {
          tri[i].x4 = int(random(width / 2 - margins, width + margins));
        } 
        if (j == 4) {
          tri[i].y1 = int(random(0, height));
        } 
        if (j == 5) {
          tri[i].y2 = int(random(0, height));
        } 
        if (j == 6) {
          tri[i].y3 = int(random(0, height));
        } 
        if (j == 7) {
          tri[i].y4 = int(random(0, height));
        } 
        if (j == 8) {
          tri[i].r = int(random(0, 255));
        } 
        if (j == 9) {
          tri[i].g = int(random(0, 255));
        } 
        if (j == 10) {
          tri[i].b = int(random(0, 255));
        }
      }
    }
  }

    return tri;
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

