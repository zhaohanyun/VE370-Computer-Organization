`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/04 17:02:53
// Design Name: 
// Module Name: IDEX
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


module IDEX(clk, ID_MemRead, ID_MemWrite, ID_MemtoReg, ID_RegWrite, ID_ReadData1, ID_ReadData2, ID_InstrExt, ID_RegRs, ID_RegRt, ID_RegRd, ID_ALUOp, ID_ALUSrc, EX_MemRead, EX_MemWrite, EX_MemtoReg, EX_RegWrite, EX_ReadData1, EX_ReadData2, EX_InstrExt, EX_RegRs, EX_RegRt, EX_RegRd, EX_ALUOp, EX_ALUSrc);

    input clk;
    input ID_MemRead;
    input ID_MemWrite;
    input ID_MemtoReg;
    input ID_RegWrite;
    input ID_ALUSrc;
    input [31:0] ID_ReadData1;
    input [31:0] ID_ReadData2;
    input [31:0] ID_InstrExt;
    input [4:0] ID_RegRs;
    input [4:0] ID_RegRt;
    input [4:0] ID_RegRd;
    input [1:0] ID_ALUOp;
    output EX_MemRead;
    output EX_MemWrite;
    output EX_MemtoReg;
    output EX_RegWrite;
    output EX_ALUSrc;
    output [31:0] EX_ReadData1;
    output [31:0] EX_ReadData2;
    output [31:0] EX_InstrExt;
    output [4:0] EX_RegRs;
    output [4:0] EX_RegRt;
    output [4:0] EX_RegRd;
    output [1:0] EX_ALUOp;

    reg EX_MemRead, EX_MemWrite, EX_MemtoReg, EX_RegWrite, EX_ALUSrc;
    reg [31:0] EX_ReadData1, EX_ReadData2, EX_InstrExt;
    reg [4:0] EX_RegRs, EX_RegRt, EX_RegRd;
    reg [1:0] EX_ALUOp;
    
    always @(posedge clk) begin
        /*
        if (ID_Flush == 1'b1 && Stall == 1'b1) begin
            EX_MemRead <= 1'b0;
            EX_MemWrite <= 1'b0;
            EX_MemtoReg <= 1'b0;
            EX_RegWrite <= 1'b0;
            EX_ALUSrc <= 1'b0;
            EX_ReadData1 <= 32'b0;
            EX_ReadData2 <= 32'b0;
            EX_InstrExt <= 32'b0;
            EX_RegRs <= 5'b0;
            EX_RegRt <= 5'b0;
            EX_RegRd <= 5'b0;
            EX_ALUOp <= 2'b0;
        end
        else begin
        */
            EX_MemRead = ID_MemRead;
            EX_MemWrite = ID_MemWrite;
            EX_MemtoReg = ID_MemtoReg;
            EX_RegWrite = ID_RegWrite;
            EX_ALUSrc = ID_ALUSrc;
            EX_ReadData1 = ID_ReadData1;
            EX_ReadData2 = ID_ReadData2;
            EX_InstrExt = ID_InstrExt;
            EX_RegRs = ID_RegRs;
            EX_RegRt = ID_RegRt;
            EX_RegRd = ID_RegRd;
            EX_ALUOp = ID_ALUOp;
        //end
    end

endmodule
