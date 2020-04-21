//import cassette.audiofiles.SoundFile;
//SoundFile music;
PImage [] imgRitmos = new PImage[15];
int randimg = 0;
Boton b, gr ;


void setup(){
  
  //size(displayWidth,displayHeight,P2D);
  size(800,600);
  imageMode(CENTER);
  
  b = new Boton(5,5,60);
  b.mostrarEtiqueta (true);
  b.setEtiqueta("Silencios");
  
  gr = new Boton(70,5,60);
  gr.mostrarEtiqueta (true);
  gr.setEtiqueta("G.Irregular");
  
  for(int i = 1; i< imgRitmos.length+1;i++){
    imgRitmos[i-1] = loadImage(i+".png");
    println(i+".png");
  }
    try{
      //music = new SoundFile(this, "clic.mp3");
    }catch (Exception e){}
}

void draw(){
  background(255);
  pushMatrix();
  translate(width/2,height/2);
  scale(1.5);
  image(imgRitmos[randimg],0,0);
  popMatrix();
  
  textSize(10);
  b.mostrar();
  gr.mostrar();
}

void randRit(){
  int lastRand = randimg;
  do {
    if(b.getEstado() && !gr.getEstado()){
     randimg = floor(random(0,12));
    }else if (b.getEstado() && gr.getEstado()){
     randimg = floor(random(0,imgRitmos.length));
    }else if (!b.getEstado() && !gr.getEstado()){
     randimg = floor(random(0,8));
    }else if (!b.getEstado() && gr.getEstado()){
     randimg = floor(random(0,11));
     if (randimg >= 8 && randimg <= 11){
       randimg += 4; 
     }
    }
  }while (lastRand == randimg);
  println(randimg);
}

void mousePressed(){
  
  if(mouseY > 60){
    randRit();}
  else{
    b.clic();
    gr.clic();}
    //music.stop();
  try{
    //music.play();
  }catch(Exception e){}
}

/*
void touchStarted() {
  println("TOUCH: "+mouseX+ " "+mouseY);
  if(mouseY > 60){
    randRit();}
  else{
    b.clic();
    gr.clic();
  }
  //music.stop();
   try{
    //music.play();
  }catch(Exception e){}
}
*/
