// Figuras geométricas desde la subdivisión de un círculo

void setup() {
  size(1440, 900);
  background(255);
  
  // Llama a la función para dibujar diferentes polígonos
  fill(100, 150, 200);
  poligono(width/2, height/2, 200, 5);  // Polígono de 5 lados (pentágono)
  
  fill(200, 100, 150);
  poligono(width/2, height/2, 150, 4);  // Polígono de 7 lados (heptágono)
  
  fill(150, 200, 100);
  
 
  poligono(width/2, height/2, 100, 3);  // Polígono de 3 lados (triángulo)
  
}

void poligono(float x, float y, float radio, int lados) {
  
  beginShape();
  for (int i = 0; i < lados; i++) {
    float angulo = TWO_PI / lados * i;
    float verticeX = x + cos(angulo+radians(-90)) * radio;
    float verticeY = y + sin(angulo+radians(-90)) * radio;
    vertex(verticeX, verticeY);
  }
  endShape(CLOSE);
}
