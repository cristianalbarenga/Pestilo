/*--- OBJETO ESTILO ---
  define y aplica estilo grafico 
  ('R') Formas Rellenas
  ('L') Formas Lineales ('L')
  ('C') Combinacion de relleno y linea
*/

class Pestilo{
  
 /************** VARIABLES *************
  -------------------------------------*/  
 color[] paleta; //paleta de color
 int cantColores; //cantidad de colores
 
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
   cantColores= pal.length; //define la cantidad de colores que hay   
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
    int cAux; //aux, define color de la linea    
    
    //aumenta o disminuye una posicion del color Index
    if(random(1)<0.5){ cAux=(colIndex+1) % cantColores; } 
                 else{ if (colIndex != 0){ cAux=(colIndex-1) % cantColores; }
                                     else{ cAux=cantColores-1;}                
                     }
                     
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
    colIndex= colIndex % cantColores;
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
