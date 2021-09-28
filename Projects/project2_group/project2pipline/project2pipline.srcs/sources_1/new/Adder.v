`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/29 12:19:37
// Design Name: 
// Module Name: Adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Adder(result,a,b);
output [31:0] result;
input [31:0] a;
input [31:0] b;
reg [3:0] operation=4'b0010;
reg ainvert=1'b0;
reg bnegate=1'b0;
wire zero;
wire overflow;
ALU tempALU (result,overflow,zero,a,b,ainvert,bnegate,operation);
endmodule
