/* UNIACC trabajo en grupo
 Alondra González, Isidora Alarcón, Viktor Santana, Fernanda González
 Figuras geométricas
 */

// Variables
color morado1, morado2, morado3, morado4, morado5;

//confiuración
void setup () {
  size(1440, 900);




  //colores
  morado1 = color(240, 203, 255);
  morado2 = color(255, 152, 255);
  morado3 = color(210, 98, 255);
  morado4 = color(195, 46, 255);
  morado5 = color(182, 0, 255);
}

void draw () {
  background (0);
  dibujo();
}

//dibujo modulo
void dibujo() {
  fill(morado5);
  stroke(morado5);
  circle(width*0.025, height*0.037, 60);

  fill(morado4);
  stroke(morado4);
  circle(width*0.038, height*0.037, 60);

  fill(morado3);
  stroke(morado3);
  circle(width*0.048, height*0.047, 60);
  
    fill(morado2);
  stroke(morado2);
  circle(width*0.052, height*0.062, 60);
  
   fill(morado1);
  stroke(morado1);
  circle(width*0.048, height*0.078, 60);
}
