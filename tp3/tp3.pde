//https://youtu.be/wXVZT4BJ8DE
PImage imagen;

float anguloExtra = 0;
float anguloAuto = 0;
boolean rotando = false;
float velocidadRot = 0.01;

int numCuadrados = 12;
int indiceFondo = 0;
color[] coloresObra = {
  color(0),
  color(200, 30, 30),
  color(30, 150, 70),
  color(220, 180, 0)
};

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
  translate(600, 200);              
  rotate(anguloAuto + anguloExtra + PI/4);

  int total = calcularCuadrados(numCuadrados);
  dibujarOpArt(total, 300);

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

void dibujarOpArt(int cantidad, float tamMax) {
  float paso = (tamMax / cantidad) * grosor;

  for (int i = cantidad; i > 0; i--) {
    for (int j = 0; j < 1; j++) {

      float tam = paso * i;

      if (i % 2 == 0) {
        fill(coloresObra[indiceFondo]);
      } else {
        fill(255);
      }

      float variacion = 0;
      if (modoRandom) {
        variacion = random(-4, 4);
      }

      float rotProg = map(i, 0, cantidad, 0, PI / 4);

      pushMatrix();
      rotate(rotProg);
      rectMode(CENTER);
      noStroke();
      rect(0, 0, tam + variacion, tam + variacion);
      popMatrix();
    }
  }
}

void mostrarInfo() {
  // Cuadro blanco
  float textX = 320;   // ← cambia este número para ir a izquierda/derecha
  float textY = 290;   // ← cambia este número para ir arriba/abajo


  fill(255, 255, 255, 160);
  noStroke();
  rect(420, 320, 195, 68, 6);

  fill(30);
  textSize(15);
  textAlign(LEFT, TOP);
  text("CLICK rotar  C color  R random", textX + 5, textY + 6);
  text("↑↓ cuadrados  +/- grosor", textX + 5, textY + 20);
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
    indiceFondo = (indiceFondo + 1) % coloresObra.length;
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
    anguloExtra = 0;
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
