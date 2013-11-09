`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:01:08 11/07/2013 
// Design Name: 
// Module Name:    rom_memory 
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
module rom_memory #(parameter N=8)
(
input [N-1:0] addr,		//Entrada de Direcciones de Memoria
output [N-1:0] datout); 			//Salida de Datos


		// N=8Tamaño del dato
		// N=8 Numero de datos en la memoria*/
reg [N-1:0] rom [0:N-1];
parameter data = 4'b1001; 	//Datos almacenados en Memoria
parameter IXLEFT = N-1;			//Máximo de Direcciones de Memoria
integer i;
//wire temp;

initial
begin
for (i=0; i<N; i=i+1)
rom[i] = data [(IXLEFT-N*i)-:N];
end
assign datout = rom[addr];
endmodule
   
