`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/07 15:11:30
// Design Name: 
// Module Name: p2pipelineSIM
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


module p2pipelineSIM;
/*
//Test Control
wire [1:0] outALUOp;//EX
wire outWriteReg,outALUSrc;
wire outMemRead,outMemWrite;
wire outRegWrite,outMemtoReg; 
reg [1:0] inALUOp;//EX
reg inWriteReg,inALUSrc;
reg inMemRead,inMemWrite;
reg inRegWrite,inMemtoReg;
reg s; 
muxControl UUT (outALUOp,outWriteReg,outALUSrc,
outMemRead,outMemWrite,
outRegWrite,outMemtoReg,    
inALUOp,inWriteReg,inALUSrc,
inMemRead,inMemWrite,
inRegWrite,inMemtoReg,s); 
initial begin
#0 inALUOp=2'b10;inWriteReg=1'b0;inALUSrc=1'b0;inMemRead=1'b0;inMemWrite=1'b1;inRegWrite=1'b1;inMemtoReg=1'b1;s=1'b0;
#20 inALUOp=2'b11;inWriteReg=1'b1;inALUSrc=1'b1;inMemRead=1'b1;inMemWrite=1'b0;inRegWrite=1'b0;inMemtoReg=1'b1;s=1'b0;
#20 inALUOp=2'b10;inWriteReg=1'b0;inALUSrc=1'b0;inMemRead=1'b0;inMemWrite=1'b1;inRegWrite=1'b1;inMemtoReg=1'b1;s=1'b1;
#20 inALUOp=2'b11;inWriteReg=1'b1;inALUSrc=1'b1;inMemRead=1'b1;inMemWrite=1'b0;inRegWrite=1'b0;inMemtoReg=1'b1;s=1'b1;
end
*/


//Testing Log
/*
11.7 23:59 DONE!
[31:0] NonJumpTarget
IDJump
[31:0] PCin
[31:0] IDinstr
*/
/*
11.8 0:30
[1:0] ForwardA;
[1:0] ForwardB;
[31:0] EXALUResult;
[31:0] ALUinA;
[31:0] ALUinB;
*/
//11.7 23:59
wire [31:0] NonJumpTarget;
wire IDJump;
wire [31:0] PCin;
wire [31:0] IDinstr;
//11.8 0:30
wire [1:0] ForwardA;
wire [1:0] ForwardB;
wire [31:0] EXALUResult;
wire [31:0] ALUinA;
wire [31:0] ALUinB;
wire ForwardC,ForwardD;




wire [31:0] PC;
reg clk;
integer count;
//project2pipeline UUT (PC,clk);
project2pipeline UUT (PC,clk,NonJumpTarget, IDJump, PCin, IDinstr, ForwardA, ForwardB,ForwardC,ForwardD, EXALUResult,ALUinA,ALUinB);
initial begin
    #0 clk=0; count=1;$display("Time:%d, CLK=%d, PC=%h",0,0,00000000);
end
always #10 clk=~clk;
always #10
begin
    $display("Time:%d, CLK=%d, PC=%h",$time,clk,PC);
    count=count+1;
end


initial #1000 $stop; 

endmodule
