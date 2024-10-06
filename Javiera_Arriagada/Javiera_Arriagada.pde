//Javiera Arriagada Midterm 
//Tipografia
//UNIACC lab.

//Grilla principal que muestre la tipografia (2*2) con sus variables y se puedan seleccionar
//Al seleccionar, lleva a otra pagina
//En una esquina que se muestre el nombre de la tipografia/variable
//En medio se podrá escribir el mensaje que el usuario desee
//Al apretar enter la frase se plasmará en la pantalla
//Con las flechas (Up/Down) se puede ir cambiando la variable para escribir mientras la palabra anterior sigue en pantalla
//Al apretar en la palabra volver, se regresa a la grilla

//Tipografia AlegreyaSans
//Bold, BoldItalic, Black, BlackItalic
//Problemas de licencia con la tipografia anterior (Vandertak)

//Variables
int cols = 2; // Número de columnas grilla
int rows = 2; // Número de filas grilla
int blockSize; // Tamaño de cada bloque grilla
PFont[] fonts; // Almacenar fuentes
String[] styles = {"Bold", "Bold Italic", "Black", "Black Italic"}; // variables para cada bloque
int selectedBlock = 0; // Índice del bloque seleccionado (inicializado en 0)
boolean typing = false; // Indica si se está en modo de escritura
String currentLine = ""; // Línea de texto actual
ArrayList<TextLine> lines = new ArrayList<TextLine>(); // Almacena líneas de texto y su fuente

//almacenar cada línea de texto y la fuente 
class TextLine {
  String text; // Texto de la línea
  PFont font; // Fuente utilizada

  TextLine(String text, PFont font) {
    this.text = text;
    this.font = font;
  }
}

void setup() {
  size(1440, 900);
  blockSize = width / cols; //Tamaño de cada bloque
  
  // Cargar estilos de fuentes (carpeta "data")
  fonts = new PFont[4]; //fuentes para 4 bloques
  fonts[0] = createFont("AlegreyaSans-Bold.ttf", 32); // Bold
  fonts[1] = createFont("AlegreyaSans-BoldItalic.ttf", 32); // Bold Italic
  fonts[2] = createFont("AlegreyaSans-Black.ttf", 32); // Black
  fonts[3] = createFont("AlegreyaSans-BlackItalic.ttf", 32); // Black Italic
}

void draw() {
  background(0); //Fondo negro
  if (typing) {
    displayTextInput(); //Donde se escribe
  } else {
    drawGrid(); //dibujar en grilla
  }
}

void drawGrid() {
  // Dibuja la grilla de bloques
  for (int i = 0; i < cols; i++) { // Recorre las columnas
    for (int j = 0; j < rows; j++) { // Recorre las filas
      int index = i + j * cols; // Calcula el índice del bloque

      //color de fondo para bloques designados
      if (index == 1 || index == 2) {
        fill(255); // Blanco para Bold Italic y Black
      } else {
        fill(50); // Color oscuro para los demás
      }

      rect(i * blockSize, j * blockSize, blockSize, blockSize); // Dibuja el bloque
      
      if (fonts[index] != null) {
        fill(index == 1 || index == 2 ? 0 : 255); // Negro para texto en Bold Italic y Black, blanco para los otros
        textFont(fonts[index]); //Fuente del bloque
        textAlign(CENTER, CENTER); // Centra el texto

        //Texto correspondiente para cada bloque
        text(styles[index], i * blockSize + blockSize / 2, j * blockSize + blockSize / 2 - 10); // Texto variable
        textSize(19); // Tamaño para "AlegreyaSans"
        text("AlegreyaSans", i * blockSize + blockSize / 2, j * blockSize + blockSize / 2 + 10); // Subtítulo
      }
    }
  }
}

void displayTextInput() {
  //Area de texto y las líneas ingresadas
  background(0); // Establece el color de fondo a negro
  fill(255); // Establece el color del texto a blanco
  textFont(fonts[selectedBlock]); // Establece la fuente correspondiente
  textSize(35); // Tamaño ajustado para el texto de entrada

  //"Volver" en la esquina superior izquierda
  textSize(20); // Tamaño para "Volver"
  text("Volver", 50, 50); // Dibuja el texto

  //Nombre del bloque seleccionado en la esquina superior derecha
  String blockName = styles[selectedBlock];
  textAlign(RIGHT);
  text(blockName, width - 50, 50); //nombre del bloque

  //líneas de texto ingresadas
  float yOffset = 80; // Desplazamiento vertical para las líneas de texto, inicia debajo de "Volver"
  int alignmentState = 0; // 0 = izquierda, 1 = centro, 2 = derecha

//Quiero lograr que al organizar el texto  con 'enter' en la pantalla, 
//al llegar al medio no se superponga en el sector donde se escribe

  for (TextLine lineData : lines) {
    String line = lineData.text; // Texto
    PFont lineFont = lineData.font; // Fuente utilizada

//Organización del texto plasmado en pantalla con 'Enter'

// Si el yOffset supera el límite de la parte inferior, organiza el texto en el centro
    if (yOffset > height - 50) {
      yOffset = 80; // Reinicia el desplazamiento vertical
      alignmentState++; // Cambia a la siguiente alineación
      if (alignmentState > 2) alignmentState = 2; // Mantiene en derecha si ya se llenaron las 3 alineaciones
    }

    textFont(lineFont); // Establece la fuente para la línea
    switch (alignmentState) {
      case 0: // Izquierda
        textAlign(LEFT);
        text(line, 50, yOffset);
        break;
      case 1: // Centro
        float centerOffset = (width - textWidth(line)) / 2;
        textAlign(LEFT);
        text(line, centerOffset, yOffset);
        break;
      case 2: // Derecha
        float rightOffset = width - textWidth(line) - 50;
        textAlign(LEFT);
        text(line, rightOffset, yOffset);
        break;
    }
    yOffset += 35; // Ajusta el espacio entre líneas
  }
  
 
  // Muestra la línea de texto actual centrada en la ventana
  fill(255); // Establece el color del texto a blanco
  textAlign(CENTER); // Centra el texto
  text(currentLine, width / 2, height / 2); // Muestra la línea en el centro
}

void mousePressed() {
  // Maneja el clic del mouse para seleccionar bloques o salir del modo de escritura
  int i = mouseX / blockSize; // Calcula la columna
  int j = mouseY / blockSize; // Calcula la fila

  //Función que registra si se hizo clic en "Volver"
  if (typing && mouseX < 100 && mouseY < 70) {
    typing = false; // Salir del modo de escritura
    currentLine = ""; // Reinicia la línea de texto
    lines.clear(); // Reinicia las líneas ingresadas al volver
    return; // Salir de la función
  }

  // Verifica si el clic está dentro de un bloque y si no se está escribiendo en un bloque
  if (!typing && i >= 0 && i < cols && j >= 0 && j < rows) { // Verifica límites
    selectedBlock = i + j * cols; // Actualiza el bloque seleccionado
    currentLine = ""; // Reinicia la línea de texto al seleccionar un bloque
    typing = true; // Habilita el modo de escritura
  }
}

void keyPressed() {
  //Teclado
  if (typing) { // Si se está escribiendo
    if (keyCode == BACKSPACE) { // Si se presiona retroceso
      if (currentLine.length() > 0) {
        currentLine = currentLine.substring(0, currentLine.length() - 1); // Elimina el último carácter
      }
    } else if (keyCode == ENTER) { // Si se presiona Enter
      if (currentLine.length() > 0) {
        lines.add(new TextLine(currentLine, fonts[selectedBlock])); // Añade la línea actual y su fuente permanentemente
        currentLine = ""; // Elimina la línea actual
      }
    } else {
      currentLine += key; // Añadir la letra pulsada al texto
    }
  }
  
  // Cambiar entre bloques con flechas (bucle) Up and Down
  if (keyCode == UP) { // Flecha hacia arriba
    selectedBlock = (selectedBlock - 1 + styles.length) % styles.length; // Cambia al bloque anterior
  } else if (keyCode == DOWN) { // Flecha hacia abajo
    selectedBlock = (selectedBlock + 1) % styles.length; // Cambia al siguiente bloque (ciclo)
 }
}
