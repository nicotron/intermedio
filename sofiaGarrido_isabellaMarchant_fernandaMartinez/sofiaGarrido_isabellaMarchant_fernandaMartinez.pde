// Variables Globales
float x, y;
color primero, segundo, tercero, cuarto, quinto, sexto, septimo, octavo, noveno,
rojo, naranjo, amarillo, verde, cian, azul, purpura, negro, blanco;
int filas, columnas;
char lastKeyPressed = '0';
int formaGrandeActual = 0;             // Formas centro (tecla 1)
int formaPequeñaActual = 0;            // Formas pequeña centro (tecla 2)
int formaEsquinaActual = 0;            // Formas esquinas (tecla 3)
boolean crearGrilla = false;           // Bandera para crear la grilla

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
  
  if (!crearGrilla) {
    dibujarMosaico(); // Dibuja una única composición
  } else {
    crearMosaicoGrilla(); // Crea la grilla de mosaicos
  }
}

// Teclas
void keyPressed() {
  if (key == '1') {
    formaGrandeActual = (formaGrandeActual + 1) % 8; // Cambiar forma grande
  } else if (key == '2') {
    formaPequeñaActual = (formaPequeñaActual + 1) % 8; // Cambiar forma pequeña
  } else if (key == '3') {
    formaEsquinaActual = (formaEsquinaActual + 1) % 8; // Cambiar forma esquina
  } else if (key == ' ') {
    crearGrilla = !crearGrilla; // Activa o desactiva la creación de grilla
  } else if (keyCode == 112) { // todo esto es para sacar pantallazos con tiempo
    int s = second(); // Valores de 0 - 59
    int m = minute(); // Valores de 0 - 59
    int h = hour(); // Valores de 0 - 23

    saveFrame("intermedio_sofiaGarrido_isabellaMarchant_fernandaMartinez" + str(h) + str(m) + str(s) + ".png");
  }
}

// Dibuja el mosaico original
void dibujarMosaico() {
  dibujarFormaGrande(formaGrandeActual);             // Formas grandes (tecla 1)
  dibujarFormaPequeña(x, y, formaPequeñaActual, 2);  // Formas en el centro (tecla 2)

  // Formas en las esquinas (tecla 3)
  dibujarFormaPequeña(width * 0.3, height * 0.1, formaEsquinaActual, 0.9); 
  dibujarFormaPequeña(width * 0.7, height * 0.1, formaEsquinaActual, 0.9); 
  dibujarFormaPequeña(width * 0.3, height * 0.9, formaEsquinaActual, 0.9); 
  dibujarFormaPequeña(width * 0.7, height * 0.9, formaEsquinaActual, 0.9); 
}

// Crear grilla de 4x4 de mosaicos
void crearMosaicoGrilla() {
  for (int i = 0; i < columnas; i++) {
    for (int j = 0; j < filas; j++) {
      pushMatrix();
      translate(i * width / columnas, j * height / filas);
      scale(1.0 / columnas); // Escala las formas para que se ajusten a la grilla
      dibujarMosaico();
      popMatrix();
    }
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

// Funciones de formas grandes centradas
void Cuadrado() {
  fill(primero);
  noStroke();
  square(width * 0.5 - width * 0.2, height * 0.5 - width * 0.2, width * 0.4);
}

void Circulo() {
  fill(segundo);
  noStroke();
  circle(width * 0.5, height * 0.5, width * 0.4);
}

void Triangulo() {
  fill(tercero);
  noStroke();
  triangle(width * 0.5, height * 0.2, width * 0.3, height * 0.8, 
  width * 0.7, height * 0.8);
}

void Rombo() {
  fill(cuarto);
  noStroke();
  quad(width * 0.5 - width * 0.2, height * 0.5, width * 0.5, height * 0.9, 
  width * 0.5 + width * 0.2, height * 0.5, width * 0.5, height * 0.1);
}

void Rectangulo() {
  fill(quinto);
  noStroke();
  rect(width * 0.5 - width * 0.2, height * 0.5 - height * 0.15, 
  width * 0.4, height * 0.3);
}

void Pausa() {
  fill(sexto);
  noStroke();
  rect(width * 0.5 - width * 0.03, height * 0.35, width * 0.06, height * 0.3);
}

void Deltoide() {
  fill(septimo);
  noStroke();
  quad(width * 0.3, height * 0.5, width * 0.5, height * 0.7, width * 0.7, 
  height * 0.5, width * 0.5, height * 0.3);
}

void Ovalo() {
  fill(octavo);
  noStroke();
  ellipse(width * 0.5, height * 0.5, width * 0.35, height * 0.45);
}
