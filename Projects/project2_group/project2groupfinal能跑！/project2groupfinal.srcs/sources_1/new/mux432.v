`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/07 12:23:04
// Design Name: 
// Module Name: mux432
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


module mux432(Out,In0,In1,In2,In3,s);
output [31:0] Out;
input [31:0] In0;
input [31:0] In1;
input [31:0] In2;
input [31:0] In3;
input [1:0] s;
reg [31:0] Out=32'b0;
always @ (In0 or In1 or In2 or In3 or s)begin
    case(s)
    2'b00: Out=In0;
    2'b01: Out=In1;
    2'b10: Out=In2;
    2'b11: Out=In3;
    default Out=32'b0;
    endcase
end
endmodule
