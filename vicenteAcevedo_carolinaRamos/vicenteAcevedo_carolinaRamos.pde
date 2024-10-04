
PFont beldaConBla32, beldaConBolIt24, beldaNorThiIt36, beldaNorThi35;  // Variables para almacenar las fuentes
String currentText = "BELDA";  // Texto inicial en el centro
int fontIndex = 0;  // Para cambiar entre fuentes
float textY = height / 2;  // Posición del texto en Y
String userInput = "";  // Almacena el texto ingresado por el usuario
boolean typing = false;  // Para habilitar o deshabilitar la escritura

void setup() {
  size(1440, 900);
  
  // Cargar las fuentes desde la carpeta 'data'
  beldaConBla32 = createFont("Belda-ConBla", 300);  // Fuente en tamaño 64
  beldaConBolIt24 = createFont("Belda-ConBolIt", 300);  // Fuente en tamaño 64
  beldaNorThiIt36 = createFont("Belda-NorThiIt", 300);  // Fuente en tamaño 64
  beldaNorThi35 = createFont("Belda-NorThi", 300);  // Fuente en tamaño 64
  
  textAlign(CENTER, CENTER);  // Alinear el texto al centro
  textFont(beldaConBla32);  // Fuente inicial
}

void draw() {
  background(252,253,255);  // blanco
  // Mostrar el texto
  fill(0);  // Color negro
  textSize(300);  // Tamaño del texto
  
  if (typing) {
    text(userInput, width / 2, height / 2);  // Mostrar lo que escribe el usuario
  } else {
    text(currentText, width / 2, textY);  // Mostrar texto en la posición actual
  }
}

void keyPressed() {
  if (key == 'a' || key == 'A') {
    // Cambiar el texto y la fuente cuando se presiona "A"
    fontIndex = (fontIndex + 1) % 4;  // Avanzar entre las 4 fuentes
    
    if (fontIndex == 0) {
      textFont(beldaConBla32);
      currentText = "BELDA";
    } else if (fontIndex == 1) {
      textFont(beldaConBolIt24);
      currentText = "BELDA ITALIC";
    } else if (fontIndex == 2) {
      textFont(beldaNorThiIt36);
      currentText = "BELDA THIN";
    } else if (fontIndex == 3) {
      textFont(beldaNorThi35);
      currentText = "BELDA NORMAL";
    
    }
  } else if (key == ' ') {
    // Habilitar la escritura al presionar "espacio"
    typing = !typing;
    if (!typing) {
      userInput = "";  // Resetear el texto ingresado cuando se desactiva la escritura
    }
  } else if (typing) {
    // Si está en modo de escritura, permitir la entrada de texto
    if (key == BACKSPACE && userInput.length() > 0) {
      userInput = userInput.substring(0, userInput.length() - 1);  // Borrar el último carácter
    } else if (key != BACKSPACE && key != ENTER) {
      userInput += key;  // Agregar el carácter ingresado al texto
    }
  }
}
