`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/01 13:02:03
// Design Name: 
// Module Name: Hazard_Detection_Unit
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


module Hazard_Detection_Unit(
    IF_ID_RegisterRs, IF_ID_RegisterRt, ID_EX_RegisterRt, ID_EX_RegisterRd, EX_MEM_RegisterRd,
    ID_EX_MemRead, EX_MEM_MemRead, ID_EX_RegWrite, IDbranch,
    PCWrite, IF_ID_Write, stall, IF_Flush
    );
    input [4:0] IF_ID_RegisterRs;
    input [4:0] IF_ID_RegisterRt;
    input [4:0] ID_EX_RegisterRt;
    input [4:0] ID_EX_RegisterRd;
    input [4:0] EX_MEM_RegisterRd;
    input ID_EX_MemRead;
    input EX_MEM_MemRead;
    input ID_EX_RegWrite;
    input IDbranch;
    output reg PCWrite;
    output reg IF_ID_Write;
    output reg stall;
    output reg IF_Flush;


    initial begin
        PCWrite = 1'b1;
        IF_ID_Write = 1'b1;
        stall = 1'b0;
    end
    
    always @(*) begin
        //PC write and IFID write
        if (ID_EX_MemRead && ((ID_EX_RegisterRt == IF_ID_RegisterRs) || (ID_EX_RegisterRt == IF_ID_RegisterRt))) begin
            PCWrite = 1'b0;
            IF_ID_Write = 1'b0;
            //stall = 1'b1;
        end
        else begin
            PCWrite = 1'b1;
            IF_ID_Write = 1'b1;
            //stall = 1'b0;
        end
        
        
        //IF_Flush
        if (IDbranch) begin
            //add + beq stalled +beq
//            if (ID_EX_RegWrite && ID_EX_RegisterRd && ((ID_EX_RegisterRd == IF_ID_RegisterRs) || (ID_EX_RegisterRd == IF_ID_RegisterRt))) begin
//                //stall = 1'b1;
//                IF_Flush = 1'b1;
//            end
//            // lw + nop +beq stalled + beq
//            if (EX_MEM_MemRead && EX_MEM_RegisterRd && ((EX_MEM_RegisterRd == IF_ID_RegisterRs) || (EX_MEM_RegisterRd == IF_ID_RegisterRt))) begin
//                //stall = 1'b1;
//                IF_Flush = 1'b1;
//            end
            if ((ID_EX_RegWrite && ID_EX_RegisterRd && ((ID_EX_RegisterRd == IF_ID_RegisterRs) || (ID_EX_RegisterRd == IF_ID_RegisterRt))) || (EX_MEM_MemRead && EX_MEM_RegisterRd && ((EX_MEM_RegisterRd == IF_ID_RegisterRs) || (EX_MEM_RegisterRd == IF_ID_RegisterRt))) ) begin
                IF_Flush = 1'b1;
            end
            else IF_Flush =1'b0;
        end
        
        //stall
        if  ( (ID_EX_MemRead && ((ID_EX_RegisterRt == IF_ID_RegisterRs) || (ID_EX_RegisterRt == IF_ID_RegisterRt))) || (ID_EX_RegWrite && ID_EX_RegisterRd && ((ID_EX_RegisterRd == IF_ID_RegisterRs) || (ID_EX_RegisterRd == IF_ID_RegisterRt))) || (EX_MEM_MemRead && EX_MEM_RegisterRd && ((EX_MEM_RegisterRd == IF_ID_RegisterRs) || (EX_MEM_RegisterRd == IF_ID_RegisterRt))) ) 
            stall=1'b1;
        else 
            stall=1'b0;
            
            
    end
endmodule
