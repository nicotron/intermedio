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
 
 Descripción en el programa:
 La idea es diseñar un programa interactivo en Processing
 donde el usuario pueda interactuar a través del teclado.
 El programa permitirá añadir letras (ya predeterminadas),
 cambiar la tipografía y modificar los colores,
 alternando tanto el fondo como el color del texto, todo
 controlado por las teclas Además, una vez que el usuario
 finalice la interacción, podrá continuar escribiendo
 directamente en el programa mientras este se esté ejecutando.
 
 Problemas:
 Hubo problemas en la implementación de tipografías.
 Se planea intentar un movimiento sintético a través del usuario utilizando el teclado.
 Se utilizarán solo dos familias tipográficas.
 */


// Variables globales
float x, y, textSize, maxTextSize;
color principal, secundario, terciario, cuarto, grisClaro, grisMedio, grisOscuro, gris;
PFont LemonMilk, LemonLight, LemonMedium, LemonBold, Mirage, MirageLight, MirageMedium, MirageBold;
int filas, columnas;
boolean grabar, tiempo, parpadeo;
int frames, parpadeoFrames;
boolean iniciado = false;           // Estado de inicio
String inputText = "";              // Variable para almacenar el texto ingresado
boolean escribiendo = false;        // Estado de escritura
int intervaloParpadeo = 30;         // Intervalo de parpadeo

// Estilos de la familia tipográfica
String[] estilos = {"Regular", "Bold", "Italic"};
int estiloIndex = 0;

// Setup del programa
void setup() {
  size(1440, 900);          // Configuración del lienzo
  frameRate(30);             // Definir la tasa de fotogramas
  grabar = false;
  tiempo = true;
  parpadeo = false;
  parpadeoFrames = 1;
  frames = 0;
  textSize = 50;         // Tamaño de letra inicial
  maxTextSize = 50;         // Evitar que el texto se superponga o se salga de los límites
  columnas = 1;             // Valor inicial para columnas
  filas = 1;                // Valor inicial para filas

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
  principal = color(0);          // Negro
  secundario = color(255);      // Blanco
  terciario = color(100);       // Gris oscuro
  cuarto = color(200);          // Gris claro
  grisClaro = color(230);   // Gris claro
  grisMedio = color(150);   // Gris medio
  grisOscuro = color(80);   // Gris oscuro
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
          y = i * height / filas;   // Posición en y

          // Alternar colores para el patrón cuadricular
          fill((i + j) % 2 == 0 ? secundario : principal);
          rect(x, y, width / columnas, height / filas); // Dibujar cuadrado

          // Adjuntar funete tipografica para que se dinuje en el programa
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
      text(inputText, 1, 1);// Mostrar texto ingresado en (0,0)
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
    text("Presiona 'g' para iniciar la interacción", width / 2, height / 2); // Corregido para centrar el texto
  }
  
   popMatrix();
    if (key == 'p' || key == 'P') {  //todo esto es para sacar pantallazos con tiempo
      int s = second();  // Valores de 0 - 59
      int m = minute();  // Valores de 0 - 59
      int h = hour();    // Valores de  0 - 23

      saveFrame("Huenullan-Godoy-Vera"+str(h)+str(m)+str(s)+".png");
    }
    
}
void keyPressed() {
    if (key == 'g' || key == 'G') {
        iniciado = true; // Marcar que el programa ha sido iniciado
    }

    // Iniciar escritura con la tecla *
    if (key == '*' || key == '*') {
        escribiendo = !escribiendo; // Cambiar estado a escribiendo
        inputText = ""; // Vaciar texto ingresado
    }

    // Restablecer todo con Shift + *
    if (key == '*' && keyCode == SHIFT) {
        filas = 1;
        columnas = 1;
        textSize = 100; // Cambiado para coincidir con el tamaño inicial
        inputText = "";
        principal = color(0);          // Volver a color original
        secundario = color(255);      // Volver a color original
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

    // Cambiar estilo tipográfico con la tecla T
    if (key == 't' || key == 'T') {
        estiloIndex = (estiloIndex + 1) % estilos.length; // Cambiar al siguiente estilo
    }

    // Activar/Desactivar parpadeo con la tecla O
    if (key == 'o' || key == 'O') {
        parpadeo = !parpadeo; // Alternar el estado de parpadeo
        parpadeoFrames = 0;   // Reiniciar el contador de parpadeo
    }

    // Cambiar tamaño de texto con las teclas de flecha
    if (keyCode == UP) {
        textSize += 10; // Aumentar tamaño de letra
    } else if (keyCode == DOWN) {
        textSize -= 10; // Disminuir tamaño de letra
    }

    // Modificar filas y columnas con las teclas 1-4
    if (key == '1') {
        filas = 2;
        columnas = 2; // Configuración 2x2
    } else if (key == '2') {
        filas = 3;
        columnas = 3; // Configuración 3x3
    } else if (key == '3') {
        filas = 4;
        columnas = 4; // Configuración 4x4
    } else if (key == '4') {
        filas = 5;
        columnas = 5; // Configuración 5x5
    }

    // Cambiar colores con teclas A,D,X
    if (key == 'x' || key == 'X') {
        // Cambiar colores
        color temp = principal;
        principal = secundario;
        secundario = temp;
    }

    if (key == 'a' || key == 'A') {
        principal = grisOscuro;   // Establecer color gris oscuro
        secundario = grisClaro;    // Establecer color gris claro
    } else if (key == 'd' || key == 'D') {
        principal = grisMedio;   // Cambiar a gris medio
        secundario = grisClaro;    // Mantener color gris claro
    }

    // Reiniciar colores con la tecla F
    if (key == 'f' || key == 'F') {
        principal = terciario;
        secundario = cuarto;
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
