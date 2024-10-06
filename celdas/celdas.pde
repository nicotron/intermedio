int columnas = 20;  // Número de columnas en la grilla
int filas = 11;     // Número de filas en la grilla
int tamanoCelda = 60;  // Tamaño de cada celda (60x60 píxeles)
int columnaSeleccionada = 0;  // Columna actualmente seleccionada
int filaSeleccionada = 0;     // Fila actualmente seleccionada
char[][] contenidoGrilla = new char[columnas][filas];  // Matriz para almacenar los caracteres en la grilla
boolean[][] celdasBloqueadas = new boolean[columnas][filas];  // Matriz para identificar celdas bloqueadas (negras)

void setup() {
  size(1440, 900);  // Tamaño del canvas 1400x900

  // Inicializar todas las celdas de la grilla con un espacio vacío ' '
  for (int i = 0; i < columnas; i++) {
    for (int j = 0; j < filas; j++) {
      contenidoGrilla[i][j] = ' ';  // Cada celda comienza vacía (sin caracteres)

      // Generar algunas celdas negras de forma aleatoria
      if (random(1) < 0.1) {  // Aproximadamente el 10% de las celdas serán negras
        celdasBloqueadas[i][j] = true;  // Marcar la celda como bloqueada
      } else {
        celdasBloqueadas[i][j] = false;  // Celda desbloqueada (puede escribir)
      }
    }
  }
}

void draw() {
  background(255);  // Fondo blanco

  // Dibujar la grilla completa
  for (int i = 0; i < columnas; i++) {
    for (int j = 0; j < filas; j++) {
      int x = i * tamanoCelda;  // Posición X de la celda
      int y = j * tamanoCelda;  // Posición Y de la celda

      if (celdasBloqueadas[i][j]) {
        fill(0);  // Colorear la celda de negro si está bloqueada
      } else if (i == columnaSeleccionada && j == filaSeleccionada) {
        fill(200, 200, 255);  // Colorear la celda seleccionada (resaltada)
      } else {
        fill(255);  // Colorear la celda de blanco si está desbloqueada y no seleccionada
      }
      stroke(0);  // Bordes negros para todas las celdas
      rect(x, y, tamanoCelda, tamanoCelda);  // Dibujar la celda

      // Dibujar el carácter en la celda (si no está bloqueada)
      if (!celdasBloqueadas[i][j]) {
        fill(0);  // Color del texto (negro)
        textAlign(CENTER, CENTER);  // Alinear el texto al centro de la celda
        text(contenidoGrilla[i][j], x + tamanoCelda / 2, y + tamanoCelda / 2);  // Dibujar el carácter en la celda
      }
    }
  }
}

void keyPressed() {
  // Mover la selección con las teclas de flechas
  if (keyCode == LEFT) {
    columnaSeleccionada = max(0, columnaSeleccionada - 1);  // Mover a la izquierda, sin salir del límite
  } else if (keyCode == RIGHT) {
    columnaSeleccionada = min(columnas - 1, columnaSeleccionada + 1);  // Mover a la derecha, sin salir del límite
  } else if (keyCode == UP) {
    filaSeleccionada = max(0, filaSeleccionada - 1);  // Mover hacia arriba, sin salir del límite
  } else if (keyCode == DOWN) {
    filaSeleccionada = min(filas - 1, filaSeleccionada + 1);  // Mover hacia abajo, sin salir del límite
  } else if (key != CODED && !celdasBloqueadas[columnaSeleccionada][filaSeleccionada]) {
    // Si se presiona una tecla alfanumérica y la celda no está bloqueada, insertar el carácter
    contenidoGrilla[columnaSeleccionada][filaSeleccionada] = key;
  }
}