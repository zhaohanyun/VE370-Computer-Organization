`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/04 18:11:46
// Design Name: 
// Module Name: EXMEM
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


module EXMEM(clk, EX_Flush, EX_MemRead, EX_MemWrite, EX_MemtoReg, EX_RegWrite, EX_RegDst, EX_ALUResult, EX_ReadData2, 
                         MEM_MemRead, MEM_MemWrite, MEM_MemtoReg, MEM_RegWrite, MEM_RegDst, MEM_ALUResult, MEM_ReadData2);

    input clk;
    input EX_Flush;
    input EX_MemRead;
    input EX_MemWrite;
    input EX_MemtoReg;
    input EX_RegWrite;
    input [4:0] EX_RegDst;
    input [31:0] EX_ALUResult; 
    input [31:0] EX_ReadData2;
    output MEM_MemRead;
    output MEM_MemWrite;
    output MEM_MemtoReg;
    output MEM_RegWrite;
    output [4:0] MEM_RegDst;
    output [31:0] MEM_ALUResult;
    output [31:0] MEM_ReadData2;

    reg MEM_MemRead=1'b0;
    reg MEM_MemWrite=1'b0; 
    reg MEM_MemtoReg=1'b0;
    reg MEM_RegWrite=1'b0;
    reg [4:0] MEM_RegDst=4'b0;
    reg [31:0] MEM_ALUResult=32'b0;
    reg [31:0] MEM_ReadData2=32'b0;
    
    always @(posedge clk) begin
        if (EX_Flush == 1'b1) begin
            MEM_MemRead = 1'b0;
            MEM_MemWrite = 1'b0;
            MEM_MemtoReg = 1'b0;
            MEM_RegWrite = 1'b0;
            MEM_RegDst = 5'b0;
            MEM_ALUResult = 32'b0;
            MEM_ReadData2 = 32'b0;
        end
        else begin
            MEM_MemRead = EX_MemRead;
            MEM_MemWrite = EX_MemWrite;
            MEM_MemtoReg = EX_MemtoReg;
            MEM_RegWrite = EX_RegWrite;
            MEM_RegDst = EX_RegDst;
            MEM_ALUResult = EX_ALUResult;
            MEM_ReadData2 = EX_ReadData2;
        end
    end

endmodule
