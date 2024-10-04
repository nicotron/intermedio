


PFont[] fonts = new PFont[9];  // Array para almacenar las diferentes fuentes.
int currentFontIndex = 0;       // Índice para rastrear la fuente actual.
boolean showInputWindow = false; // Variable booleana que controla si se muestra la ventana de entrada de texto.
boolean wordDisplayed = false;   // Variable booleana que controla si se muestra la palabra en pantalla completa.
String inputText = "";           // Inicializa una cadena vacía que almacenará el texto ingresado por el usuario.
String displayedText = "";       // Inicializa una cadena vacía que almacenará el texto que se mostrará al presionar Enter.
int maxCharacters = 20;          // Establece un límite de 20 caracteres para la entrada del usuario.
float textSizeDisplay = 96;      // Establece el tamaño de la fuente para la visualización de la palabra en 96 píxeles.
float textX = 0;                 // Inicializa la posición horizontal de la palabra a 0.

void setup() {
  size(1440, 900);              // Ajusta el tamaño de la ventana a 1440 x 900 píxeles.
  fonts[0] = createFont("Silo-Light.otf", 48); 
  fonts[1] = createFont("Silos-Heavy Extra Expanded.otf", 48); // Cambia "AnotherFont1.ttf" por el nombre de tu archivo de fuente
  fonts[2] = createFont("TIPO MIA.otf", 48); // Cambia "AnotherFont2.ttf" por el nombre de tu archivo de fuente
  fonts[3] = createFont("DonutLightNarrow.otf", 48); // Cambia "AnotherFont3.ttf" por el nombre de tu archivo de fuente
  fonts[4] = createFont("DonutRegular.otf", 48); // Cambia "AnotherFont3.ttf" por el nombre de tu archivo de fuente
  fonts[5] = createFont("Donut Bold.otf", 48); // Cambia "AnotherFont3.ttf" por el nombre de tu archivo de fuente
  fonts[6] = createFont("Expresso-Regular (1).otf", 48); // Cambia "AnotherFont3.ttf" por el nombre de tu archivo de fuente
  fonts[7] = createFont("Irlandes-Regular.otf", 48); // Cambia "AnotherFont3.ttf" por el nombre de tu archivo de fuente
  fonts[8] = createFont("Latte Regular.1ecbd380840.otf", 48); // Cambia "AnotherFont3.ttf" por el nombre de tu archivo de fuente
  
   textFont(fonts[1]); // Establece la fuente inicial.

  background(255);           // Establece el color de fondo en blanco (255 en RGB).
  fill(0);                   // Establece el color de relleno (texto) en negro (0 en RGB).

  // Configura la visualización del abecedario y otros caracteres.
  textSize(48);              // Establece el tamaño del texto para las letras en 48 píxeles.
  textAlign(CENTER, CENTER); // Alinea el texto al centro tanto horizontal como verticalmente.

  // Calcular la posición inicial para centrar las letras.
  float startX = width / 2 - 13 * 30; // Ajustar la posición para centrar el abecedario, 26 letras.
  float startY = height / 2.4;          // Centro vertical de la ventana.

  // Bucle para mostrar las letras A-Z en una línea.
  for (char c = 'A'; c <= 'Z'; c++) {
    text(c, startX + (c - 'A') * 30, startY); // Muestra cada letra con un espaciado de 30 píxeles entre ellas.
  }

  // Mostrar números y símbolos en la siguiente línea.
  String numbersAndSymbols = "0123456789!@#$%^&*()_+-={}[]:;'\"<>,.?/\\|~`"; // Cadena que incluye números y símbolos.
  float symbolsStartX = width / 2 - (numbersAndSymbols.length() / 2) * 20; // Calcula la posición inicial para centrar los símbolos.
  float symbolsStartY = startY + 100; // Posición de los símbolos, debajo del abecedario.

  // Bucle para mostrar cada símbolo en su posición correspondiente.
  for (int i = 0; i < numbersAndSymbols.length(); i++) {
    text(numbersAndSymbols.charAt(i), symbolsStartX + i * 20, symbolsStartY); // Muestra cada símbolo con un espaciado de 20 píxeles.
  }
}

void draw() {
  // Verifica si se debe mostrar la ventana de entrada o la palabra en pantalla completa.
  if (showInputWindow) {
    drawInputWindow(); // Llama a la función que dibuja la ventana de entrada si está activada.
  } else if (wordDisplayed) {
    displayWordFullScreen();  // Llama a la función para mostrar la palabra en pantalla completa.
  }
}

// Dibuja la ventana de entrada de texto.
void drawInputWindow() {
  background(255);  // Limpiar la pantalla en cada frame, manteniendo el fondo blanco.
  fill(0);          // Asegurarnos de que el texto sea negro.

  textSize(48);     // Establecer el tamaño del texto para la entrada a 48 píxeles.

  // Mostrar el texto ingresado por el usuario en el centro de la pantalla.
  textAlign(CENTER); // Alinear el texto al centro.
  text(inputText, width / 2, height / 2);  // Mostrar el texto ingresado en el centro.

  // Dibujar el cursor después del texto ingresado.
  if (frameCount % 60 < 30 && inputText.length() < maxCharacters) {  // Efecto de parpadeo del cursor.
    float cursorX = textWidth(inputText) + width / 2;  // Calcular la posición del cursor al final del texto.
    line(cursorX, height / 2 - 10, cursorX, height / 2 + 10);  // Dibujar el cursor.
  }

  // Mostrar el texto ingresado cuando se presiona Enter.
  textSize(32); // Establecer un tamaño de texto menor para mostrar el texto guardado.
  text(displayedText, width / 2, height / 2 + 100);  // Mostrar el texto guardado debajo del campo de entrada.
}

// Muestra la palabra en pantalla completa.
void displayWordFullScreen() {
  background(255);  // Limpiar la pantalla, asegurando que el fondo sea blanco.
  fill(0);          // Texto en negro.
  
  textAlign(CENTER, CENTER); // Alinear el texto al centro.

  // Aplicar el tamaño de la fuente dinámico para mostrar la palabra.
  textSize(textSizeDisplay);
  
  // Mostrar la palabra ingresada en la posición definida.
  text(displayedText, width / 2 + textX, height / 2); // Muestra la palabra ajustando su posición X.
}

void keyPressed() {
  // Si se presiona 'Ctrl', abrir la ventana de entrada.
  if (keyCode == CONTROL) {
    showInputWindow = true;
    wordDisplayed = false;
    inputText = "";
    displayedText = "";
  }

  // Cambiar tipografía al presionar las teclas numéricas 1 a 4.
  if (key >= '1' && key <= '9') {
    currentFontIndex = key - '1'; // Establecer la fuente actual según la tecla presionada.
    if (wordDisplayed) { // Asegurarse de que se cambie la fuente solo si la palabra se está mostrando.
      textFont(fonts[currentFontIndex]); // Cambiar la fuente a la seleccionada.
    }
    return; // Asegurarse de que no se procese más la entrada.
  }

  // Manejo de entrada cuando la ventana de entrada está activa.
  if (showInputWindow) {
    if (key != CODED && key != BACKSPACE && key != ENTER && inputText.length() < maxCharacters) {
      inputText += key;  // Añadir la tecla presionada al texto de entrada.
    }

    if (key == BACKSPACE && inputText.length() > 0) {
      inputText = inputText.substring(0, inputText.length() - 1);
    }

    if (key == ENTER) {
      displayedText = inputText; 
      inputText = "";
      showInputWindow = false;
      wordDisplayed = true;
      textSizeDisplay = 96;
      textX = 0;
      textFont(fonts[currentFontIndex]); // Establecer la fuente al presionar Enter.
    }
  }
  
  // Ajustar el tamaño del texto o mover la palabra cuando se muestre en pantalla completa.
  if (wordDisplayed) {
    if (keyCode == UP) {
      textSizeDisplay += 5;
    } else if (keyCode == DOWN) {
      textSizeDisplay = max(10, textSizeDisplay - 5);
    } else if (keyCode == RIGHT) {
      textX += 10;
    } else if (keyCode == LEFT) {
      textX -= 10;
    }
  }
}
