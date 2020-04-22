class Boton{
  protected color strokeColorOn, fillColorOn, strokeColorOff, fillColorOff;
  protected int xPos, yPos, size, xLim, yLim;
  protected int botonID;
  protected String etiqueta = "";
  protected boolean estado, mostrarEtiqueta;
  
  private Boton(int x, int y, int s){
    this. xPos = x;
     this.yPos = y;
     this.size = s;
     this.xLim = x+s;
     this.yLim = y+s;
     this.estado = false; 
     this.strokeColorOn = color(0,0,0);
     this.fillColorOn= color(255,255,255);
     this.strokeColorOff= color(0,0,0);
     this.fillColorOff= color(127,127,127);
  }
  
  //detecta clic dentro de los pixeles q componen el btn.
  void clic(){
    if(mouseX > xPos && mouseX < xLim &&
       mouseY > yPos && mouseY < yLim){
         println("c l i c");
         if(estado){
           estado = false;
         }else if(!estado){
           estado = true;
         }
    }
  }
  
  //dibuja el botón con los colores y elementos establecidos
  void mostrar(){
    if(estado){
      stroke(strokeColorOn);
      fill(fillColorOn);
    }else{
      stroke(strokeColorOff);
      fill(fillColorOff);}
    rect(this.xPos,this.yPos,size,size);
    
    if (mostrarEtiqueta){
      fill(0);
      textAlign(CENTER,CENTER);
      text(etiqueta,this.xPos , this.yPos, size , size);}
  }
  
  //establece etiqueta del boton
  void setEtiqueta(String et){
    this.etiqueta = et;
  }
  
  //setea si se muestra o no la etiqueta
  void mostrarEtiqueta(boolean bol){
    this.mostrarEtiqueta = bol;
  }
  
  //GETTERS . . . . . . . . . 
  boolean getEstado(){  return this.estado; }
  int getXPos(){        return this.xPos; }
  int getYPos(){        return this.yPos; }
  int getId(int id){    return this.botonID;}

  //SETTERS . . . . . . . . . 
  void setEstado(boolean e){        estado = e;}
  void setStrokeColorOn(color c){   strokeColorOn = c; }
  void setfillColorOn(color c){     fillColorOn = c;   }
  void setStrokeColorOff(color c){  strokeColorOff = c;}
  void setfillColorOff(color c){    fillColorOff = c;  }
  void setId(int id){ this.botonID = id;}
  
}
