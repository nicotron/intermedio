/* Laboratorio de Desarrollo Tecnológico
 Codigo #2: Figuras Geometricas regulares de n lados
 Constanza Beneventi - Daniel Moraga
 8 de octubre de 2024
*/


/*
I.  Código
 Interfaz que permite a los usuarios experimentar y ejercitarse
 en cuanto a figuras geométricas regulares y a la cantidad de vértices
 en cada uno de ellas.
 
 II. Cambiar al código
-Cambiar tipografia a Impact o Comic Sans. Tenga libertad de acción. 
No logramos ponernos de acuerdo asique por favor elija por nosotros la que le 
parezca mejor. Gracias :)
*/


// I. Variables Globales
color blanco, negro; // Crei variables de color 1 y 2
int forma = 0; // Almacena la figura

// II. Set ups - Configuraciones
void setup() {
  size(800, 800); // Genera canvas de 800x800 pixeles
  fullScreen();
  blanco = color(255, 255, 255);
  negro = color(0, 0, 0);
}

// III. Loops de dibujo
void draw() {
  background(negro); // Asigna color al fondo
  dibujo(width / 2, height / 2 + 80, 300, forma);
  mostrarNumero(); // Muestra el número del indicador
  mostrarNombre(); // Muestra el nombre de la figura
}

void keyPressed() {
  // Almacena el tipo de figura según la tecla presionada
  if (key >= '1' && key <= '9') {
    forma = key - '0'; // Convierte el carácter en un número
  }
}

void dibujo(float x, float y, float radio, int num) {
  fill(blanco); // Asigna color blanco
  stroke(blanco); // Cambia el color del contorno a blanco

  // Dibuja un punto
  if (num == 1) {
    circle(width / 2, height / 2 + 65, width / 120); // Circulo de 10 píxeles

  // Dibuja una línea
  } else if (num == 2) {
    line(width / 2 - width / 4, height / 2 + 65, width / 2 + width / 4, height / 2 + 65);
    circle(width / 2 - width / 4, height / 2 + 65, width / 120);
    circle(width / 2 + width / 4, height / 2 + 65, width / 120);

  // Dibuja polígonos
  } else if (num >= 3 && num <= 9) {
    beginShape();
    for (int i = 0; i < num; i++) {
      float angulo = TWO_PI / num * i;
      float verticeX = x + cos(angulo + radians(-90)) * radio;
      float verticeY = y + sin(angulo + radians(-90)) * radio;
      vertex(verticeX, verticeY);
      circle(verticeX, verticeY, width / 120); // Dibuja un círculo en cada vértice
    }
    endShape(CLOSE);
  }
}

void mostrarNumero() {
  fill(blanco);
  textSize(80);
  textAlign(RIGHT, TOP); // Alinea el texto a la derecha y arriba
  text(str(forma), width - 55, 40); // Muestra el número en la esquina superior derecha
}

void mostrarNombre() {
  fill(blanco);
  textSize(80);
  textAlign(CENTER, TOP); // Alinea el texto al centro y arriba
  String nombre = "";

  // Asigna el nombre de la figura según el número
  if (forma == 1) {
    nombre = "Punto";
  } else if (forma == 2) {
    nombre = "Línea";
  } else if (forma == 3) {
    nombre = "Triángulo";
  } else if (forma == 4) {
    nombre = "Cuadrado";
  } else if (forma == 5) {
    nombre = "Pentágono";
  } else if (forma == 6) {
    nombre = "Hexágono";
  } else if (forma == 7) {
    nombre = "Heptágono";
  } else if (forma == 8) {
    nombre = "Octágono";
  } else if (forma == 9) {
    nombre = "Eneágono";
  }

  text(nombre, width / 2, 40); // Muestra el nombre sobre la figura

// guardar con la letra p
  if (key == 'p') {
    int s = second();  // Valores de 0 - 59
    int m = minute();  // Valores de 0 - 59
    int h = hour();    // Valores de 0 - 23
    saveFrame("Constanza_Beneventi_Daniel_Moraga" + str(h) + str(m) + str(s) + ".png");
  }

}
