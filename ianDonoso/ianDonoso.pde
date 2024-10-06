// Este código genera una animación donde figuras geométricas
// cambian de forma y color mientras se mueven por la pantalla. 
// Las figuras desaparecen al hacer clic sobre ellas. 
// Además, hay un efecto de letras cayendo al estilo Matrix en el fondo.

int numShapes = 10;
float[] x = new float[numShapes];
float[] y = new float[numShapes];
float[] speedX = new float[numShapes];
float[] speedY = new float[numShapes];
color[] shapeColors = new color[numShapes];
float[] size = new float[numShapes];
float[] targetSize = new float[numShapes];
float[] interpolation = new float[numShapes]; 
float[] currentShape = new float[numShapes];
float[] targetShape = new float[numShapes];
boolean[] isVisible = new boolean[numShapes];

String lettersAndNumbers = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
int numColumns = 30; 
int numRows = 30; 
float[][] columnX = new float[numColumns][numRows];
float[][] columnY = new float[numColumns][numRows];
float[][] fallSpeed = new float[numColumns][numRows];
color[][] charColors = new color[numColumns][numRows];

void setup() {
  size(1440, 900);
  noStroke();
  
  for (int i = 0; i < numShapes; i++) {
    x[i] = random(width);
    y[i] = random(height);
    speedX[i] = random(-3, 3);
    speedY[i] = random(-3, 3);
    shapeColors[i] = color(random(255), random(255), random(255));
    size[i] = random(50, 150); 
    targetSize[i] = random(50, 150);
    interpolation[i] = 0;
    currentShape[i] = random(3);
    targetShape[i] = random(3);
    isVisible[i] = true;
  }
  
  for (int i = 0; i < numColumns; i++) {
    for (int j = 0; j < numRows; j++) {
      columnX[i][j] = i * (width / numColumns) + random(width / numColumns);
      columnY[i][j] = random(-500, 0);
      fallSpeed[i][j] = random(2, 10);
      charColors[i][j] = color(random(255), random(255), random(255));
    }
  }
}

void draw() {
  background(0);
  
  for (int i = 0; i < numShapes; i++) {
    if (isVisible[i]) {
      x[i] += speedX[i];
      y[i] += speedY[i];
    
      if (x[i] < 0 || x[i] > width) speedX[i] *= -1;
      if (y[i] < 0 || y[i] > height) speedY[i] *= -1;
    
      size[i] = lerp(size[i], targetSize[i], 0.02);
      currentShape[i] = lerp(currentShape[i], targetShape[i], 0.02);
    
      fill(shapeColors[i]);
      if (currentShape[i] < 1) {
        float circleSize = lerp(size[i], size[i] / 2, currentShape[i]);
        rect(x[i] - circleSize/2, y[i] - circleSize/2, circleSize, circleSize); 
      } else if (currentShape[i] < 2) {
        float rectSize = lerp(size[i] / 2, size[i], currentShape[i] - 1);
        triangle(x[i], y[i], x[i] + rectSize, y[i], x[i] + rectSize/2, y[i] - rectSize); 
      } else {
        triangle(x[i], y[i], x[i] + size[i], y[i], x[i] + size[i]/2, y[i] - size[i]); 
      }
    
      if (abs(currentShape[i] - targetShape[i]) < 0.01 && abs(size[i] - targetSize[i]) < 1) {
        targetShape[i] = random(3);
        targetSize[i] = random(50, 150);
      }
    }
  }
  
  textAlign(CENTER, CENTER);
  textSize(16);
  for (int i = 0; i < numColumns; i++) {
    for (int j = 0; j < numRows; j++) {
      fill(charColors[i][j]);
      char randomChar = lettersAndNumbers.charAt((int)random(lettersAndNumbers.length()));
      text(randomChar, columnX[i][j], columnY[i][j]);
    
      columnY[i][j] += fallSpeed[i][j];
    
      if (columnY[i][j] > height) {
        columnY[i][j] = random(-200, 0);
        fallSpeed[i][j] = random(2, 10);
        charColors[i][j] = color(random(255), random(255), random(255)); 
      }
    }
  }
}

void mousePressed() {
  for (int i = 0; i < numShapes; i++) {
    if (isVisible[i]) {
      if (dist(mouseX, mouseY, x[i], y[i]) < size[i] / 2) {
        isVisible[i] = false;
      }
    }
  }
}
