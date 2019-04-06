//float contador=0;
import processing.serial.*;
float alturaRojo=0, alturaVerde=0, alturaAzul=0;
int posicionBase=250, alturaMax=50;
float combinacionColor=0;
int[] valor = new int[3];
Serial port;
int contador=0;
String[] valores;

void setup()
{
  port = new Serial(this, "/dev/ttyUSB0", 9600);
  size(600,400);
  surface.setTitle("Control de LED RGB con Potenciometros - ESCALABLE");
}

void draw()
{
  background(0);  
  
  while(port.available() > 0 )
  {    
    String valor = port.readString();
    valores = splitTokens(valor, ", ");    
  }  
  
  strokeWeight(3);
  stroke(255, 0, 0, 200);
  fill(255, 0, 0, 50);  
  rect( 100, alturaMax + int(valores[0]), 50, posicionBase-int(valores[0]), 1);
  
  fill(255, 220);
  textSize(18);
  text(Float.toString(posicionBase-float(valores[0])), 100, 40);
  text("Rojo", 100, 320);
  
  // Verde  
  stroke(0, 255, 0, 200);
  fill(0, 255, 0, 50);  
  rect( 200, alturaMax + int(valores[1]), 50, posicionBase-int(valores[1]), 1);
  
  fill(255, 220);
  textSize(18);
  text(Float.toString(posicionBase-float(valores[1])), 200, 40);
  text("Verde", 200, 320);
  
  // AZul
  
  stroke(0, 0, 255, 200);
  fill(0, 0, 255, 50);
  rect( 300, alturaMax + int(valores[2]), 50, posicionBase-int(valores[2]), 1);  
  
  fill(255, 220);
  text(Float.toString(posicionBase-float(valores[2])), 300, 40);
  text("Azul", 300, 320);
  
   // Combinacion
  stroke(posicionBase-alturaRojo, posicionBase-alturaVerde, posicionBase-alturaAzul, 255);
  fill( int(posicionBase-alturaRojo),int(posicionBase-alturaVerde), int(posicionBase-alturaAzul), 50);
  //println(Float.toString(posicionBase-alturaRojo) + "," + Float.toString(posicionBase-alturaVerde) + ",");
  rect( 400, alturaMax, 50, posicionBase, 1);
  fill(255);
  text(Float.toString( round( ((posicionBase-int(valores[0])) + (posicionBase-int(valores[1])) + (posicionBase-int(valores[2])) )/3 ) ), 400, 40);  
  text("Mezcla", 400, 320);
    
}
/*

void keyPressed(){
  
  switch(key)
  {
    case 'a':
    if(alturaRojo+alturaMax > alturaMax)
    {      
      alturaRojo--;
    }
    break;
    
    case 's':
    if( (posicionBase-alturaRojo) > 0)
    {
      alturaRojo++;
    }
    break;
    
    case 'k':
    if(alturaVerde+alturaMax > alturaMax)
    {      
      alturaVerde--;
    }
    break;
    
    case 'l':
    if( (posicionBase-alturaVerde) > 0)
    {
      alturaVerde++;
    }
    break;
    
    case 'n':
    if(alturaAzul+alturaMax > alturaMax)
    {  
      alturaAzul--;
    }
    break;
    
    case 'm':
    if( (posicionBase-alturaAzul) > 0)
    {
      alturaAzul++;
    }
    break;
     
  }
}

/*void mousePressed(){
  println("perro");
}*/
