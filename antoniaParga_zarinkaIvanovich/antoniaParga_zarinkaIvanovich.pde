//Zarinka Ivanovich _ Antonia Parga
 
//la tecla 1 cambia los colores de la imagen que esta arriba a la derecha 
//la tecla 2 cambia los colores de la imagen que esta abajo a la derecha 
//la tecla 3 cambia los colores de la imagen que esta abajo a la izquierda 
//la tecla 4 cambia los colores de la imagen que esta arriba a la izquierda


   
PImage img; // Variable para la imagen
int cols = 8; // Número de columnas (tonos)
int rows = 4; // Número de filas (variaciones de saturación y brillo)
color[][] colors = new color[cols][rows]; // Matriz para almacenar los colores
int img0,img1,img2,img3,img4,img5,img6,img7;
void setup() {
  size(1440, 900);
  // fullScreen();
  img = loadImage("marilyn 1.jpg"); // Carga la imagen
  // alto = height/2;
  // ancho = alto;
  img.resize(360, 360); // Redimensiona la imagen al tamaño del cuadro
  
  // Inicializa los colores aleatorios
  colorMode(HSB, 360, 100, 100); // Modo HSB con un máximo de 360 para el tono
  
  // Llenar la matriz con colores
  for (int i = 0; i < cols; i++) {
    float hue = map(i, 0, cols, 0, 360); // Ajusta el tono según las columnas
    
    for (int j = 0; j < rows; j++) {
      float saturation = map(j, 0, rows - 1, 50, 100); // Varia la saturación entre 50 y 100
      float brightness = 100 - j * 40; // Reduce el brillo en cada fila
      colors[i][j] = color(hue, saturation, brightness); // Guarda el color en la matriz
    }
  }

}

void draw() {
  background(255);
  // Dibuja la imagen y aplica los colores
  pushMatrix();
  translate(0,90);  
    tint(colors[0][img0%rows]);
    image(img,0,0,360,360);

    tint(colors[1][img1%rows]);
    image(img,360,0,360,360);

    tint(colors[2][img2%rows]);
    image(img,360*2,0,360,360);

    tint(colors[3][img3%rows]);
    image(img,360*3,0,360,360);

    tint(colors[4][img4%rows]);
    image(img,0,360,360,360);

    tint(colors[5][img5%rows]);
    image(img,360,360,360,360);

    tint(colors[6][img6%rows]);
    image(img,360*2,360,360,360);

    tint(colors[7][img7%rows]);
    image(img,360*3,360,360,360);
  popMatrix();
}

// Detecta la tecla presionada
void keyPressed() {
  if (key == '1') {
    img0++;
  } else if (key == '2') {
    img1++;
  }else if (key == '3') {
    img2++;
  }else if (key == '4') {
    img3++;
  }else if (key == '5') {
    img4++;
  }else if (key == '6') {
    img5++;
  }else if (key == '7') {
    img6++;
  }else if (key == '8') {
    img7++;
  }
   if (keyCode == 112) {
    int s = second();  // Valores de 0 - 59
    int m = minute();  // Valores de 0 - 59
    int h = hour();    // Valores de  0 - 23
    saveFrame("intermedio_antoniaParga_zarinkaIvanovich_"+str(h)+str(m)+str(s)+".png");
  }
}
