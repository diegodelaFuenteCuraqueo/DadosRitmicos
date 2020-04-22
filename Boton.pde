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
  
  void setEtiqueta(String et){
    this.etiqueta = et;
  }
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
