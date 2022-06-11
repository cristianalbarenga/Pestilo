/*
  --Objeto Estilo--
  define unt tipo de estilo grafico 
  para utilizar 
  Formas Rellenas ('R') - Formas Lineales ('L')
  Combinacion de relleno y linea ('C')
*/
class Pestilo{
 /************** VARIABLES *************
  -------------------------------------*/  
 color[] paleta; //paleta de color
 
 /************* CONSTRUCTOR *************   
 ---------------------------------------*/   
  Pestilo(){   
   noFill();
   noStroke();
  }
  
 /************** FUNCIONES **************
 ---------------------------------------*/
  //--- PALETA DE COLORES ---//
  /*
  se ingresa la paleta de colores a utilizar
  mediante array de colores
  */
  void paleta(color[] pal){
   paleta= pal;   
  }//----------------//
  
  //--- RELLENO ---//
  /*
  estilo de relleno
  colIndex: indice de array de paleta de colores
  */
  void relleno(int colIndex){
     noStroke();
     fill(paleta[colIndex]);
  }//----------------//
  
  //--- LINEA ---//
  /*
  estilo de linea sin relleno
  colIndex: indice de array de paleta de colores
  tam: tamaño de la linea
  */
  void linea(int colIndex,int tam){
     noFill();
     stroke(paleta[colIndex]);
     strokeWeight(tam);   
  }//----------------//
  
  //--- RELLENO CON LINEA ---//
  /*
  combina relleno con linea
  colIndex: (color principal) indice de array de paleta de colores
  tam: tamaño de la linea
  */
  void combinado(int colIndex,int tam){
    int cAux;
    
    if(random(1)<0.5){ cAux= abs((colIndex-1)%2);}
                 else{ cAux= (colIndex+1)%2;}
      //aux, define color de la linea    
    
    fill(paleta[colIndex]);     
    stroke(paleta[cAux]);
    strokeWeight(tam);
  }//----------------//
  
  //--- DEFINE ESTILO ---//
  /*
  define que tipo de estilo se utiliza
  estilo: (R: relleno) (L: linea) (C: combinado)
  colIndex: (color principal) indice de array de paleta de colores
  tam: tamaño de la linea
  */
  void addEstilo(char estilo, int colIndex, int tam){
    colIndex= colIndex % 3;
    switch(estilo){
      case 'R':    
      relleno(colIndex);
      break;
      case 'L':
      linea(colIndex,tam);
      break;
      case 'C':
      combinado(colIndex,tam);
      break;
    }
  }//----------------//
    
  //--- LIMPIA ESTILO ---//
  /*
  limpia el estilo
  */
  void limpiar(){
   noFill();
   noStroke();    
  }//----------------//  
}//-------- END OBJECT ---------// 
