`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/04 17:04:19
// Design Name: 
// Module Name: IFID
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


module IFID(clk, IF_ID_Write, IF_Flush, IF_PCplusFour, IF_Instruction, ID_PCplusFour, ID_Instruction);

    input clk;
    input IF_ID_Write;
    
    input IF_Flush;
    input [31:0] IF_PCplusFour;
    input [31:0] IF_Instruction;
    output [31:0] ID_PCplusFour;
    output [31:0] ID_Instruction;

    //input Stall;
    reg [31:0] ID_PCplusFour, ID_Instruction;
    
    always @(posedge clk) begin
        if (IF_Flush == 1'b1) begin
            ID_PCplusFour = 32'b0;
            ID_Instruction = 32'b0;
        end
        else if (IF_ID_Write == 1'b1) begin
            ID_PCplusFour = IF_PCplusFour;
            ID_Instruction = IF_Instruction;
        end
    end

endmodule
