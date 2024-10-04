/* UNIACC Halime Abdo e Ivanna Baron
 labdestec-i_ii_1_2
 Clase 7
 // Presentación intermedio
 crear un crucigrama, en base a celdas, para completar las palabras. Cuando se acierte con la palabra
 se cambia la tipografía (de una default a una que elijamos)
 También puede ser un juego donde la persona tenga un tiempo determinado para rellenar con un tema específico
 
 
 
 
 // Variables Globales
 */
int x, y;
PFont tipografía;

void setup () {
  size(1440, 900 ); // tamaño canva pantalla completa
  //fullScreen();
  tipografía = loadFont("ComicSansMS-48.vlw");
  textFont(tipografía);
  x = 0;     // posición en x
  y = 0;              // posición en y
}


void draw() {
  background (255);
  fill (0) ;
  textSize (30) ;
  text("desplazate con las flechas a traves del espacio", 60, 60); // falta más texto explicativo para el usuario

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
  for (x=2; x<22; x++) {
    for (y=2; y<13; y++) {
      noFill();
      stroke(127);
      rect(x*60, y*60, 60, 60); // lo de adentro
    }
  }
}
