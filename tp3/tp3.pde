//https://youtu.be/WkfmwXc7meg

PImage imagen;
float anguloAuto = 0;
boolean rotando = false;
float velocidadRot = 0.01;
int numCuadrados = 12;
int indiceFondo = 0;
color colorObra0 = color(0);
color colorObra1 = color(200, 30, 30);
color colorObra2 = color(30, 150, 70);
color colorObra3 = color(220, 180, 0);
float grosor = 1.0;
boolean modoRandom = false;

void setup() {
  size(800, 400);
  imagen = loadImage("36.jpg");
}

void draw() {
  background(23, 40, 150);
  image(imagen, 0, 0, 400, 400);
  if (rotando) {
    anguloAuto += velocidadRot;
  }
  pushMatrix();
  translate(550, 200);
  rotate(anguloAuto + PI/4);
  int total = calcularCuadrados(numCuadrados);
  dibujarOpArt(total, 400);
  popMatrix();
  mostrarInfo();
}

int calcularCuadrados(int base) {
  if (base < 4) {
    return 4;
  } else if (base > 20) {
    return 20;
  } else {
    return base;
  }
}

color obtenerColorObra(int indice) {
  if (indice == 0) {
    return colorObra0;
  } else if (indice == 1) {
    return colorObra1;
  } else if (indice == 2) {
    return colorObra2;
  } else {
    return colorObra3;
  }
}

void dibujarOpArt(int cantidad, float tamMax) {
  float paso = (tamMax / cantidad) * grosor;
  for (int i = cantidad; i > 0; i--) {
    for (int j = 0; j < 2; j++) {         
      float tam = paso * i;
      float desplazY = j * 6;             

      if (i % 2 == 0) {
        fill(obtenerColorObra(indiceFondo));
      } else {
        fill(255);
      }

      float variacion = 0;
      if (modoRandom) {
        variacion = random(-4, 4);
      }

      float rotProg = map(i, 1.5, cantidad, 0, PI / -4);

      pushMatrix();
      rotate(rotProg);
      rectMode(CENTER);
      noStroke();
      rect(50, desplazY, tam + variacion, tam + variacion);  
      popMatrix();
    }
  }
}

void mostrarInfo() {
  float textX = 320;
  float textY = 290;
  fill(255, 255, 255, 160);
  noStroke();
  rect(420, 320, 195, 68, 6);
  fill(30);
  textSize(15);
  textAlign(LEFT, TOP);
  text("CLICK rotar  C color  R random", textX + 5, textY + 6);
  text("↑↓ cuadrados  +/- tamaño", textX + 5, textY + 20);
  text("ESPACIO reinicia", textX + 5, textY + 34);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      numCuadrados++;
    } else if (keyCode == DOWN) {
      numCuadrados--;
    }
  }
  if (key == 'c' || key == 'C') {
    indiceFondo = indiceFondo + 1;
    if (indiceFondo > 3) {
      indiceFondo = 0;
    }
  }
  if (key == '+' || key == '=') {
    grosor = grosor + 0.1;
  }
  if (key == '-') {
    grosor = grosor - 0.1;
    if (grosor < 0.3) grosor = 0.3;
  }
  if (key == 'r' || key == 'R') {
    modoRandom = !modoRandom;
  }
  if (key == ' ') {
    anguloAuto = 0;
    rotando = false;
    numCuadrados = 12;
    indiceFondo = 0;
    grosor = 1.0;
    modoRandom = false;
  }
}

void mouseClicked() {
  if (mouseX > 400) {
    rotando = !rotando;
  }
}
