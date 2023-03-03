public class Fuente{
  float radio, t, g;
  float velY, velX, x,y,ang;
  // Con la velocidad se busca que vayan hacia arriba y despues caigan, como tiro parabolico
  
  
  Fuente(float radio){
    this.radio = radio;
    g = 9.81;
    t = 0;
  }
  
  Fuente(){
    this.radio = 10;
    g = -9.81;
    t = 0;
  }
  
  void Agua(float velX, float velY){
    // lo que hace es un angulo random entre 45 y 135 grados
    ang = random(45,135);
    //ang = 90;
    /*velY = random(-500); // quizas se tengan que cambiar las vel
    //velY = -25;
    velX = random(350);*/
   
    /*velX = 350;
    velY = -500;*/
    this.velX = velX;
    this.velY = velY;
    x = velX*cos(radians(ang))*t;
    y = (velY*(sin(radians(ang)))*t)+((g*0.5)*(t*t));
    
    fill(0, 0, 255);
    circle(x,y,radio);
    t+=0.1;
    
    if(t > 13){
      t = 0;
    }
  }
}

int arr = 1000;
Fuente gotas[] = new Fuente[arr];
PImage miImagen;

void setup(){
  size(800,800);
  frameRate(30);
  for(int i=0; i<arr; i++){
    gotas[i] = new Fuente(random(25));
  }
  
  miImagen = loadImage("fuente.png");
}

void draw(){
  translate(height/2, width/2);
  background(255);
  noStroke();
  miImagen.resize(800,400);
  image(miImagen, -390, 0);
  //image(miImagen, width - 100, height - 100);
  for(int i=0;i<arr;i++){
    gotas[i].Agua(random(35),random(-80));
  }
}
