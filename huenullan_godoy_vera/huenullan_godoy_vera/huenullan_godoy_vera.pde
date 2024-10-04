/* UNIACC
 labdestec_1_2
 Integrantes: Javiera_vera_Fransisca_Huenullán_Antonia Godoy
 Sección
 intermedio_preparación
 */

// 1 Espacio principal del programa
// Instalar tipografías al programa
// Creación de agregar grillas con el teclado
// Creación de cambio de color con el teclado blanco y negro
// Creación de cambio de tamaño de letra con el teclado
// Escribir dentro del programa de forma interactiva

/*
  Comandos:
 
 Cambio de cuadrículas:
 2x2 = tecla número 1
 3x3 = tecla número 2
 4x4 = tecla número 3
 5x5 = tecla número 4
 
 Cambio de color variado:
 Color cromático = tecla A/a
 Color gris oscuro y claro = tecla D/d
 
 Cambio de color automatico:
 tecl= x
 
 detener de color automatico:
 tecl= y
 
 Color gris oscuro y claro = tecla D/d
 
 Restablecer colores al inicial:
 Con la tecla F/f
 
 Restablecer todo desde el inicio:
 Columnas y colores al estado inicial con la tecla G/g
 
 Agrandar y achicar letra:
 Agrandar = tecla Flecha arriba
 Achicar = tecla Flecha abajo
 
 Activar/Desactivar parpadeo:
 Activar/Desactivar parpadeo = tecl O/o
 
 Empezar a garbar:
 grabar = tecl P/p
 
 actividar teclado para escribir :
 tecl = *
 
 Descripción en el programa:
 Este programa, desarrollado en Processing, crea un entorno interactivo donde los
 usuarios pueden experimentar con texto y gráficos utilizando el teclado. A continuación
 se detallan las principales funcionalidades y características del programa:
 Interacción con el Teclado: Los usuarios pueden interactuar en tiempo real mediante
 una serie de comandos de teclado. Estos comandos permiten modificar la estructura,
 apariencia y comportamiento del programa, lo que brinda una experiencia dinámica y personalizada.
 Configuración de Cuadrículas: El programa permite al usuario ajustar el diseño del
 fondo mediante la creación de cuadrículas de diferentes tamaños (2x2, 3x3, 4x4 y 5x5) al presionar
 las teclas numéricas del 1 al 4. Esta funcionalidad crea un entorno visualmente atractivo donde el texto se puede organizar en celdas.
 Cambio de Color: Los usuarios pueden cambiar los colores del fondo y del texto. Se ofrecen opciones para alternar entre colores
 cromáticos y tonos de gris claro y oscuro usando las teclas A/a y D/d, respectivamente. Además, se implementa un modo
 automático que cambia los colores de manera continua con las teclas X y Y para activar y desactivar este efecto.
 Tamaño de Texto Ajustable: El tamaño del texto es flexible, permitiendo al usuario aumentarlo o reducirlo utilizando
 las teclas de flecha arriba y abajo. Esto proporciona un control adicional sobre la legibilidad y el diseño del texto en el espacio interactivo.
 Parpadeo del Texto: El programa incluye una opción para activar o desactivar el parpadeo del texto. Esto se controla
 con la tecla O/o, lo que añade un efecto visual llamativo que puede ser usado para resaltar partes del texto.
 Entrada de Texto en Tiempo Real: Los usuarios pueden escribir texto dentro del programa. Al presionar la tecla *,
 se activa el modo de escritura, permitiendo al usuario ingresar texto libremente. La funcionalidad incluye la opción
 de borrar caracteres con la tecla BACKSPACE, lo que facilita la edición del texto.
 Grabación de Pantallazos: Los usuarios tienen la opción de guardar imágenes del programa en formato PNG,
 lo que permite capturar y documentar sus creaciones. Esto se logra al presionar la tecla P/p.
 Reinicio de Configuración: El programa ofrece opciones para restablecer todos los parámetros a su
 estado inicial, incluyendo filas, columnas, colores y tamaño de texto, mediante la tecla G/g o Shift + *.
 Diseño Visual Atractivo: A través de un fondo cuadriculado y alternancia de colores, el programa proporciona un entorno
 visualmente atractivo y envolvente. El texto se presenta de forma clara y se ajusta a las dimensiones de cada celda, mejorando la estética general del programa.
 
 Problemas:
 Hubo problemas en la implementación de tipografías.
 Se planea intentar un movimiento sintético a través del usuario utilizando el teclado.
 Se utilizarán solo dos familias tipográficas.
 */


// Variables globales
float x, y, textSize, maxTextSize;
float desplazamientoY = 0; // Desplazamiento vertical del texto
float radius;
float angle ;
float speed ;

//variable tipografia
PFont LemonMilk, LemonLight, LemonMedium, LemonBold,
  Mirage, MirageLight, MirageMedium, MirageBold;

//variables boolean
boolean grabar, tiempo, parpadeo, cambioColorAutomatico;
boolean iniciado = false; // Estado de inicio
boolean escribiendo = false; // Estado de escritura


// Variables int
int tiempoCambioColor = 1000; // Tiempo en milisegundos para el cambio de color
int ultimoCambioColor = 0; // Almacena el tiempo del último cambio de color
int textYPosition = 200; // Posición vertical inicial del texto
int intervaloParpadeo = 30; // Intervalo de parpadeo
int filas, columnas;
int frames, parpadeoFrames;
int estiloIndex = 0;

// variable string
String[] estilos = {"Regular", "Bold", "Italic"};
String inputText = ""; // Variable para almacenar el texto ingresado


// Variables de colore
color colorInicialPrincipal, colorInicialSecundario;
color principal, secundario, terciario, cuarto, grisClaro,
  grisMedio, grisOscuro, gris, principal2, secundario2;

// Setup del programa
void setup() {
  size(1440, 900); // Configuración del lienzo
  frameRate(30); // Definir la tasa de fotogramas
  grabar = false;
  tiempo = true;
  parpadeo = false;
  cambioColorAutomatico = false; // Inicialmente desactivado
  parpadeoFrames = 1;
  frames = 0;
  textSize = 50;          // Tamaño de letra inicial
  maxTextSize = 50;      // Evitar que el texto se superponga o se salga de los límites
  columnas = 1;         // Valor inicial para columnas
  filas = 1;           // Valor inicial para filas
  radius = 100;       // Radio del movimiento
  angle = 0;         // Ángulo inicial
  speed = 0.02;     // Velocidad del movimiento

  // Cargar fuentes
  LemonMilk = createFont("LEMONMILK-Regular.otf", textSize);
  LemonLight = createFont("LEMONMILK-Light.otf", textSize);
  LemonMedium = createFont("LEMONMILK-Medium.otf", textSize);
  LemonBold = createFont("LEMONMILK-Bold.otf", textSize);

  Mirage = createFont("Mirage Regular.otf", textSize);
  MirageLight = createFont("Mirage Thin.otf", textSize);
  MirageMedium = createFont("Mirage Medium.otf", textSize);
  MirageBold = createFont("Mirage Bold.otf", textSize);

  // Colores
  principal = color(0); // Negro
  secundario = color(255); // Blanco
  principal2 = color(0); // Negro
  secundario2 = color(255); // Blanco
  terciario = color(100); // Gris oscuro
  cuarto = color(200); // Gris claro
  grisClaro = color(230); // Gris claro
  grisMedio = color(150); // Gris medio
  grisOscuro = color(80); // Gris oscuro

  // Guardar colores iniciales
  colorInicialPrincipal = principal;
  colorInicialSecundario = secundario;
}

void draw() {
  // Fondo del programa
  background(secundario);

  grabarParaVideo(); // Añade esta línea para activar la grabación

  pushMatrix();
  // Llama a la función de grabación
  if (iniciado) {
    if (!escribiendo) {
      // Dibujo del fondo en patrón cuadricular
      for (int i = 0; i < filas; i++) {
        for (int j = 0; j < columnas; j++) {
          x = j * width / columnas; // Posición en x
          y = i * height / filas; // Posición en y

          // Alternar colores para el patrón cuadricular
          fill((i + j) % 2 == 0 ? secundario : principal);
          rect(x, y, width / columnas, height / filas); // Dibujar cuadrado

          // Adjuntar fuente tipográfica para que se dibuje en el programa
          textAlign(CENTER, CENTER);
          textFont(estilos[estiloIndex].equals("Bold") ? LemonMilk : Mirage);

          // Determinar el tamaño máximo de texto que cabe en cada casilla
          float maxTextSize = min(width / columnas * 0.8, height / filas * 0.8);
          textSize = constrain(textSize, 10, maxTextSize); // Asegurar que el tamaño del texto sea razonable

          // Establecer el tamaño del texto
          textSize(textSize);

          // Determinar si el texto debe parpadear
          boolean isBlinking = parpadeo && (parpadeoFrames / intervaloParpadeo) % 2 == 0;

          // Dibujar texto en casillas blancas y negras
          fill((i + j) % 2 == 0 ? principal : secundario);
          if (isBlinking) {
            text((i + j) % 2 == 0 ? "World" : "Hello", x + width / (2 * columnas), y + height / (2 * filas));
          } else {
            text((i + j) % 2 == 0 ? "Hello" : "World", x + width / (2 * columnas), y + height / (2 * filas));
          }
        }
      }
    } else {
      // Mostrar solo el texto ingresado desde la esquina superior izquierda
      fill(principal);
      textSize(70);
      textAlign(LEFT, TOP); // Cambiar alineación a la esquina superior izquierda
      text(inputText, 1, 1); // Mostrar texto ingresado en (0,0)
    }

    // Actualizar el parpadeo
    if (parpadeo) {
      parpadeoFrames++;
    }
    // Aumenta el ángulo para crear el movimiento
    angle += speed;

    // Reinicia el ángulo para que el movimiento sea continuo
    if (angle > TWO_PI) {
      angle -= TWO_PI;
    }
  } else {
    // Mostrar solo una palabra al inicio "Presiona 'g' para iniciar la interacción"
    textAlign(CENTER, CENTER);
    textSize(40);
    fill(principal);
    text("Presiona 'g' para iniciar la interacción", width / 2, height / 2); // Corregido para centrar el texto
  }

  // Cambiar colores automáticamente si está activado
  if (cambioColorAutomatico) {
    // Comprobar si ha pasado el tiempo de cambio
    if (millis() - ultimoCambioColor > tiempoCambioColor) {
      principal = color(random(0, 256), random(0, 256), random(0, 256)); // Color aleatorio en escala de grises
      secundario = color(random(0, 256), random(0, 256), random(0, 256)); // Color aleatorio en escala de grises
      ultimoCambioColor = millis(); // Actualizar el tiempo del último cambio de color
    }
  }

  popMatrix();
  if (key == 'p' || key == 'P') { // todo esto es para sacar pantallazos con tiempo
    int s = second(); // Valores de 0 - 59
    int m = minute(); // Valores de 0 - 59
    int h = hour(); // Valores de 0 - 23

    saveFrame("Huenullan-Godoy-Vera" + str(h) + str(m) + str(s) + ".png");
  }
}

void keyPressed() {
  if (key == 'g' || key == 'G') {
    iniciado = true; // Marcar que el programa ha sido iniciado
  }
  if (key == 'w' || key == 'W') {
    desplazamientoY -= 5; // Mover hacia arriba
  } else if (key == 's' || key == 'S') {
    desplazamientoY += 5; // Mover hacia abajo
  }

  // Iniciar escritura con la tecla *
  if (key == '*' || key == '*') {
    escribiendo = true; // Cambiar estado a escribiendo
    inputText = ""; // Vaciar texto ingresado
  }

  // Restablecer todo con Shift + *
  if (key == '*' && keyCode == SHIFT) {
    filas = 1;
    columnas = 1;
    textSize = 100; // Cambiado para coincidir con el tamaño inicial
    inputText = "";
    principal = color(0); // Volver a color original
    secundario = color(255); // Volver a color original
    iniciado = false;
    escribiendo = false;
    return; // Salir de la función
  }

  // Permitir agregar texto cuando está en modo escritura
  if (escribiendo && key != CODED && key != '*' && key != '*') {
    if (key == BACKSPACE) {
      // Borrar el último carácter si se presiona BACKSPACE(borrar)
      if (inputText.length() > 0) {
        inputText = inputText.substring(0, inputText.length() - 1);
      }
    } else {
      inputText += key; // Agregar el carácter presionado al texto ingresado
    }
    return; // Evitar ejecutar otros comandos
  }

  // Activar/Desactivar parpadeo con la tecla O
  if (key == 'o' || key == 'O') {
    parpadeo = !parpadeo; // Alternar el estado de parpadeo
    parpadeoFrames = 0;   // Reiniciar el contador de parpadeo
  }

  // Cambiar estilo tipográfico con la tecla T
  if (key == 't' || key == 'T') {
    estiloIndex = (estiloIndex + 1) % estilos.length; // Cambiar al siguiente estilo
    return; // Evitar ejecutar otros comandos
  }
  // Cambiar tamaño de texto con las teclas de flecha
  if (keyCode == UP) {
    textSize += 10; // Aumentar tamaño de letra
  } else if (keyCode == DOWN) {
    textSize -= 10; // Disminuir tamaño de letra
  }

  // Modificar filas y columnas con las teclas 1-4
  if (key == '1') {
    filas = 1;
    columnas = 1; // Configuración 2x2
  } else if (key == '2') {
    filas = 2;
    columnas = 2; // Configuración 3x3
  } else if (key == '3') {
    filas = 3;
    columnas = 3; // Configuración 4x4
  } else if (key == '4') {
    filas = 4;
    columnas = 4; // Configuración 5x5
  } else if (key == '4') {
    filas = 5;
    columnas = 5; // Configuración 5x5
  }

  // Cambiar la velocidad de cambio de color cuando se presiona 'x'
  if (key == 'x' || key == 'X') {
    tiempoCambioColor = 2000; // Cambiar a 2000 ms para un cambio de color más lento
    cambioColorAutomatico = true; // Activar el cambio automático
    return; // Evitar ejecutar otros comandos
  }

  // Detener el cambio automático de color
  if (key == 'y' || key == 'Y') {
    cambioColorAutomatico = false; // Detener el cambio automático
    // Reiniciar a los colores iniciales
    principal = colorInicialPrincipal;
    secundario = colorInicialSecundario;
  }
  if (key == 'a' || key == 'A') {
    principal = secundario2;   // Establecer color gris oscuro
    secundario = principal2;    // Establecer color gris claro

    if (key == 's' || key == 'S') {
      principal = grisOscuro;   // Establecer color gris oscuro
      secundario = grisClaro;    // Establecer color gris claro
    }
  } else if (key == 'd' || key == 'D') {
    principal = grisMedio;   // Cambiar a gris medio
    secundario = grisClaro;    // Mantener color gris claro
  }

  // Restablecer colores al inicial con la tecla 'F'
  if (key == 'f' || key == 'F') {
    principal = colorInicialPrincipal;
    secundario = colorInicialSecundario;
  }
}
// Grabar el video
void grabarParaVideo() {
  grabar = !grabar; // Alternar grabación
  if (grabar == true) {
    // Aquí va la lógica para grabar video
    // Tu código de grabación aquí
    if (tiempo == true) {
      frameCount = 0;
      frames = frameCount;
      println(frames);
      tiempo = false;
    }
    frames = frameCount;
    //saveFrame("video/huenullan-godoy-vera.png");

    if (frames > 900) {
      grabar = false;
      println("fin");
    }
  }
}
