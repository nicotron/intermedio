//Zarinka Ivanovich _ Antonia Parga
 
//la tecla 1 cambia los colores de la imagen que esta arriba a la derecha 
//la tecla 2 cambia los colores de la imagen que esta abajo a la derecha 
//la tecla 3 cambia los colores de la imagen que esta abajo a la izquierda 
//la tecla 4 cambia los colores de la imagen que esta arriba a la izquierda


   
PImage img; // Variable para la imagen
int[] colores = new int[4]; // para almacenar los colores
int ancho, alto; // Alto del cuadro

void setup() {
  size(1440, 900);
  fullScreen();
  img = loadImage("marilyn 1.jpg"); // Carga la imagen
  alto = height/2;
  ancho = alto;
  img.resize(ancho, alto); // Redimensiona la imagen al tamaño del cuadro
  
  // Inicializa los colores aleatorios
  for (int i = 0; i < 4; i++) {
    colores[i] = color(random(255), random(255), random(255));
  }
}

void draw() {
  background(255);
  // Dibuja la imagen y aplica los colores
  pushMatrix();
  translate((width-height)/2, 0);
  for (int i = 0; i < 4; i++) {
    tint(colores[i]); // Aplica el color al cuadrado
    image(img, (i % 2) * ancho, (i / 2) * alto, ancho, alto);
  }
  popMatrix();
}

// Detecta la tecla presionada
void keyPressed() {
  if (key == '1') {
    colores[0] = color(random(255), random(255), random(255)); // Cambia el color del cuadrado superior izquierdo
  } else if (key == '2') {
    colores[1] = color(random(255), random(255), random(255)); // Cambia el color del cuadrado superior derecho
  } else if (key == '3') {
    colores[2] = color(random(255), random(255), random(255)); // Cambia el color del cuadrado inferior izquierdo
  } else if (key == '4') {
    colores[3] = color(random(255), random(255), random(255)); // Cambia el color del cuadrado inferior derecho
  }
   if (keyCode == 112) {
    int s = second();  // Valores de 0 - 59
    int m = minute();  // Valores de 0 - 59
    int h = hour();    // Valores de  0 - 23
    saveFrame("intermedio_antoniaParga_zarinkaIvanovich_"+str(h)+str(m)+str(s)+".png");
  }
}
