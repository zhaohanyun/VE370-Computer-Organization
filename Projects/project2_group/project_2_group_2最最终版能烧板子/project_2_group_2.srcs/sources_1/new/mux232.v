`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/30 00:59:13
// Design Name: 
// Module Name: mux232
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


module mux232(Out,In0,In1,s);
output [31:0] Out;
input [31:0] In0;
input [31:0] In1;
input s;
reg [31:0] Out=32'b0;
always @ (In0 or In1 or s)begin
    case(s)
    1'b0: Out=In0;
    1'b1: Out=In1;
    default Out=32'b0;
    endcase
end
endmodule
