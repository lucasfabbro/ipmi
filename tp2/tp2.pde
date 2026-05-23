// --- IMAGENES ---
PImage imagenFondo;
PImage imagen1;       // mandalorian + grogu juntos
PImage imagen2;       // Din Djarin
PImage imagen3;       // Grogu
PImage imagen4;       // Moff Gideon
PImage imagen5;       // El Credo

// --- FUENTE ---
PFont miFuente;

// --- ESTADO ---
// 0 = inicio 
// 1 = presentacion de la serie
// 2 = Din Djarin
// 3 = Grogu
// 4 = Moff Gideon
// 5 = El Credo
// 6 = pantalla final
int estado;
int contador;
int duracion;

// --- ANIMACION TEXTO ---
float posYTitulo;
float posYDesc;
float posXTexto;
float opacidadTexto;
float tamTitulo;

// --- ANIMACION IMAGEN ---
float posXImagen;
float posYImagen;
float opacidadImagen;

// --- BOTON ---
float botonX;
float botonY;
float botonW;
float botonH;

// ============================================
void setup() {
  size(640, 480);
  textAlign(CENTER, CENTER);

  miFuente = loadFont("fuente.vlw");
  textFont(miFuente);

  imagenFondo = loadImage("fondo.jpg");
  imagen1     = loadImage("presentacion.jpg");
  imagen2     = loadImage("dindjarin.jpg");
  imagen3     = loadImage("grogu.jpg");
  imagen4     = loadImage("moffgideon.jpg");
  imagen5     = loadImage("elcredo.jpg");

  botonW = 200;
  botonH = 50;
  botonX = width/2 - botonW/2;
  botonY = height/2 + 100;


  // tiempo spara leer
  duracion = 480;

  reiniciar();
}

// ============================================
void draw() {
  background(0);


  image(imagenFondo, 0, 0, width, height);

  contador++;

  if (estado == 0) {
    dibujarPantallaInicio();
  }
  if (estado == 1) {
    dibujarPantalla1();
    controlarTiempo();
  }
  if (estado == 2) {
    dibujarPantalla2();
    controlarTiempo();
  }
  if (estado == 3) {
    dibujarPantalla3();
    controlarTiempo();
  }
  if (estado == 4) {
    dibujarPantalla4();
    controlarTiempo();
  }
  if (estado == 5) {
    dibujarPantalla5();
    controlarTiempo();
  }
  if (estado == 6) {
    dibujarPantallaFinal();
  }
}

// ============================================
// PANTALLA DE INICIO
// imagen2(Din Djarin) a la izquierda, imagen3(Grogu) a la derecha
// titulo y boton COMENZAR en el centro

void dibujarPantallaInicio() {
  // Imagen Din Djarin - lado izquierdo
  image(imagen2, 0, 40, 210, 400);

  // Imagen Grogu - lado derecho
  image(imagen3, 435, 80, 210, 360);

  // Titulo centrado
  textFont(miFuente, 28);
  fill(255, 255, 255);
  text("The Mandalorian", width/2, height/2 - 80);

  textFont(miFuente, 18);
  fill(255, 255, 255);
  text("Temporada 1", width/2, height/2 - 40);

  // Boton COMENZAR
  botonY = height/2 + 60;
  dibujarBoton("Comenzar");
}

// ============================================
// PANTALLA 1 - Presentacion de la serie
// texto arriba, imagen centrada abajo

void dibujarPantalla1() {
  transicionFade(imagen1);

  // overlay suave
  fill(0, 100);
  rect(0, 0, width, height);

  // Texto 
  if (contador < 60) {
    posYDesc = map(contador, 0, 60, -100, 80);
    opacidadTexto = map(contador, 0, 60, 0, 255);
  } else {
    posYDesc = 80;
    opacidadTexto = 255;
  }

  textFont(miFuente, 15);
  fill(255, 255, 255, opacidadTexto);
  textAlign(CENTER, CENTER);
  text("The Mandalorian sigue un cazarrecompensas mandaloriano\nque es contratado por remanentes imperiales para capturar\na un misterioso objetivo.", width/2, posYDesc);
}

// ============================================
// PANTALLA 2 - Din Djarin
// imagen derecha, texto izquierda


void dibujarPantalla2() {
  // Imagen entra desde la derecha
  if (contador < 50) {
    posXImagen = map(contador, 0, 50, width + 200, width/2 + 20);
    opacidadImagen = map(contador, 0, 50, 0, 255);
  } else {
    posXImagen = width/2 + 20;
    opacidadImagen = 255;
  }

  tint(255, opacidadImagen);
  image(imagen2, posXImagen, 20, 280, 440);
  noTint();

  // Texto entra desde la izquierda
  if (contador < 60) {
    posXTexto = map(contador, 0, 60, -300, width/4);
    opacidadTexto = map(contador, 0, 60, 0, 255);
  } else {
    posXTexto = width/4;
    opacidadTexto = 255;
  }

  textFont(miFuente, 15);
  fill(255, 255, 255, opacidadTexto);
  textAlign(CENTER, CENTER);
  text("Din Djarin es un\ncazarrecompensas\nmandaloriano serio,\nsilencioso y muy habil en\ncombate. Aunque al principio\nparece frio y distante,\ndemuestra ser leal, honorable\ny protector.", posXTexto, height/2);
}

// ============================================
// PANTALLA 3 - Grogu
// imagen izquierda, texto derecha


void dibujarPantalla3() {
  // Imagen entra desde la izquierda
  if (contador < 50) {
    posXImagen = map(contador, 0, 50, -300, 20);
    opacidadImagen = map(contador, 0, 50, 0, 255);
  } else {
    posXImagen = 20;
    opacidadImagen = 255;
  }

  tint(255, opacidadImagen);
  image(imagen3, posXImagen, 40, 280, 400);
  noTint();

  // Texto 
  if (contador < 60) {
    posXTexto = map(contador, 0, 60, width + 300, width/2 + width/4);
    opacidadTexto = map(contador, 0, 60, 0, 255);
  } else {
    posXTexto = width/2 + width/4;
    opacidadTexto = 255;
  }

  textFont(miFuente, 15);
  fill(255, 255, 255, opacidadTexto);
  textAlign(CENTER, CENTER);
  text("Grogu es una pequena\ncriatura sensible a la Fuerza,\ncuriosa, tranquila y muy\nexpresiva. Aunque parece\nindefenso, posee habilidades\nsorprendentes y una fuerte\nconexion con la Fuerza.", posXTexto, height/2);
}

// ============================================
// PANTALLA 4 - Moff Gideon
// imagen derecha, texto izquierda


void dibujarPantalla4() {
  // Imagen con fade
  if (contador < 60) {
    opacidadImagen = map(contador, 0, 60, 0, 255);
  } else {
    opacidadImagen = 255;
  }

  tint(255, opacidadImagen);
  image(imagen4, width/2 + 20, 20, 280, 440);
  noTint();

  // Texto 
  if (contador < 60) {
    posYDesc = map(contador, 0, 60, height + 100, height/2);
    opacidadTexto = map(contador, 0, 60, 0, 255);
  } else {
    posYDesc = height/2;
    opacidadTexto = 255;
  }

  textFont(miFuente, 15);
  fill(255, 255, 255, opacidadTexto);
  textAlign(CENTER, CENTER);
  text("Moff Gideon es un antiguo oficial\nimperial inteligente, calculador y\ndespiadado. Esta obsesionado con\nencontrar a Grogu debido a su\nconexion con la Fuerza y\nrepresenta una amenaza\nconstante para Din Djarin y sus\naliados.", width/4, posYDesc);
}

// ============================================
// PANTALLA 5 - El Credo
// imagen centrada arriba, texto abajo


void dibujarPantalla5() {
  // Imagen entra desde arriba
  if (contador < 50) {
    posYImagen = map(contador, 0, 50, -300, 20);
    opacidadImagen = map(contador, 0, 50, 0, 255);
  } else {
    posYImagen = 0;
    opacidadImagen = 255;
  }

  tint(255, opacidadImagen);
  image(imagen5, 70, posYImagen, 500, 280);
  noTint();

  // Texto 
  if (contador < 60) {
    posYDesc = map(contador, 0, 75, height + 100, 320);
    opacidadTexto = map(contador, 0, 60, 0, 255);
  } else {
    posYDesc = 370;
    opacidadTexto = 255;
  }

  textFont(miFuente, 15);
  fill(255, 255, 255, opacidadTexto);
  textAlign(CENTER, CENTER);
  text("El credo mandaloriano es un conjunto de reglas y\ntradiciones que guian la vida de los mandalorianos.\nSe basa en el honor, la lealtad, la disciplina\ny la proteccion de los suyos.", width/2, posYDesc);
}

// ============================================
// PANTALLA FINAL

void dibujarPantallaFinal() {
  textFont(miFuente, 24);
  fill(200, 210, 0);
  textAlign(CENTER, CENTER);
  text("El camino asi es", width/2, height/2 - 100);

  textFont(miFuente, 16);
  fill(255, 255, 255);
  text("Fin de la presentacion.\nGracias por ver.", width/2, height/2 - 20);

  botonY = height/2 + 80;
  dibujarBoton("Volver");
}

// ============================================
// TRANSICION FADE

void transicionFade(PImage img) {
  if (contador < 60) {
    opacidadImagen = map(contador, 0, 60, 0, 255);
  } else {
    opacidadImagen = 255;
  }
  tint(255, opacidadImagen);
  image(img, 70, 200, 500, 280);
  noTint();
}

// ============================================
// FUNCIONES DE APOYO

void controlarTiempo() {
  if (contador >= duracion) {
    estado++;
    contador = 0;
    resetAnimacion();
  }
}

void resetAnimacion() {
  posXImagen = width + 200;
  posYImagen = -300;
  opacidadImagen = 0;
  posYTitulo = height + 50;
  posYDesc = height + 50;
  posXTexto = -300;
  opacidadTexto = 0;
  tamTitulo = 12;
}

void dibujarBoton(String etiqueta) {
  boolean hover = mouseX > botonX && mouseX < botonX + botonW &&
                  mouseY > botonY && mouseY < botonY + botonH;

  noStroke();
  if (hover) {
    fill(200, 210, 0);
  } else {
    fill(200, 210, 0, 160);
  }
  rect(botonX, botonY, botonW, botonH, 4);

  textFont(miFuente, 15);
  fill(0);
  textAlign(CENTER, CENTER);
  text(etiqueta, botonX + botonW/2, botonY + botonH/2);
}

void reiniciar() {
  estado = 0;
  contador = 0;
  botonX = width/2 - botonW/2;
  botonY = height/2 + 100;
  resetAnimacion();
}

// ============================================
// EVENTOS DE MOUSE

void mousePressed() {
  boolean sobreBoton = mouseX > botonX && mouseX < botonX + botonW &&
                       mouseY > botonY && mouseY < botonY + botonH;

  if (estado == 0 && sobreBoton) {
    estado = 1;
    contador = 0;
    resetAnimacion();
  }
}

void mouseClicked() {
  boolean sobreBoton = mouseX > botonX && mouseX < botonX + botonW &&
                       mouseY > botonY && mouseY < botonY + botonH;

  if (estado == 6 && sobreBoton) {
    reiniciar();
  }
}
