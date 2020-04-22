class Selector extends Boton{
   
  protected int selector;
  protected int numOpciones;
  private int contador = 1;
  
  Selector (int x, int y, int s){
     super(x,y,s);
     this.selector = 1; 
     this.setEtiqueta(String.valueOf(selector));
     this.mostrarEtiqueta(true);
  }
  
  int getOpcion(){  return this.selector; }
  
  
  void clic(){
    if(mouseX > xPos && mouseX < xLim &&
       mouseY > yPos && mouseY < yLim){
         println("c l i c");
         selector = (contador++ % numOpciones)+1;
         this.setEtiqueta(String.valueOf(selector));
    }
  }
  
  void setNumOp(int n){
    this.numOpciones = n;
  }
}
