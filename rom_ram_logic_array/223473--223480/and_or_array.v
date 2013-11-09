`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:07:28 11/07/2013 
// Design Name: 
// Module Name:    and_or_array 
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
module and_or_array
# (parameter width = 8, sel=1) /*Parameter permite la parametrización del modulo, donde se asigna el nombre y tamaño.*/


(input [width-1:0] a,  /*declaración de entradas y salidas*/ 
output y);


genvar i;
wire [width-1:1] x;

generate    /*Proporciona datos para producir una determinada cantidad de variables de hardware en función del valor de un parámetro.*/
		
		if (sel==1)
			for (i=1; i<width; i=i+1) begin:forloop
				if (i == 1)
					assign x[1] = a[0] & a[1];
				else
					assign x[i] = a[i] & x[i-1];
			end
		else
			for (i=1; i<width; i=i+1) begin:forloop
				if (i == 1)
					assign x[1] = a[0] | a[1];
				else
					assign x[i] = a[i] | x[i-1];
			end
endgenerate

	assign y = x[width-1];

endmodule


