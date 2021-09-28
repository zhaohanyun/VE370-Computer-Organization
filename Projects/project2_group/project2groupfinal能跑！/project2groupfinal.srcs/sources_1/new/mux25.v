`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/29 21:28:57
// Design Name: 
// Module Name: mux25
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



module mux25(Out,In0,In1,s);
output [4:0] Out;
input [4:0] In0;
input [4:0] In1;
input s;
reg [4:0] Out=5'b00000;
always @ (In0 or In1 or s)begin
    case(s)
    1'b0: Out=In0;
    1'b1: Out=In1;
    default Out=5'b00000;
    endcase
end
endmodule

