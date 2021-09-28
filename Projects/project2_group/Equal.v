`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/05 10:35:15
// Design Name: 
// Module Name: Equal
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

module Equal(EqualResult,ReadData1, ReadData2);
    output EqualResult;
    input [31:0] ReadData1;
    input [31:0] ReadData2;
    
    reg EqualResult;
    
    always @(*) begin
        if (ReadData1 == ReadData2) begin
            EqualResult = 1'b1;
        end
        else begin
            EqualResult = 1'b0;
        end
    end
endmodule
