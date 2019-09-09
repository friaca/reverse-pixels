////////////////////////////////////////////////////
// 1. Em linhas ímpares, inverta as cores dos pixels pares
// 2. Em linhas pares, inverta as cores dos pixels ímpares
////////////////////////////////////////////////////

PImage img;
String fileName = "rigby";
String ext = ".jpg";

//Cria o canvas que exibirá a imagem
void setup() {
  size(500, 474);
  img = loadImage(fileName + ext);
}

//Exibe a imagem
void draw() {
  background(0);
  image(img, 0, 0);
  inverter();
  save(fileName + "_inverted.jpg");
  noLoop();
}

color getInverseColor(color cor) {
  return color(Math.abs(red(cor) - 255), Math.abs(blue(cor) - 255), Math.abs(green(cor) - 255));  
}

//O método inverter itera por cada linha, e então por cada coluna e compara
//cada pixel e vê se ele condiz com os requisitos do desafio, se sim, chama 
//o getInverseColor para aquele pixel
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
