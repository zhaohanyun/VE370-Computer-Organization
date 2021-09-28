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

module Equal(EqualRes,ReadData1, ReadData2);
    output EqualRes;
    input [31:0] ReadData1;
    input [31:0] ReadData2;
    
    reg EqualRes=1'b0;
    
    always @(*) begin
        if (ReadData1 == ReadData2) begin
            EqualRes = 1'b1;
        end
        else begin
            EqualRes = 1'b0;
        end
    end
endmodule
