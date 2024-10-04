/* figuras geométricas*/

//variables globales
color amarillo1, amarillo2, amarillo3, amarillo4, amarillo5;
float x, y;
int columna, fila;

//configuraciones
void setup () {
  size (800, 800);
  noStroke();
  amarillo1 = color (252, 245, 161);
  amarillo2 = color ( 227, 218, 114);
  amarillo3 = color (193, 184, 76);
  amarillo4 = color (167, 158, 46);
  amarillo5 = color (139, 129, 13);
}

void draw () {
  background (0);
  dibujo ();
}

void dibujo () {
  // CUADRICULA SUPERIOR IZQUIERDA
  //circulo 1
  fill (amarillo5);
  circle ( width * 0.125, height * 0.125, height * 0.20);
  //circulo2
  fill (amarillo4);
  circle (width * 0.125 +width *0.0625, height * 0.125 + height *0.0625, height*0.20);
  //circulo 3
  fill (amarillo3);
  circle(width* 0.25, height * 0.25, height* 0.20);
  //circulo4
  fill (amarillo2);
  circle(width *0.25 + width *0.0625, height * 0.25 + height *0.062, height * 0.20);
  // circulo 5
  fill (amarillo1);
  circle (width *0.25 + width *0.125, height * 0.25+ height*0.125, height * 0.20);

  // CUADRICULA SUPERIOR DERECHA
  //circulo 1
  fill (amarillo5);
  circle (width * 0.5 + width * 0.125, height * 0.25 + height * 0.125, height * 0.20);
  // circulo 2
  fill (amarillo4);
  circle (width * 0.625 + width * 0.0625, height * 0.25 + height * 0.0625, height * 0.20);
  // circulo3
  fill (amarillo3);
  circle(width * 0.75, height * 0.25, height * 0.20);
  // circulo4
  fill(amarillo2);
  circle(width * 0.75 + width*0.0625, height * 0.125 + height * 0.0625, height * 0.20);
  //circulo 5
  fill (amarillo1);
  circle ( width * 0.75 + width * 0.125, height * 0.125, height * 0.20);
  
  //CUADRICULA INFERIOR IZQUIERDA
  //circulo1
 fill(amarillo5);
 circle (width * 0.25 + width * 0.125, height * 0.5 + height * 0.125, height * 0.20);
 //circulo2
 fill(amarillo4);
 circle ( width * 0.25 + width * 0.0625, height * 0.5 + height * 0.125 + height * 0.0625, height * 0.20);
 //circulo 3
 fill(amarillo3);
 circle(width * 0.25, height * 0.75, height * 0.20);
 //circulo4
 fill(amarillo2);
 circle(width * 0.125 + width * 0.0625, height * 0.75 + height * 0.0625, height * 0.20);
 //circulo 5
 fill (amarillo1);
 circle (width * 0.125, height * 0.75 + height * 0.125, height * 0.20);
 //CUADRICULA INFERIOR DERECHA
 //circulo1
  fill(amarillo5);
 circle(width * 0.75 + width * 0.125, height * 0.75 + height * 0.125,+height * 0.20);
 
 //circulo2
 fill (amarillo4);
 circle ( width * 0.75 + width * 0.0625, height * 0.75 + height * 0.0625, height *0.20);
 //circulo3
 fill(amarillo3);
 circle ( width * 0.75, height *  0.75, height * 0.20);
 //circulo 4
 fill(amarillo2);
 circle(width * 0.5 + width*0.125+ width * 0.0625 , height * 0.5 + height * 0.125 + height * 0.0625, height * 0.20);
 
 //circulo5
fill (amarillo1);
 circle(width * 0.5 + width * 0.125, height * 0.5 + height * 0.125, height * 0.20);
}
