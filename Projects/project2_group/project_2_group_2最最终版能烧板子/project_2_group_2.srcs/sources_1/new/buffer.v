`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/10 12:59:15
// Design Name: 
// Module Name: buffer
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


module buffer(out,in0,in1,in2,in3,sig);
output [3:0] out;
input [3:0] in0;
input [3:0] in1;
input [3:0] in2;
input [3:0] in3;
input [3:0] sig;
reg [3:0] out;
always @ (sig or in0 or in1 or in2 or in3)begin
case(sig)
    4'b0001:out=in0;
    4'b0010:out=in1;
    4'b0100:out=in2;
    4'b1000:out=in3;
    default:out=4'b0;
endcase
end
endmodule
