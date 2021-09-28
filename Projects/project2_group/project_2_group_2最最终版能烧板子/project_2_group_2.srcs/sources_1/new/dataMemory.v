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
reg [31:0] storage [0:31];
initial begin
storage[0]=32'b0;
storage[1]=32'b0;
storage[2]=32'b0;
storage[3]=32'b0;
storage[4]=32'b0;
storage[5]=32'b0;
storage[6]=32'b0;
storage[7]=32'b0;
storage[8]=32'b0;
storage[9]=32'b0;
storage[10]=32'b0;
storage[11]=32'b0;
storage[12]=32'b0;
storage[13]=32'b0;
storage[14]=32'b0;
storage[15]=32'b0;
storage[16]=32'b0;
storage[17]=32'b0;
storage[18]=32'b0;
storage[19]=32'b0;
storage[20]=32'b0;
storage[21]=32'b0;
storage[22]=32'b0;
storage[23]=32'b0;
storage[24]=32'b0;
storage[25]=32'b0;
storage[26]=32'b0;
storage[27]=32'b0;
storage[28]=32'b0;
storage[29]=32'b0;
storage[30]=32'b0;
storage[31]=32'b0;
end
//For simplicity, we use max capacity of 1024 for demo.
always @ (negedge clk)
begin
    if (MemWrite==1) storage[Address]<=WriteData;
    else if (MemRead==1) ReadData<=storage[Address];
end
/*
always @ (posedge clk or negedge clk)
begin
$display("DataMem[4]=%h, DataMem[8]=%h",storage[4],storage[8]);
end
*/
endmodule
