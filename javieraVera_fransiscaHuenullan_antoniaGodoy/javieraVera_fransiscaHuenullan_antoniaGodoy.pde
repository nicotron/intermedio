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
float speed;

//variable tipografia
PFont lemonMilk, lemonLight, lemonMedium, lemonBold, mirage, mirageLight, mirageMedium, mirageBold;
String [] textWord;
//variables boolean
boolean grabar, tiempo, parpadeo, cambioColorAutomatico;
boolean iniciado = false; // Estado de inicio
boolean escribiendoTexto1, escribiendoTexto2; // Estado de escritura

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
color principal, secundario, terciario, cuarto, grisClaro, grisMedio, grisOscuro, gris, principal2, secundario2;

// Setup del programa
void setup() {
  size(1440, 900); // Configuración del lienzo
  frameRate(30); // Definir la tasa de fotogramas
  textWord = new String[2];
  textWord[0] = "Hola";
  textWord[1] = "Mundo";
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

  //Cargar fuentes
  lemonMilk = createFont("LemonMilk-Regular.otf", textSize);
  lemonLight = createFont("LemonMilk-Light.otf", textSize);
  lemonMedium = createFont("LemonMilk-Medium.otf", textSize);
  lemonBold = createFont("LemonMilk-Bold.otf", textSize);

  mirage = createFont("Mirage Regular.otf", textSize);
  mirageLight = createFont("Mirage Thin.otf", textSize);
  mirageMedium = createFont("Mirage Medium.otf", textSize);
  mirageBold = createFont("Mirage Bold.otf", textSize);

  //Colores
  principal = color(0); // Negro
  secundario = color(255); // Blanco
  principal2 = color(0); // Negro
  secundario2 = color(255); // Blanco
  terciario = color(100); // Gris oscuro
  cuarto = color(200); // Gris claro
  grisClaro = color(230); // Gris claro
  grisMedio = color(150); // Gris medio
  grisOscuro = color(80); // Gris oscuro

  //Guardar colores iniciales
  colorInicialPrincipal = principal;
  colorInicialSecundario = secundario;
}

void draw() {
  //Fondo del programa
  background(secundario);

  pushMatrix();
  //Llama a la función de grabación
  if (iniciado) {
    // if (!escribiendo) {
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
        textFont(estilos[estiloIndex].equals("Bold") ? lemonMilk : mirage);

        // Determinar el tamaño máximo de texto que cabe en cada casilla
        float maxTextSize = min(width / columnas * 2.8, height / filas * 2.8);
        textSize =constrain(textSize, 10, maxTextSize); // Asegurar que el tamaño del texto sea razonable

        // Establecer el tamaño del texto
        textSize(textSize);

        // Determinar si el texto debe parpadear
        boolean isBlinking = parpadeo && (parpadeoFrames / intervaloParpadeo) % 2 == 0;

        // Dibujartexto en casillas blancas y negras
        fill((i + j) % 2 == 0 ? principal : secundario);
        if (isBlinking) {
          text((i + j)% 2 == 0 ? textWord[1] : textWord[0], x + width / (2 * columnas), y + height / (2 * filas));
        } else {
          text((i + j)% 2 == 0 ? textWord[0] : textWord[1], x + width / (2 * columnas), y + height / (2 * filas));
        }
      }
    }

    // Actualizar el parpadeo
    if (parpadeo) {
      parpadeoFrames++;
    }
  } else {
    // Mostrar solo una palabra al inicio "Presiona 'g' para iniciar la interacción"
    textAlign(CENTER, CENTER);
    textSize(40);
    fill(principal);
    text("Bienvenido al Intermedio \nPresiona 'g' para iniciar la interacción", width / 2, height / 2); // Corregido para centrar el texto
  }

  popMatrix();
}

void keyPressed() {
  if (key == 'g' || key == 'G') {
    iniciado = true; // Marcar que el programa ha sido iniciado
  }
  //Iniciar escritura con la tecla *
  if (key == '5') {
    escribiendoTexto1 = ! escribiendoTexto1; // Cambiar estado a escribiendo
  }
  if (key == '6') {
    escribiendoTexto2 = ! escribiendoTexto2; // Cambiar estado a escribiendo
  }

  //Permitir agregar texto cuando está en modo escritura
  if (escribiendoTexto1 && key != CODED) {
    if (key == BACKSPACE) {
      // Borrar el último carácter si se presiona BACKSPACE(borrar)
      if (textWord[0].length() > 0) {
        textWord[0] = textWord[0].substring(0, textWord[0].length() - 1);
      }
    } else {
      textWord[0] += key; // Agregar el carácter presionado al texto ingresado
    }
    return; // Evitar ejecutar otros comandos
  }

  if (escribiendoTexto2 && key != CODED) {
    if (key == BACKSPACE) {
      // Borrar el último carácter si se presiona BACKSPACE(borrar)
      if (textWord[1].length() > 0) {
        textWord[1] = textWord[1].substring(0, textWord[1].length() - 1);
      }
    } else {
      textWord[1] += key; // Agregar el carácter presionado al texto ingresado
    }
    return; // Evitar ejecutar otros comandos
  }

  //Activar/Desactivar parpadeo con la tecla O
  if (key == '7') {
    parpadeo = !parpadeo; // Alternar el estado de parpadeo
    parpadeoFrames = 0;   // Reiniciar el contador de parpadeo
  }

  //Cambiar estilo tipográfico con la tecla T
  // if(key == '8') {
  //   estiloIndex = (estiloIndex + 1) % estilos.length; // Cambiar al siguiente estilo
  //   return; // Evitar ejecutar otros comandos
  // }
  //Cambiar tamaño de texto con las teclas de flecha
  if (keyCode == UP) {
    textSize += 10; // Aumentar tamaño de letra
  } else if (keyCode == DOWN) {
    textSize -= 10; // Disminuir tamaño de letra
  }

  //Modificar filas y columnas con las teclas 1-4
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

  //Detener el cambio automático de color
  if (key == '9') {
    principal = colorInicialPrincipal;
    secundario = colorInicialSecundario;
  }
  if (key == '8') {
    principal = secundario2;   // Establecer color gris oscuro
    secundario = principal2;    // Establecer color gris claro
  }

  if (keyCode == 112) { // todo esto es para sacar pantallazos con tiempo
    int s = second(); // Valores de 0 - 59
    int m = minute(); // Valores de 0 - 59
    int h = hour(); // Valores de 0 - 23

    saveFrame("intermedio_javieraVera_fransiscaHuenullan_antoniaGodoy" + str(h) + str(m) + str(s) + ".png");
  }
}