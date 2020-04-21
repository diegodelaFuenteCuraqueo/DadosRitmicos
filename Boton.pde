class Boton{
  color strokeColorOn, fillColorOn, strokeColorOff, fillColorOff;
  int xPos, yPos, size, xLim, yLim;
  int botonID;
  String etiqueta = "";
  boolean estado, mostrarEtiqueta;
    
  Boton(int x, int y, int s){
     xPos = x;
     yPos = y;
     size = s;
     xLim = x+s;
     yLim = y+s;
     estado = false; 
     strokeColorOn = color(0,0,0);
     fillColorOn= color(255,255,255);
     strokeColorOff= color(0,0,0);
     fillColorOff= color(127,127,127);
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
    mostrarEtiqueta = bol;
  }
  //GETTERS . . . . . . . . . 
  boolean getEstado(){  return estado; }
  int getXPos(){        return xPos; }
  int getYPos(){        return yPos; }
  int getId(int id){    return this.botonID;}

  //SETTERS . . . . . . . . . 
  void setEstado(boolean e){        estado = e;}
  void setStrokeColorOn(color c){   strokeColorOn = c; }
  void setfillColorOn(color c){     fillColorOn = c;   }
  void setStrokeColorOff(color c){  strokeColorOff = c;}
  void setfillColorOff(color c){    fillColorOff = c;  }
  void setId(int id){ this.botonID = id;}
  
}
