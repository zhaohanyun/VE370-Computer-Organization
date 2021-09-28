`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/07 14:57:32
// Design Name: 
// Module Name: muxControl
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


module muxControl(
outALUOp,outRegDst,outALUSrc,
outMemRead,outMemWrite,
outRegWrite,outMemtoReg,    
inALUOp,inRegDst,inALUSrc,
inMemRead,inMemWrite,
inRegWrite,inMemtoReg,
s    
);

output [1:0] outALUOp;//EX
output outRegDst,outALUSrc;
output outMemRead,outMemWrite;
output outRegWrite,outMemtoReg; 
input [1:0] inALUOp;//EX
input inRegDst,inALUSrc;
input inMemRead,inMemWrite;
input inRegWrite,inMemtoReg;
input s; 

reg [1:0] outALUOp=2'b0;//EX
reg outRegDst=1'b0;
reg outALUSrc=1'b0;
reg outMemRead=1'b0;//MEM
reg outMemWrite=1'b0;
reg outRegWrite=1'b0;//WB
reg outMemtoReg=1'b0; 

always @ (inALUOp or inRegDst or inALUSrc or inMemRead or inMemWrite or inRegWrite or inMemtoReg or s)begin
    case(s)
    1'b0: begin
    outALUOp=inALUOp;
    outRegDst=inRegDst;
    outALUSrc=inALUSrc;
    outMemRead=inMemRead;
    outMemWrite=inMemWrite;
    outRegWrite=inRegWrite;
    outMemtoReg=inMemtoReg;
    end
    1'b1: begin
    outALUOp=2'b00;//EX
    outRegDst=1'b0;
    outALUSrc=1'b0;
    outMemRead=1'b0;
    outMemWrite=1'b0;
    outRegWrite=1'b0;
    outMemtoReg=1'b0; 
    end
    endcase
end
endmodule

