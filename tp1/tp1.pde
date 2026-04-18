PImage cuadro;
int desplazar;

void setup(){
size(800,400);

cuadro=loadImage("obra.jpg");
desplazar=400;

}

void draw(){
  background(255);
  strokeWeight(6);

  
  //arriba izquierda
  fill(192,70,47);
  quad(0+desplazar,-10,0+desplazar,66,172+desplazar,79,201+desplazar,-10);
  fill(239,156,174);
  triangle(0+desplazar,66,0+desplazar,125,215+desplazar,87);
  fill(163,20,22);
  quad(0+desplazar,125,0+desplazar,251,125+desplazar,236,80+desplazar,113);
  fill(197,123,94);
  quad(80+desplazar,113,125+desplazar,236,222+desplazar,225,215+desplazar,87);
  
  
  //arriba derecha 
  fill(123,18,75);
  circle(265+desplazar,78,240);
  fill(183,144,227);
  quad(275+desplazar,-10,260+desplazar,78,402+desplazar,139,411+desplazar,-10);
  fill(237,210,180);
  triangle(260+desplazar,78,258+desplazar,169,393+desplazar,139);
  fill(243,95,33);
  circle(259+desplazar,78,90);

  
  //abajo derecha 
  fill(185,33,32);
  quad(180+desplazar,192,270+desplazar,420,500+desplazar,410, 440+desplazar,130);
  fill(234,36,23);
  quad(182+desplazar,192,225+desplazar,303,348+desplazar,246,299+desplazar,160);
  fill(103,38,36);
  quad(299+desplazar,160,348+desplazar,246,400+desplazar,210, 440+desplazar,130);
  fill(146,52,50);
  triangle(400+desplazar,210,230+desplazar,303,419+desplazar,341);
  fill(249,207,191);
  circle(220+desplazar,310,120);
  
  //abajo izquierda
  fill(198,161,195);
  quad(0+desplazar,255,0+desplazar,400,175+desplazar,420,121+desplazar,240);
  fill(100,33,102);
  quad(141+desplazar,344,70+desplazar,420,270+desplazar,420,225+desplazar,320);
  fill(242,54,55);
  quad(123+desplazar,293,141+desplazar,344,225+desplazar,317,193+desplazar,225);
  fill(209,154,61);
  circle(420,438,140);
  fill(243,86,7);
  quad(52+desplazar,245,67+desplazar,307,210+desplazar,274,193+desplazar,225);
  
  image(cuadro, 0, 0, 400, 400);
}


void mousePressed(){
  println(mouseX,mouseY);
}
