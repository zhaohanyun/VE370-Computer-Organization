`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/29 00:49:14
// Design Name: 
// Module Name: mux2
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


module mux2(Out,In0,In1,s);
output Out;
input In0;
input In1;
input s;
reg Out=1'b0;
always @ (In0 or In1 or s)begin
    case(s)
    1'b0: Out=In0;
    1'b1: Out=In1;
    default Out=1'b0;
    endcase
end
endmodule
