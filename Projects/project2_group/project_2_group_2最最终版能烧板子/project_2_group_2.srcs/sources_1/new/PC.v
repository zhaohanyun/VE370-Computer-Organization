`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/29 19:25:03
// Design Name: 
// Module Name: PC
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

module PC(PCout,PCin,PCWrite,clk);
output [31:0] PCout;
input [31:0] PCin;
input PCWrite;
input clk;

reg [31:0] PCout=32'b0;
always @ (posedge clk) begin
if (PCWrite == 1'b1) begin
    PCout=PCin;
end
end
endmodule
