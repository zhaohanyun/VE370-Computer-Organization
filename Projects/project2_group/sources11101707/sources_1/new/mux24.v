`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/10 13:21:19
// Design Name: 
// Module Name: mux24
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

module mux24(Out,In0,In1,s);
output Out;
input [3:0] In0;
input [3:0] In1;
input s;
reg [3:0] Out=4'b0000;
always @ (In0 or In1 or s)begin
    case(s)
    1'b0: Out=In0;
    1'b1: Out=In1;
    default Out=4'b0000;
    endcase
end
endmodule
