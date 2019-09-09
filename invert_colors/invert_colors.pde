////////////////////////////////////////////////////
// 1. Em linhas ímpares, inverta as cores dos pixels pares
// 2. Em linhas pares, inverta as cores dos pixels ímpares
////////////////////////////////////////////////////

PImage img;
int largura = 500;
int altura = 474;

void setup() {
  size(500, 474);
  img = loadImage("rigby.jpg");
}

void draw() {
  background(0);
  image(img, 0, 0);
  inverter();
}

color getInverseColor(color cor) {
  return color(Math.abs(red(cor) - 255), Math.abs(blue(cor) - 255), Math.abs(green(cor) - 255));  
}

void inverter() {
  loadPixels();
  
  for(int i = 0; i < img.height; i++) {
    for(int j = 0; j < img.width; j++) {
      color curr = pixels[i * img.width + j];
      if(i % 2 == 0 && j % 2 != 0) {
        pixels[i * img.width + j] = getInverseColor(curr);
      }
      
      if(i % 2 != 0 && j % 2 == 0) {
        pixels[i * img.width + j] = getInverseColor(curr);
      }
    }
  }
  
  updatePixels();
}
