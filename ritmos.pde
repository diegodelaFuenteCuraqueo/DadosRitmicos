//import cassette.audiofiles.SoundFile;
//SoundFile music;

//arreglos de imágenes de todos los ritmos q caben en una negra
PImage [] imgRitmos = new PImage[15];

//arreglos numeros aleatorios
int randimg = 0;
int[] randImgs = new int[4];

//botones (on-off) y selector (1,2,3..)
Boton b, gr, pt ;
Selector selector;

//tamaño y márgenes botones
final int anchoBtnes = 60;
final int margenBtns= 5;

void setup(){
  
  //size(displayWidth,displayHeight,P2D);
  size(800,600);
  imageMode(CENTER);
  
  //selector determina cantidad de ritmos (1 a 3)
  selector = new Selector(width-(anchoBtnes+margenBtns),margenBtns,anchoBtnes);
  selector.setNumOp(3);
  selector.setEstado(true);
   
  //botones puntillos, silencios y grupos irregulares
  pt = new Boton(margenBtns,margenBtns,anchoBtnes);
  pt.mostrarEtiqueta (true);
  pt.setEtiqueta("Puntillos y síncopa");
    //silencios
  b = new Boton(anchoBtnes+(margenBtns*2),margenBtns,anchoBtnes);
  b.mostrarEtiqueta (true);
  b.setEtiqueta("Silencios");
    //grupos irregulares
  gr = new Boton(anchoBtnes*2+(margenBtns*3),margenBtns,anchoBtnes);
  gr.mostrarEtiqueta (true);
  gr.setEtiqueta("G.Irregular");
  
    //carga imagenes en arreglo
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
  
  //dependiendo del valor del botón selector
  //se elige entre 1, 2 ó 3 ritmos diferentes
  pushMatrix();
  switch(selector.getOpcion()){
    case 1:  //1 ritmo
      translate(width/2,height/2);
      scale(1.5);
      image(imgRitmos[randImgs[1]],0,0);
      break;
    case 2:  //2 ritmos
      translate(width*.3,height/2);
      scale(1.);
      image(imgRitmos[randImgs[1]],0,0);
      popMatrix();
      
      pushMatrix();
      translate(width*.7,height/2);
      scale(1.);
      image(imgRitmos[randImgs[2]],0,0);
      
      break;
    case 3:   //3 ritmos
      translate(width*.20,height/2);
      scale(.75);
      image(imgRitmos[randImgs[1]],0,0);
      popMatrix();
      
      pushMatrix();
      translate(width*.50,height/2);
      scale(.75);
      image(imgRitmos[randImgs[2]],0,0);
      popMatrix();
      
      pushMatrix();
      translate(width*.80,height/2);
      scale(.75);
      image(imgRitmos[randImgs[3]],0,0);
      break;
    default:
  }
  popMatrix();
  
  //muestra los botones
  textSize(10);
  pt.mostrar();
  b.mostrar();
  gr.mostrar();
  selector.mostrar();
}

void randRits(){
  
    int lastRand = randImgs[0];
    
    //dependiendo del estado de los botones selecciona aleatoriamente entre ritmos
    //se crea un array con numeros aleatorios para seleccionar entre los ritmos
    if (!b.getEstado() && !gr.getEstado() && !pt.getEstado()){ // s/pto. ni sil. ni g.irr. 
      //array con numeros aleatorios dentro de los limites establecidos por los botones
      for(int i = 0; i < randImgs.length ; i++){
          do{
            randImgs[i] = floor(random(0,5));
          }while(lastRand == randImgs[0]);
        }
        
    }else  if(!b.getEstado() && !gr.getEstado() && pt.getEstado()){// c/ s/pto s/ sil. s/ g.irr.
     for(int i = 0; i < randImgs.length ; i++){
      randImgs[i] = floor(random(0,8));}   //random entre numeros q indican los grupos de ritmos seleccionados
     
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
  
  //si el clic es debajo de la barra de control
  if(mouseY > 60){
    randRits();}
  else{ //detecta clics en los botones de la barra de control
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
