`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/29 00:50:50
// Design Name: 
// Module Name: mux4
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


module mux4(Out,In0,In1,In2,In3,s);
output Out;
input In0;
input In1;
input In2;
input In3;
input [1:0] s;
reg Out;
always @ (In0 or In1 or In2 or In3 or s)begin
    case(s)
    2'b00: Out=In0;
    2'b01: Out=In1;
    2'b10: Out=In2;
    2'b11: Out=In3;
    default Out=1'b0;
    endcase
end
endmodule
