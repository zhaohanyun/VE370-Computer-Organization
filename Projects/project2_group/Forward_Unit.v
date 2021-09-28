`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/31 21:30:33
// Design Name: 
// Module Name: Forward_Unit
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


module Forward_Unit(
    IF_ID_RegisterRs, IF_ID_RegisterRt, ID_EX_RegisterRs, ID_EX_RegisterRt, EX_MEM_RegisterRd, MEM_WB_RegisterRd,
    EX_MEM_RegWrite, MEM_WB_RegWrite,
    ForwardA, ForwardB,
    ForwardC, ForwardD
    );
    input [4:0] IF_ID_RegisterRs;
    input [4:0] IF_ID_RegisterRt;
    input [4:0] ID_EX_RegisterRs;
    input [4:0] ID_EX_RegisterRt;
    input [4:0] EX_MEM_RegisterRd;
    input [4:0] MEM_WB_RegisterRd;
    input EX_MEM_RegWrite;
    input MEM_WB_RegWrite;
    output reg  [1:0] ForwardA;
    output reg  [1:0] ForwardB;
    output reg  ForwardC;
    output reg  ForwardD;

    initial begin
        ForwardA = 2'b00;
        ForwardB = 2'b00;
        ForwardC = 1'b0;
        ForwardD = 1'b0;
    end
    
    always @(*) begin
        //EX Hazard
//        if (EX_MEM_RegWrite && EX_MEM_RegisterRd && EX_MEM_RegisterRd == ID_EX_RegisterRs) ForwardA = 2'b10; else ForwardA=2'b00;
//        if (EX_MEM_RegWrite && EX_MEM_RegisterRd && EX_MEM_RegisterRd == ID_EX_RegisterRt) ForwardB = 2'b10; else ForwardB = 2'b00;
//        //MEM Hazard
//        if (MEM_WB_RegWrite && MEM_WB_RegisterRd && MEM_WB_RegisterRd == ID_EX_RegisterRs) ForwardA = 2'b01; else ForwardA = 2'b00;
//        else if (MEM_WB_RegWrite && MEM_WB_RegisterRd && MEM_WB_RegisterRd == ID_EX_RegisterRt) ForwardB = 2'b01;
//        //and + beq stalled + beq
//        if (EX_MEM_RegWrite && EX_MEM_RegisterRd && EX_MEM_RegisterRd == IF_ID_RegisterRs) ForwardC = 1'b1;
//        else if (EX_MEM_RegWrite && EX_MEM_RegisterRd && EX_MEM_RegisterRd == IF_ID_RegisterRt) ForwardD = 1'b1;
        if (EX_MEM_RegWrite && EX_MEM_RegisterRd && EX_MEM_RegisterRd == ID_EX_RegisterRs) ForwardA = 2'b10; 
        else if (MEM_WB_RegWrite && MEM_WB_RegisterRd && MEM_WB_RegisterRd == ID_EX_RegisterRs) ForwardA = 2'b01;
        else ForwardA=2'b00;
        
        if (EX_MEM_RegWrite && EX_MEM_RegisterRd && EX_MEM_RegisterRd == ID_EX_RegisterRt) ForwardB = 2'b10; 
        else if (MEM_WB_RegWrite && MEM_WB_RegisterRd && MEM_WB_RegisterRd == ID_EX_RegisterRt) ForwardB = 2'b01;
        else ForwardB = 2'b00;

        if (EX_MEM_RegWrite && EX_MEM_RegisterRd && EX_MEM_RegisterRd == IF_ID_RegisterRs) ForwardC = 1'b1; else ForwardC=1'b0;
        if (EX_MEM_RegWrite && EX_MEM_RegisterRd && EX_MEM_RegisterRd == IF_ID_RegisterRt) ForwardD = 1'b1; else ForwardD=1'b0;
    end
endmodule
