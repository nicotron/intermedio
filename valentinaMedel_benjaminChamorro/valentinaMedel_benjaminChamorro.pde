/*
UNIACC
benjaminCHamorro & valentinaMedel
Colores
Figura en movimiento, al mover el cursor de izq a der cambia su tamaño.
Con las teclas 1,2,3 y 0, cambia de paleta de color.
Al hacer click izq el fondo cambia de color.

Falta hacer que el fondo varíe entre más colores.
*/

//Variables Globales

float angle;
boolean bg; 
color morado, naranjo, amarillo, verde, azul;

//2 Configuraciones
void setup() {
  size(1440, 900);
  rectMode(CENTER);
  stroke(#000000);
  noStroke();
  
  //colores
  morado = color(#B200FF);
  naranjo = color(#FF9900);
  amarillo = color(#FFEA00);
  verde = color(#00FF0A);
  azul = color(#2100FF);
}

void draw() {
  
  pushMatrix();
  translate(width / 2, height / 2);
  float scaleVar = map(mouseX, 0, width, 0.5, 5);
  scale(scaleVar);
  for (int i = 0; i < 100; i++) {
    fill(i * 50, i * 100, i * 5);
    if (key == '1') {
      fill(i * 200, i * 10, i * 5, 90);
    } if(key == '2') {
      fill(i * 10, i * 200, i * 255, 10);
    } if (key == '3') {
      fill(i * 90, i * 50, i * 15, 50);
    }
    scale(0.95);
    rotate(radians(angle));
    rect(0, 0, 600, 600);
  }
  popMatrix();
  angle += map(mouseY, 0, height, -1, 1);
}

void keyPressed() {
  if (keyCode == 112) {
    int s = second();  // Valores de 0 - 59
    int m = minute();  // Valores de 0 - 59
    int h = hour();    // Valores de  0 - 23
    saveFrame("intermedio_valentinaMedel_benjaminChamorro"+str(h)+str(m)+str(s)+".png");
  }
}