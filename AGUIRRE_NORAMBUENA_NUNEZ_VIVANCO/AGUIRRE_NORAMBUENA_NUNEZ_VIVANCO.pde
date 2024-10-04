//laboratio desarrollo tecnologico 02/10/2024
//Mariana_Vivanco, Grettel Norambuena, Tracy Nuñez, Camila Aguirre

int grid = 4; // Tamaño inicial de la grilla

void setup() {
  size(1000, 1000);
  noStroke();
}

void draw() {
  background(255);
  
  if (grid == 4) {
    drawGrid4();
  } else if (grid == 6) {
    drawGrid6Set1();
  } else if (grid == 7) {
    drawGrid6Set2();
  } else if (grid == 8) {
    drawGrid6Set3();
  } else if (grid == 9) {
    drawGrid6Set4();
  }
}

// Dibuja grilla de 4 espacios
void drawGrid4() {
  int size = width / 2;
  
  // Primer espacio
  fill(#A63F03);
  rect(0, 0, size, size);
  fill(#F25303);
  ellipse(size/2, size/2, size/2, size/2);
  
  // Segundo espacio
  fill(#7AACBF);
  rect(size, 0, size, size);
  fill(#9ADBEF);
  ellipse(size + size/2, size/2, size/2, size/2);
  
  // Tercer espacio
  fill(#70FF8B);
  rect(0, size, size, size);
  fill(#FAF763);
  ellipse(size/2, size + size/2, size/2, size/2);
  
  // Cuarto espacio
  fill(#E25E85);
  rect(size, size, size, size);
  fill(#963D56);
  ellipse(size + size/2, size + size/2, size/2, size/2);
}

// Dibuja la primera grilla de 6 espacios
void drawGrid6Set1() {
  int size = width / 3;
  
  // Primer espacio
  fill(#A0C3D9);
  rect(0, 0, size, size);
  fill(#BDE9FF);
  ellipse(size/2, size/2, size/2, size/2);
  
  // Segundo espacio
  fill(##366273);
  rect(size, 0, size, size);
  fill(#5BA5BC);
  ellipse(size + size/2, size/2, size/2, size/2);
  
  // Tercer espacio
  fill(#7AACBF);
  rect(2*size, 0, size, size);
  fill(#097985);
  ellipse(2*size + size/2, size/2, size/2, size/2);
  
  // Cuarto espacio
  fill(#BCD5DD);
  rect(0, size, size, size);
  fill(#EDF9FC);
  ellipse(size/2, size + size/2, size/2, size/2);
  
  // Quinto espacio
  fill(#D5E7F2);
  rect(size, size, size, size);
  fill(#B3C0C6);
  ellipse(size + size/2, size + size/2, size/2, size/2);
  
  // Sexto espacio
  fill(#182626);
  rect(2*size, size, size, size);
  fill(#578786);
  ellipse(2*size + size/2, size + size/2, size/2, size/2);
}

// Dibuja la segunda grilla de 6 espacios
void drawGrid6Set2() {
  int size = width / 3;
  
  // Primer espacio
  fill(#D96704);
  rect(0, 0, size, size);
  fill(#8C3F06);
  ellipse(size/2, size/2, size/2, size/2);
  
  // Segundo espacio
  fill(#4A5702);
  rect(size, 0, size, size);
  fill(#AFC606);
  ellipse(size + size/2, size/2, size/2, size/2);
  
  // Tercer espacio
  fill(#A63F03);
  rect(2*size, 0, size, size);
  fill(#F25303);
  ellipse(2*size + size/2, size/2, size/2, size/2);
  
  // Cuarto espacio
  fill(#F29F05);
  rect(0, size, size, size);
  fill(#9B6002);
  ellipse(size/2, size + size/2, size/2, size/2);
  
  // Quinto espacio
  fill(#83452A);
  rect(size, size, size, size);
  fill(#D66C47);
  ellipse(size + size/2, size + size/2, size/2, size/2);
  
  // Sexto espacio
  fill(#BF452A);
  rect(2*size, size, size, size);
  fill(#FF6A5A);
  ellipse(2*size + size/2, size + size/2, size/2, size/2);
}

// Dibuja la tercera grilla de 6 espacios
void drawGrid6Set3() {
  int size = width / 3;
  
  // Primer espacio
  fill(#F2D434);
  rect(0, 0, size, size);
  fill(#D95536);
  ellipse(size/2, size/2, size/2, size/2);
  
  // Segundo espacio
  fill(#E25E85);
  rect(size, 0, size, size);
  fill(#963D56);
  ellipse(size + size/2, size/2, size/2, size/2);
  
  // Tercer espacio
  fill(#038567);
  rect(2*size, 0, size, size);
  fill(#B7DBBF);
  ellipse(2*size + size/2, size/2, size/2, size/2);
  
  // Cuarto espacio
  fill(#55317B);
  rect(0, size, size, size);
  fill(#DCBEDC);
  ellipse(size/2, size + size/2, size/2, size/2);
  
  // Quinto espacio
  fill(#D9828A);
  rect(size, size, size, size);
  fill(#805476);
  ellipse(size + size/2, size + size/2, size/2, size/2);
  
  // Sexto espacio
  fill(#67686D);
  rect(2*size, size, size, size);
  fill(#4F788E);
  ellipse(2*size + size/2, size + size/2, size/2, size/2);
}

// Dibuja la cuarta grilla de 6 espacios
void drawGrid6Set4() {
  int size = width / 3;
  
  // Primer espacio
  fill(#FFFC45);
  rect(0, 0, size, size);
  fill(#4EC8FF);
  ellipse(size/2, size/2, size/2, size/2);
  
  // Segundo espacio
  fill(#588C32);
  rect(size, 0, size, size);
  fill(#F24472);
  ellipse(size + size/2, size/2, size/2, size/2);
  
  // Tercer espacio
  fill(#9700EC);
  rect(2*size, 0, size, size);
  fill(#FFEB78);
  ellipse(2*size + size/2, size/2, size/2, size/2);
  
  // Cuarto espacio
  fill(#79A2F2);
  rect(0, size, size, size);
  fill(#D996A7);
  ellipse(size/2, size + size/2, size/2, size/2);
  
  // Quinto espacio
  fill(#70FF8B);
  rect(size, size, size, size);
  fill(#FAF763);
  ellipse(size + size/2, size + size/2, size/2, size/2);
  
  // Sexto espacio
  fill(#FF86E3);
  rect(2*size, size, size, size);
  fill(#8B6700);
  ellipse(2*size + size/2, size + size/2, size/2, size/2);
}

// tecla presionada
void keyPressed() {
  if (key == 'I') {
    grid = 6;
  } else if (key == 'O') {
    grid = 7;
  } else if (key == 'V') {
    grid = 8;
  } else if (key == 'P') {
    grid = 9;
  } else if (key == 'X') {
    grid = 4;
  }
}
