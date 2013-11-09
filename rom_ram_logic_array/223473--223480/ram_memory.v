`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:16:07 11/07/2013 
// Design Name: 
// Module Name:    ram_memory 
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
module ram_memory # (parameter N=4, M=4) /*Parameter permite la parametrización del modulo, donde se asigna el nombre y su respectivo valor, que en nuestro caso es N =4.*/
(input clk,
input we,                /*especificaamos el nombre de las entradas y salidas respectivamente con las cuales se van a trabajar.*/
input [N-1:0] adr,
input [M-1:0] din,
output  [N-1:0]dout);
reg [M-1:0] mem [N-1:0];   /*reg se usa para modelar las memorias, donde se accede mediante un determinado bit, con esta variable se declara el tamaño de cada memoria*/

always @ (posedge clk)    /* Always se ejecuta continuamente a modo de bucle, y  está continuamente ejecutándose. Que se activa cuando detecta un flanco de subida (posedge)*/
if (we) mem [adr] <= din;
assign dout = mem[adr];
endmodule