class Selector extends Boton{
   
  //añade variables selector (varios)
  protected int selector;
  protected int numOpciones;
  private int contador = 1;
  
  Selector (int x, int y, int s){
     super(x,y,s);
     this.selector = 1; 
     this.setEtiqueta(String.valueOf(selector));
     this.mostrarEtiqueta(true);
  }
  
  void clic(){
    if(mouseX > xPos && mouseX < xLim &&
       mouseY > yPos && mouseY < yLim){
         //cambia el valor circularmente entre las opciones (1 - n)
         println("c l i c");
         selector = (contador++ % numOpciones)+1;
         this.setEtiqueta(String.valueOf(selector));
    }
  }
  
  //SETTERS EXTRA - - -
  //setter para indicar cantidad de opciones
  void setNumOp(int n){ this.numOpciones = n; }
  
  //GETTERS EXTRA - - -
  //getter para saber el valor actual del boton
  int getOpcion(){  return this.selector; }
}
