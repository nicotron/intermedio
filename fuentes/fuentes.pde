PFont arial32, garamond24;  // Variable para almacenar la fuente

void setup() {
  size(800, 400);
  String[] fontList = PFont.list();
  printArray(fontList);
  // Cargar la fuente desde la carpeta 'data' (ej. Arial en tamaño 32)
  arial32 = createFont("Arial", 32);  // También puedes usar PFont.loadFont("nombre.vlw")
  garamond24 = createFont("Garamond Negrita", 24);
  // Texto con alineación
  //textAlign(CENTER, CENTER);
}

void draw() {
  background(255);  // Fondo blanco
  // Usar la fuente cargada
  textFont(arial32);
  fill(0);  // Color del texto en negr
  // Mostrar texto
  text("¡Hola! Esta es una fuente personalizada.", width/2, height*0.1);
  // Mostrar texto
  text("¡Hola! Esta es una \nfuente personalizada.", width/2, height*0.3);
  // Mostrar texto
  textFont(garamond24);
  text("¡Hola! Esta es una fuente personalizada.", width/2, height/2, 200, 400);

  noFill();
  stroke(0);
  //rect(width/2, height/2, 200, 70);
}
