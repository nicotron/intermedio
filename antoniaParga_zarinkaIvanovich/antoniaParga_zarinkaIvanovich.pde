//Zarinka Ivanovich _ Antonia Parga

 
//la tecla A cambia los colores de la imagen que esta arriba a la derecha 
//la tecla D cambia los colores de la imagen que esta abajo a la derecha 
//la tecla S cambia los colores de la imagen que esta abajo a la izquierda 
//la tecla W cambia los colores de la imagen que esta arriba a la izquierda


   
PImage img; // Variable para la imagen
int[] colores = new int[4]; // para almacenar los colores
int ancho = 400; // Ancho del cuadro
int alto = 400; // Alto del cuadro

void setup() {
  size(1440, 900);
  //fullScreen();
  img = loadImage("marilyn 1.jpg"); // Carga la imagen
  img.resize(ancho, alto); // Redimensiona la imagen al tamaño del cuadro
  
  // Inicializa los colores aleatorios
  for (int i = 0; i < 4; i++) {
    colores[i] = color(random(255), random(255), random(255));
  }
}

void draw() {
  background(255);
  
  // Dibuja la imagen y aplica los colores
  for (int i = 0; i < 4; i++) {
    tint(colores[i]); // Aplica el color al cuadrado
    image(img, (i % 2) * ancho, (i / 2) * alto, ancho, alto);
    noTint(); // Resetea el tinte
  }
}

// Detecta la tecla presionada
void keyPressed() {
  if (key == 'w' || key == 'W') {
    colores[0] = color(random(255), random(255), random(255)); // Cambia el color del cuadrado superior izquierdo
  } else if (key == 'a' || key == 'A') {
    colores[1] = color(random(255), random(255), random(255)); // Cambia el color del cuadrado superior derecho
  } else if (key == 's' || key == 'S') {
    colores[2] = color(random(255), random(255), random(255)); // Cambia el color del cuadrado inferior izquierdo
  } else if (key == 'd' || key == 'D') {
    colores[3] = color(random(255), random(255), random(255)); // Cambia el color del cuadrado inferior derecho

  }
    if (key == 'p') {

      int s = second();  // Valores de 0 - 59

      int m = minute();  // Valores de 0 - 59

      int h = hour();    // Valores de  0 - 23

      saveFrame("intermedio"+str(h)+str(m)+str(s)+".png");

    }
  
  
}
