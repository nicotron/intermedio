/* UNIACC Halime Abdo e Ivanna Baron //<>//
 labdestec-i_ii_1_2
 Clase 7
 // Presentación intermedio
 crear un crucigrama, en base a celdas, para completar las palabras. Cuando se acierte con la palabra
 se cambia la tipografía (de una default a una que elijamos)
 También puede ser un juego donde la persona tenga un tiempo determinado para rellenar con un tema específico
 
 
 
 
 // Variables Globales
 */
int x= 2 ;
int y=2;
PFont tipografía;
int currentRow = 0;
int currentCol = 0;
int rows = 10;
int cols = 20;
String[][] matrix = new String[rows][cols];
color shadowColor = color(0, 0, 0, 50);  // Semi-transparent black for shadow
int matrixOffsetX = 2;  // X offset for the entire matrix
int matrixOffsetY = 2;  // Y offset for the entire matrix


void setup () {
  size(1440, 900 ); // tamaño canva pantalla completa
  fullScreen();
tipografía = loadFont("Suravaram-48.vlw");
textFont(tipografía);
  x = 0;     // posición en x
  y = 0;              // posición en y
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      matrix[i][j] = "";
    }
  }
}


void draw() {
  
  
  background (255);
  fill (0) ;
    textSize (30) ;
  text("desplazate con las flechas a traves del espacio", 60, 60); 
  highlightSelectedCell();

/* 
Los conceptos determinantes también serán aleatorios, presionando la tecla "space", es decir, el tema 
cambiará cada vez que se presione
El mensaje que aparecerá es: Escribe una palabra que te recuerda a "concepto"
La palabra "concepto" es lo unico que cambiará

Luego, el usario deberá:
Escribir acerca de conceptos de manera libre siempre y cuando este relacionado con el concepto (todavía hay que definirlos)
de manera horizontal, vertical y diagonal a través de las celdas. El programa le otorgará un inicio 
aleatorio al usuario pero queda a decisión del usuario la orientación y dirección de la palabra
El programa otorgará al menos 3 tipografías que se activarán de forma aleatoria al presionar "enter"

El usuario podrá desplazarse entre las celdas
*/
  for (x=2; x<rows +2; x++) {
    for (y=2; y<cols +2; y++) {
      noFill();
      stroke(127);
      rect(y*60, x*60, 60, 60); // lo de adentro
      float xWithOffSet = matrixOffsetX + y * cellSize + cellSize/2;
      float yWithOffSet = matrixOffsetY + x * cellSize + cellSize/2;
      fill(0);  // Black text color
      textSize(30);
      text(matrix[x - matrixOffsetX][y- matrixOffsetY], xWithOffSet,yWithOffSet); //<>//
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP && currentRow > 0) {
      currentRow--;
    } else if (keyCode == DOWN && currentRow < rows - 1) {
      currentRow++;
    } else if (keyCode == LEFT && currentCol > 0) {
      currentCol--;
    } else if (keyCode == RIGHT && currentCol < cols - 1) {
      currentCol++;
    }
  } else {
    if (key == BACKSPACE && matrix[currentRow][currentCol].length() > 0) {
      matrix[currentRow][currentCol] = matrix[currentRow][currentCol].substring(0, matrix[currentRow][currentCol].length() - 1);
    } else if (key >= 32 && key <= 126) {
      matrix[currentRow][currentCol] = String.valueOf(key);
    }
  }
  draw();
}

int cellSize = 60;
void highlightSelectedCell() {
  fill(shadowColor);
  rect((matrixOffsetX + currentCol) * cellSize, (matrixOffsetY + currentRow) * cellSize, cellSize, cellSize);
  
  // Draw the selected cell with a slight offset to create a "raised" effect
  fill(240);  // Slightly darker than background for contrast
  rect((matrixOffsetX + currentCol) * cellSize - 1, (matrixOffsetY + currentRow) * cellSize - 1, cellSize, cellSize);
  
  // Draw a subtle border
  noFill();
  stroke(180);
  rect((matrixOffsetX + currentCol) * cellSize - 1, (matrixOffsetY + currentRow) * cellSize - 1, cellSize, cellSize);
}

void drawValues() {
  fill(0);  // Black text color
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      text(matrix[i][j], (matrixOffsetX + j) * cellSize + cellSize/2, matrixOffsetY + i * cellSize + cellSize/2);
    }
  }
}
void printMatrix() {
  println("Current Matrix State:");
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      print(matrix[i][j] + "\t");
    }
    println();
  }
  println();
}
