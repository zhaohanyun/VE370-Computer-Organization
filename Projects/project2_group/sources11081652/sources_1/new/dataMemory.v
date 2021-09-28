`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/29 10:14:29
// Design Name: 
// Module Name: dataMemory
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


module dataMemory(ReadData,Address,WriteData,MemWrite,MemRead,clk);
input [31:0] Address;
input [31:0] WriteData;
input MemWrite;
input MemRead;
input clk;
output [31:0] ReadData;

reg [31:0] ReadData=32'b0;
reg [31:0] storage [0:1023];
//For simplicity, we use max capacity of 1024 for demo.
always @ (MemWrite or MemRead or Address or WriteData)
begin
    if (MemWrite==1) storage[Address]=WriteData;
    else if (MemRead==1) ReadData=storage[Address];
end

endmodule
