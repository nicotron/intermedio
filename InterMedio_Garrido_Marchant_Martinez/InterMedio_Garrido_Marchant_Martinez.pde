/* UNIACC
 labdestec
 proyecto F.I.S.
 
 Sofia Garrido A.
 Isabella Marchant M.
 Fernanda Martinez U.
 
 El proyecto permitirá al usuario crear mosaicos con formas geometricas
 de diferentes colores, con la tecla 1 cambia la froma de la figura de fondo
 con la tecla 2 cambia la forma de la figura del centro y con la tecla 3 cambia 
 la forma de las figuras de las esquinas, con la tecla Z crean
 repeticiones del mosaico en grillas de 4x4 y con la tecla X guardan una imagen
 del mosaico terminado.
 
 Actualmente falta posicionar bien centradas las figuras grandes del centro,
 crear las grillas con la Z y guardar con la X. intentamos reducir el codigo
 lo maximo posible ya que el primer intento tuvo mas de 500 lineas y aun no 
 hacia ni la mitad del trabajo.
 */
 
// Variables Globales
float x, y;
color primero, segundo, tercero, cuarto, quinto, sexto, septimo, octavo, noveno,
rojo, naranjo, amarillo, verde, cian, azul, purpura, negro, blanco;
int filas, columnas;
char lastKeyPressed = '0';
int formaGrandeActual = 0;             // Formas centro (tecla 1)
int formaPequeñaActual = 0;            // Formas pequeña centro (tecla 2)
int formaEsquinaActual = 0;            // Formas esquinas (tecla 3)

// Configuraciones
void setup () {
  size(1440, 900);                     // canvas
  x = width / 2;                       // posición en x
  y = height / 2;                      // posición en y
  columnas = 4;
  filas = 4;

// Colores
  rojo = color(247,50,11);
  naranjo = color(254,181,0);
  amarillo = color(255,217,0);
  verde = color(140,208,92);
  cian = color(112,213,231);
  azul = color(0,181,217);
  purpura = color(178,112,188);
  negro = color(0, 0, 0);
  blanco = color(255, 255, 255);
  primero = rojo;
  segundo = naranjo;
  tercero = amarillo;
  cuarto = verde;
  quinto = cian;
  sexto = azul;
  septimo = purpura;
  octavo = negro;
  noveno = blanco;
}

void draw() {
  background(noveno);
  
  dibujarFormaGrande(formaGrandeActual);             // Formas grandes (tecla 1)
  dibujarFormaPequeña(x, y, formaPequeñaActual, 2);  // Formas en el centro (tecla 2)

// Formas en las esquinas (tecla 3)
  // esquina superior izquierda
  dibujarFormaPequeña(width * 0.3, height * 0.1, formaEsquinaActual, 0.9); 
  // esquina superior derecha
  dibujarFormaPequeña(width * 0.7, height * 0.1, formaEsquinaActual, 0.9); 
  // esquina inferior izquierda
  dibujarFormaPequeña(width * 0.3, height * 0.9, formaEsquinaActual, 0.9); 
  // esquina inferior derecha
  dibujarFormaPequeña(width * 0.7, height * 0.9, formaEsquinaActual, 0.9); 
}

// Teclas
void keyPressed() {
  if (key == '1') {
    formaGrandeActual = (formaGrandeActual + 1) % 8; // Cambiar forma grande
  } else if (key == '2') {
    formaPequeñaActual = (formaPequeñaActual + 1) % 8; // Cambiar forma pequeña
  } else if (key == '3') {
    formaEsquinaActual = (formaEsquinaActual + 1) % 8; // Cambiar forma esquina
  }
}


void dibujarFormaGrande(int indiceForma) {
  switch (indiceForma) {
    case 0: Cuadrado(); break;
    case 1: Circulo(); break;
    case 2: Triangulo(); break;
    case 3: Rombo(); break;
    case 4: Rectangulo(); break;
    case 5: Pausa(); break;
    case 6: Deltoide(); break;
    case 7: Ovalo(); break;
  }
}

void dibujarFormaPequeña(float centroX, float centroY, int indiceForma, 
  float factorTamaño) {
  float tamañoPequeño = 0.1 * width * factorTamaño;

  switch (indiceForma) {
    case 0:
      fill(primero);
      noStroke();
      square(centroX - tamañoPequeño / 2, centroY - tamañoPequeño / 2,
      tamañoPequeño);
      break;
    case 1:
      fill(segundo);
      noStroke();
      circle(centroX, centroY, tamañoPequeño);
      break;
    case 2:
      fill(tercero);
      noStroke();
      triangle(centroX, centroY - tamañoPequeño / 2, centroX - tamañoPequeño / 2,
      centroY + tamañoPequeño / 2, centroX + tamañoPequeño / 2, 
      centroY + tamañoPequeño / 2);
      break;
    case 3:
      fill(cuarto);
      noStroke();
      quad(centroX - tamañoPequeño / 2, centroY, centroX, centroY + tamañoPequeño / 2,
      centroX + tamañoPequeño / 2, centroY, centroX, centroY - tamañoPequeño / 2);
      break;
    case 4:
      fill(quinto);
      noStroke();
      rect(centroX - tamañoPequeño / 2, centroY - tamañoPequeño / 2,
      tamañoPequeño, tamañoPequeño * 0.8);
      break;
    case 5:
      fill(sexto);
      noStroke();
      rect(centroX - tamañoPequeño / 8, centroY - tamañoPequeño / 2,
      tamañoPequeño / 4, tamañoPequeño);
      break;
    case 6:
      fill(septimo);
      noStroke();
      quad(centroX - tamañoPequeño / 2, centroY - tamañoPequeño / 2, 
      centroX, centroY + tamañoPequeño / 2, centroX + tamañoPequeño / 2, 
      centroY - tamañoPequeño / 2, centroX, centroY - tamañoPequeño / 2);
      break;
    case 7:
      fill(octavo);
      noStroke();
      ellipse(centroX, centroY, tamañoPequeño, tamañoPequeño * 1.375);
      break;
  }
}

// Funciones de formas grandes
void Cuadrado() {
  fill(primero);
  noStroke();
  square(width * 0.3, height * 0.3, width * 0.4);
}

void Circulo() {
  fill(segundo);
  noStroke();
  circle(width * 0.5, height * 0.5, width * 0.4);
}

void Triangulo() {
  fill(tercero);
  noStroke();
  triangle(width * 0.5, height * 0.1, width * 0.3, height * 0.8, 
  width * 0.7, height * 0.8);
}

void Rombo() {
  fill(cuarto);
  noStroke();
  quad(width * 0.3, height * 0.5, width * 0.5, height * 0.9, width * 0.7, 
  height * 0.5, width * 0.5, height * 0.1);
}

void Rectangulo() {
  fill(quinto);
  noStroke();
  rect(width * 0.3, height * 0.4, width * 0.4, height * 0.4);
}

void Pausa() {
  fill(sexto);
  noStroke();
  rect(width * 0.4, height * 0.1, width * 0.1, height * 0.7);
  rect(width * 0.55, height * 0.1, width * 0.1, height * 0.7);
}

void Deltoide() {
  fill(septimo);
  noStroke();
  quad(width * 0.3, height * 0.4, width * 0.5, height * 0.9, width * 0.7, 
  height * 0.4, width * 0.5, height * 0.1);
}

void Ovalo() {
  fill(octavo);
  noStroke();
  ellipse(width * 0.5, height * 0.5, width * 0.4, height * 0.55);
}
