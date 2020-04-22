//import cassette.audiofiles.SoundFile;
//SoundFile music;
PImage [] imgRitmos = new PImage[15];
int randimg = 0;
int[] randImgs = new int[4];
Boton b, gr, pt ;
Selector selector;
int anchoBtnes = 60;
int margenBtns= 5;

void setup(){
  
  //size(displayWidth,displayHeight,P2D);
  size(800,600);
  imageMode(CENTER);
  
  selector = new Selector(width-(anchoBtnes+margenBtns),margenBtns,anchoBtnes);
  selector.setNumOp(3);
  selector.setEstado(true);
  
  pt = new Boton(margenBtns,margenBtns,anchoBtnes);
  pt.mostrarEtiqueta (true);
  pt.setEtiqueta("Puntillos y síncopa");
  
  b = new Boton(anchoBtnes+(margenBtns*2),margenBtns,anchoBtnes);
  b.mostrarEtiqueta (true);
  b.setEtiqueta("Silencios");

  gr = new Boton(anchoBtnes*2+(margenBtns*3),margenBtns,anchoBtnes);
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
  switch(selector.getOpcion()){
    case 1:
      translate(width/2,height/2);
      scale(1.5);
      image(imgRitmos[randImgs[1]],0,0);
      break;
    case 2:
      translate(width*.3,height/2);
      scale(1.);
      image(imgRitmos[randImgs[1]],0,0);
      popMatrix();
      
      pushMatrix();
      translate(width*.7,height/2);
      scale(1.05);
      image(imgRitmos[randImgs[2]],0,0);
      
      break;
    case 3:
      translate(width*.20,height/2);
      scale(.8);
      image(imgRitmos[randImgs[1]],0,0);
      popMatrix();
      
      pushMatrix();
      translate(width*.50,height/2);
      scale(.8);
      image(imgRitmos[randImgs[2]],0,0);
      popMatrix();
      
      pushMatrix();
      translate(width*.80,height/2);
      scale(.8);
      image(imgRitmos[randImgs[3]],0,0);
      break;
    default:
  
  }
  popMatrix();
  
  textSize(10);
  pt.mostrar();
  b.mostrar();
  gr.mostrar();
  selector.mostrar();
}

void randRits(){
  
    int lastRand = randImgs[0];
    
    if (!b.getEstado() && !gr.getEstado() && !pt.getEstado()){ // s/pto. ni sil. ni g.irr. 
    
      for(int i = 0; i < randImgs.length ; i++){
          do{
            randImgs[i] = floor(random(0,5));
          }while(lastRand == randImgs[0]);
        }
        
    }else  if(!b.getEstado() && !gr.getEstado() && pt.getEstado()){// c/ s/pto s/ sil. s/ g.irr.
    
     for(int i = 0; i < randImgs.length ; i++){
      randImgs[i] = floor(random(0,8));}
     
    }else  if(b.getEstado() && !gr.getEstado()){// c/ sil. s/ g.irr.
    for(int i = 0; i < randImgs.length ; i++){
      randImgs[i] = floor(random(0,12));}
     
    }else if (b.getEstado() && gr.getEstado()){ // c/ sil. y g.irr.
    for(int i = 0; i < randImgs.length ; i++){
      randImgs[i] = floor(random(0,imgRitmos.length));}
     
    }else if (!b.getEstado() && gr.getEstado()){ // s/ sil. c/ g.irr. 
      for(int i = 0; i < randImgs.length ; i++){
        randImgs[i] = floor(random(0,11));
        if (randImgs[i] >= 8 && randImgs[i] <= 11){
           randImgs[i] += 4; 
        }
      }
    }
}

void mousePressed(){
  if(mouseY > 60){
    randRits();}
  else{
    b.clic();
    gr.clic();
    pt.clic();}
    selector.clic();
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
