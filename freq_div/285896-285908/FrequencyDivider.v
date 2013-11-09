`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:28:42 11/06/2013 
// Design Name: 
// Module Name:    FrequencyDivider 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

//-------------------------DIVISOR DE FRECUENCIA-----------------------------------
/* Descripción: Se entrega una frecuencia de salida clk_out a partir de una frecuencia
de entrada clk. El usuario debe ingresar los valores correspondientes a las variables
Ts(periodo de salida) y Te(periodo de entrada)en base a la frecuencias con las que se va a
trabajar.

Funcionamiento: Se define el parametro n = (periodo de salida)/(2*periodo de entrada)-1
la variable counter va contando desde 0 hasta el valor de n  veces el reloj de
la frecuencia de entrada. Cada vez que counter alcanza el valor de n  se modifica 
el estado de clk_out(1 o 0).

IMPORTANTE: valores de Ts y Te deben estar en las mismas unidades, para este ejemplo se emplean nano segundos.

en este codigo se desea una frecuencia de salida de 12,5MHz(es decir un periodo de 80ns) a partir de una frecuencia 
de entrada de 50MHz(es de cir un periodo de 20ns), si se desea efectuar la operacion con otra frecuencia de salida o  
de entrada se deben modificar los valores de las variables Ts y Te como se menciono anteriormente.
*/

module FrequencyDivider(clk,clk_out);

input clk;
    output reg clk_out;
    reg rst;
	 
/* el parametro n es la razon entre el periodo de salida sobre
dos veces el periodo de entrada   menos uno ya que cuenta desde 0, en este caso */
	
	parameter Ts = 80;
	parameter Te = 20;
	parameter n = ((Ts/(2*Te))-1);//si las unidades de Ts y Te son iguales se desprecian ya que en la division se cancelan.
	
	 
/* El parametro BitCount es el numero de bits necesarios para representar el paramtro n en binario, con
el fin de reducir calculos se le asigna a bitcount un valor grande en este caso 31 para no tener que efectuar la 
convercion a binario de cada parametron, si en algun caso el numero para representar el valor de n en 
binario es mayor a 31 este debe modificarse  */	 
	 parameter bitCount = 31;
	 reg [bitCount:0] counter;// vector de bitCount bits de tipo reg cuyo bit mas significante es el que ocupa 
	 // la posición bitCounter-1

initial
rst=0;// la variable rst se usa para poner las condiciones iniciales para empezar el conteo

    always @(posedge clk or negedge rst)//el proceso se evalua cada vez que se produce un flanco de subida en clk(0 a 1) 
													 //o un flanco de bajada es rst(1 a 0)				
	
	// se ponen los valores iniciales para dar paso al conteo
	begin
      if(!rst)// si rst = 0
       begin
       rst<=1;
       counter<=32'd0;
       clk_out <= 1'b0;//el reloj de baja frecuencia empieza en cero
       end
		 
		 
		 // cuando rst = 1 es decir se inicia el conteo
     else 
	 //si counter alcanzo el valor de n se cambia el estado de clk_out,se pone counter en 0 para que vuelva a contar
	 // y se modifica el valor de clk_out
       if(counter==n) 
         begin
         counter<=32'd0;
         clk_out <= ~clk_out;
         end
      // empieza a contar la variable counter si counter<divisor y rst=1
		else
       begin
       counter<=counter+1;
       end
   end
   
	


endmodule
