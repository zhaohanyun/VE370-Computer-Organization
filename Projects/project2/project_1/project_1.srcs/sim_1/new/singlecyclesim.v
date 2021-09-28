`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/11 15:36:00
// Design Name: 
// Module Name: singlecyclesim
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
module singlecyclesim;
reg clk;
wire [31:0]PCout;
wire [31:0]readdata2;
wire [31:0]writedata;
wire RegDst,Jump,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,BranchNot;
wire [1:0]ALUop;
wire [31:0]ALUresult;
singlecycle sc(clk,PCout,readdata2,writedata,RegDst,Jump,Branch,MemRead,MemtoReg,ALUop,MemWrite,ALUSrc,RegWrite,BranchNot,ALUresult);
integer count;
initial begin
//    #0 clk=0; count=1;$display("Time:%d, CLK=%d, PC=%h",0,0,00000000);
 #0 clk=1; count=1;$display("Time:%d, CLK=%d, PC=%h",0,0,00000000);
end
always #10 clk=~clk;
always #10
begin
    $display("Time:%d, CLK=%d, PC=%h",$time,clk,PCout);
    count=count+1;
end


initial #1000 $stop;
endmodule