`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/29 11:39:04
// Design Name: 
// Module Name: Control
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


module Control(ALUOp,RegDst,Jump,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,BranchNot,Opcode);
output RegDst,Jump,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,BranchNot;
output [1:0] ALUOp;
input [5:0] Opcode;
reg RegDst=1'b0;
reg Jump=1'b0;
reg Branch=1'b0;
reg MemRead=1'b0;
reg MemtoReg=1'b0;
reg MemWrite=1'b0;
reg ALUSrc=1'b0;
reg RegWrite=1'b0;
reg BranchNot=1'b0;
reg [1:0] ALUOp=2'b0;

always @ (Opcode) begin
case(Opcode)
    6'b000000:begin ALUOp=2'b10;RegDst=1'b1;Jump=1'b0;Branch=1'b0;MemRead=1'b0;MemtoReg=1'b0;MemWrite=1'b0;ALUSrc=1'b0;RegWrite=1'b1;BranchNot=1'b0; end
    
    6'b100011:begin ALUOp=2'b00;RegDst=1'b0;Jump=1'b0;Branch=1'b0;MemRead=1'b1;MemtoReg=1'b1;MemWrite=1'b0;ALUSrc=1'b1;RegWrite=1'b1;BranchNot=1'b0; end
    6'b101011:begin ALUOp=2'b00;RegDst=1'b0;Jump=1'b0;Branch=1'b0;MemRead=1'b0;MemtoReg=1'b0;MemWrite=1'b1;ALUSrc=1'b1;RegWrite=1'b0;BranchNot=1'b0; end
  //6'b000000:begin ALUOp=2'b10;RegDst=1'b1;Jump=1'b0;Branch=1'b0;MemRead=1'b0;MemtoReg=1'b0;MemWrite=1'b0;ALUSrc=1'b0;RegWrite=1'b1;BranchNot=1'b0; end
    6'b001000:begin ALUOp=2'b00;RegDst=1'b0;Jump=1'b0;Branch=1'b0;MemRead=1'b0;MemtoReg=1'b0;MemWrite=1'b0;ALUSrc=1'b1;RegWrite=1'b1;BranchNot=1'b0; end
  //6'b000000:begin ALUOp=2'b10;RegDst=1'b1;Jump=1'b0;Branch=1'b0;MemRead=1'b0;MemtoReg=1'b0;MemWrite=1'b0;ALUSrc=1'b0;RegWrite=1'b1;BranchNot=1'b0; end  
  //6'b000000:begin ALUOp=2'b10;RegDst=1'b1;Jump=1'b0;Branch=1'b0;MemRead=1'b0;MemtoReg=1'b0;MemWrite=1'b0;ALUSrc=1'b0;RegWrite=1'b1;BranchNot=1'b0; end
    6'b001100:begin ALUOp=2'b11;RegDst=1'b0;Jump=1'b0;Branch=1'b0;MemRead=1'b0;MemtoReg=1'b0;MemWrite=1'b0;ALUSrc=1'b1;RegWrite=1'b1;BranchNot=1'b0; end
  //6'b000000:begin ALUOp=2'b10;RegDst=1'b1;Jump=1'b0;Branch=1'b0;MemRead=1'b0;MemtoReg=1'b0;MemWrite=1'b0;ALUSrc=1'b0;RegWrite=1'b1;BranchNot=1'b0; end
  //6'b000000:begin ALUOp=2'b10;RegDst=1'b1;Jump=1'b0;Branch=1'b0;MemRead=1'b0;MemtoReg=1'b0;MemWrite=1'b0;ALUSrc=1'b0;RegWrite=1'b1;BranchNot=1'b0; end
    6'b000100:begin ALUOp=2'b01;RegDst=1'b0;Jump=1'b0;Branch=1'b1;MemRead=1'b0;MemtoReg=1'b0;MemWrite=1'b0;ALUSrc=1'b0;RegWrite=1'b0;BranchNot=1'b0; end
    6'b000101:begin ALUOp=2'b01;RegDst=1'b0;Jump=1'b0;Branch=1'b0;MemRead=1'b0;MemtoReg=1'b0;MemWrite=1'b0;ALUSrc=1'b0;RegWrite=1'b0;BranchNot=1'b1; end
    6'b000010:begin ALUOp=2'b00;RegDst=1'b0;Jump=1'b1;Branch=1'b0;MemRead=1'b0;MemtoReg=1'b0;MemWrite=1'b0;ALUSrc=1'b0;RegWrite=1'b0;BranchNot=1'b0; end
endcase
end


endmodule
