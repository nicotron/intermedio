//laboratio desarrollo tecnologico 02/10/2024
//Mariana_Vivanco, Grettel Norambuena, Tracy Nuñez, Camila Aguirre

int grid = 0; // Tamaño inicial de la grilla

void setup() {
    size(1440, 900);
    fullScreen();
    noStroke();
}

void draw() {
  background(255);
  if(grid == 0) {
    pushMatrix();
    translate((width-height)/2, 0);
    paletaInicio();
    popMatrix();
  }
   else if (grid == 1) {
    pushMatrix();
    translate((width-(height*1.5))/2, 0);
    paletaInvierno();
    popMatrix();
  } else if (grid == 2) {
    pushMatrix();
    translate((width-(height*1.5))/2, 0);
    paletaOtono();
    popMatrix();
  } else if (grid == 3) {
    pushMatrix();
    translate((width-(height*1.5))/2, 0);
    paletaVerano();
    popMatrix();
  } else if (grid == 4) {
    pushMatrix();
    translate((width-(height*1.5))/2, 0);
    paletaPrimavera();
    popMatrix();
  }
}
// tecla presionada
void keyPressed() {
  if(key == 'I' || key == 'i') {
    grid = 1;
  } 
  if (key == 'O' || key == 'o') {
    grid = 2;
  } 
  if (key == 'V' || key == 'v') {
    grid = 3;
  } 
  if (key == 'P' || key == 'p') {
    grid = 4;
  } if (key == 'X' || key == 'x') {
    grid = 0;
  }
  if (keyCode == 112) {
    int s = second();  // Valores de 0 - 59
    int m = minute();  // Valores de 0 - 59
    int h = hour();    // Valores de  0 - 23
    saveFrame("intermedio_marianaVivanco_grettelNorambuena_tracyNunez_camilaAguirre"+str(h)+str(m)+str(s)+".png");
  }
}

// dibuja grilla de 4 espacios
void paletaInicio() {
    float size = height/2;
    
    pushMatrix();
    translate(0, 0);
    //primer espacio
    fill(#a63f03);
    rect(0, 0, size, size);
    fill(#f25303);
    ellipse(size / 2, size / 2, size / 2, size / 2);
    
    //segundo espacio
    fill(#7aacbf);
    rect(size, 0, size, size);
    fill(#9adbef);
    ellipse(size + size / 2, size / 2, size / 2, size / 2);
    
    //tercer espacio
    fill(#70ff8b);
    rect(0, size, size, size);
    fill(#faf763);
    ellipse(size / 2, size + size / 2, size / 2, size / 2);
    
    //cuarto espacio
    fill(#e25e85);
    rect(size, size, size, size);
    fill(#963d56);
    ellipse(size + size / 2, size + size / 2, size / 2, size / 2);
    
    popMatrix(); 
}

// dibuja la primera grilla de 6 espacios
void paletaInvierno() {
    int size = height / 2;
    
    //primer espacio
    fill(#a0c3d9);
    rect(0, 0, size, size);
    fill(#bde9ff);
    ellipse(size / 2, size / 2, size / 2, size / 2);
    
    //segundo espacio
    fill(#366273);
    rect(size, 0, size, size);
    fill(#5ba5bc);
    ellipse(size + size / 2, size / 2, size / 2, size / 2);
    
    //tercer espacio
    fill(#7aacbf);
    rect(2 * size, 0, size, size);
    fill(#097985);
    ellipse(2 * size + size / 2, size / 2, size / 2, size / 2);
    
    //cuarto espacio
    fill(#bcd5dd);
    rect(0, size, size, size);
    fill(#edf9fc);
    ellipse(size / 2, size + size / 2, size / 2, size / 2);
    
    //quinto espacio
    fill(#d5e7f2);
    rect(size, size, size, size);
    fill(#b3c0c6);
    ellipse(size + size / 2, size + size / 2, size / 2, size / 2);
    
    //sexto espacio
    fill(#182626);
    rect(2 * size, size, size, size);
    fill(#578786);
    ellipse(2 * size + size / 2, size + size / 2, size / 2, size / 2);
}

// dibuja la segunda grilla de 6 espacios
void paletaOtono() {
    int size = height / 2;
    
    //primer espacio
    fill(#d96704);
    rect(0, 0, size, size);
    fill(#8c3f06);
    ellipse(size / 2, size / 2, size / 2, size / 2);
    
    //segundo espacio
    fill(#4a5702);
    rect(size, 0, size, size);
    fill(#afc606);
    ellipse(size + size / 2, size / 2, size / 2, size / 2);
    
    //tercer espacio
    fill(#a63f03);
    rect(2 * size, 0, size, size);
    fill(#f25303);
    ellipse(2 * size + size / 2, size / 2, size / 2, size / 2);
    
    //cuarto espacio
    fill(#f29f05);
    rect(0, size, size, size);
    fill(#9b6002);
    ellipse(size / 2, size + size / 2, size / 2, size / 2);
    
    //quinto espacio
    fill(#83452a);
    rect(size, size, size, size);
    fill(#d66c47);
    ellipse(size + size / 2, size + size / 2, size / 2, size / 2);
    
    //sexto espacio
    fill(#bf452a);
    rect(2 * size, size, size, size);
    fill(#ff6a5a);
    ellipse(2 * size + size / 2, size + size / 2, size / 2, size / 2);
}

// dibuja la tercera grilla de 6 espacios
void paletaVerano() {
    int size = height / 2;
    
    //primer espacio
    fill(#f2d434);
    rect(0, 0, size, size);
    fill(#d95536);
    ellipse(size / 2, size / 2, size / 2, size / 2);
    
    //segundo espacio
    fill(#e25e85);
    rect(size, 0, size, size);
    fill(#963d56);
    ellipse(size + size / 2, size / 2, size / 2, size / 2);
    
    //tercer espacio
    fill(#038567);
    rect(2 * size, 0, size, size);
    fill(#b7dbbf);
    ellipse(2 * size + size / 2, size / 2, size / 2, size / 2);
    
    //cuarto espacio
    fill(#55317b);
    rect(0, size, size, size);
    fill(#dcbedc);
    ellipse(size / 2, size + size / 2, size / 2, size / 2);
    
    //quinto espacio
    fill(#d9828a);
    rect(size, size, size, size);
    fill(#805476);
    ellipse(size + size / 2, size + size / 2, size / 2, size / 2);
    
    //sexto espacio
    fill(#67686d);
    rect(2 * size, size, size, size);
    fill(#4f788e);
    ellipse(2 * size + size / 2, size + size / 2, size / 2, size / 2);
}

// dibuja la cuarta grilla de 6 espacios
void paletaPrimavera() {
    int size = height / 2;
    
    //primer espacio
    fill(#fffc45);
    rect(0, 0, size, size);
    fill(#4ec8ff);
    ellipse(size / 2, size / 2, size / 2, size / 2);
    
    //segundo espacio
    fill(#588c32);
    rect(size, 0, size, size);
    fill(#f24472);
    ellipse(size + size / 2, size / 2, size / 2, size / 2);
    
    //tercer espacio
    fill(#9700ec);
    rect(2 * size, 0, size, size);
    fill(#ffeb78);
    ellipse(2 * size + size / 2, size / 2, size / 2, size / 2);
    
    //cuarto espacio
    fill(#79a2f2);
    rect(0, size, size, size);
    fill(#d996a7);
    ellipse(size / 2, size + size / 2, size / 2, size / 2);
    
    //quinto espacio
    fill(#70ff8b);
    rect(size, size, size, size);
    fill(#faf763);
    ellipse(size + size / 2, size + size / 2, size / 2, size / 2);
    
    //sexto espacio
    fill(#ff86e3);
    rect(2 * size, size, size, size);
    fill(#8b6700);
    ellipse(2 * size + size / 2, size + size / 2, size / 2, size / 2);
}

