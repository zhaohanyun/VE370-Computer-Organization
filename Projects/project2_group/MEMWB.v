`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/04 18:26:34
// Design Name: 
// Module Name: MEMWB
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


module MEMWB(clk, MEM_MemtoReg, MEM_RegWrite, MEM_RegDst, MEM_ReadData, MEM_ALUResult, WB_MemtoReg, WB_RegWrite, WB_RegDst, WB_ReadData, WB_ALUResult);

    input clk;
    input MEM_MemtoReg;
    input MEM_RegWrite;
    input [4:0] MEM_RegDst;
    input [31:0] MEM_ReadData;
    input [31:0] MEM_ALUResult;
    output WB_MemtoReg;
    output WB_RegWrite;
    output [4:0] WB_RegDst;
    output [31:0] WB_ReadData;
    output [31:0] WB_ALUResult;


    reg WB_MemtoReg=1'b0;
    reg WB_RegWrite=1'b0;
    reg [4:0] WB_RegDst=4'b0;
    reg [31:0] WB_ReadData=32'b0;
    reg [31:0] WB_ALUResult=32'b0;
    
    always @(posedge clk) begin
        WB_MemtoReg = MEM_MemtoReg;
        WB_RegWrite = MEM_RegWrite;
        WB_RegDst = MEM_RegDst;
        WB_ReadData = MEM_ReadData;
        WB_ALUResult = MEM_ALUResult;
    end

endmodule
