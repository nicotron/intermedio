/*evaluacion 2
 Jo y Tamy
 */

/* La idea seria que las figuras sean interactivas, utilizando el teclado .
 los colores estarán una escala de grises y se pondran cambiar las figuras 
 dependiendo la tecla que se precione. 
 La idea es hacer algo parecido al PATATAP, pero en escala de grises
 */


// variables globales
float x, y;
color principal, secundario, blanco;
boolean circulo, cuadrado;

// configuraciones
void setup () {
  size(1000, 1000);
  x = mouseX;
  y = mouseY;

  //colores
  principal = color(0, 0, 0); //negro
  secundario =color(100, 100, 100); //gris
  blanco =color(255, 255, 255);
}

//loop de dibujo
void draw() {
}
void keyReleased() {
  background(blanco);
}

void keyPressed() {
  //letra 'a' hace aparecer un cuadrado gris
  if (key == 'a' || key == 'A' == true) {
    background(blanco);
    fill(secundario);
    rect (width*0.20, height*0.40, 200, 200);
  }
  //letra 's' hace aparecer un circulo negro
  if (key == 's' || key == 'S' == true) {
    background(blanco);
    circle (width*0.70, height*0.50, 220);
  }
}

//
void cuadrado() {
  fill(secundario);
  square(width*0.55, height*0.55, 500);
}
void circulo() {
  fill(principal);
  circle(width*0.80, height*0.80, 500);
}
