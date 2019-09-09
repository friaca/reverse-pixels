PImage img;
int largura = 1920;
int altura = 1080;
int[] linhas = getLines(largura, altura);

void setup() {
  size(1920, 1080);
  img = loadImage("flume.png");
  linhas = getLines(largura, altura);
}

void draw() {
  background(0);
  image(img, 0, 0);
  inverter();
}

int[] getLines(int w, int h) {
  int j = 1;
  int size = w * h;
  IntList lines = new IntList();
  
  for (int i = 0; i < size; i += w) {
    lines.append(w * j++);
  }
  
  return lines.array();
}

void inverter() {
  int i = 0, j = 0;
  //int linha = 0;
  loadPixels();
  
  for (i = 0; i < linhas.length - 1; i++) {
    for (j = linhas[i]; j < linhas[i + 1]; j++) {
      if (i % 2 == 0) {
        if(j % 2 != 0) {
          pixels[j] = 0xffffff - pixels[j];
        }
      } else {
        if(j % 2 == 0) {
          
          pixels[j] = 0xffffff - pixels[j];
        }
      }
    }
  }
  
  updatePixels();
  
}
