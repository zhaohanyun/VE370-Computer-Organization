`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/29 09:55:40
// Design Name: 
// Module Name: shiftLeft16
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


module shiftLeft16(extendedImm,Imm);
    
input [31:0] Imm;
output [31:0] extendedImm;
reg [31:0] extendedImm=32'b0;

always @ (Imm) begin
extendedImm[31:2]=Imm[29:0];
extendedImm[1]=1'b0;
extendedImm[0]=1'b0;
end
endmodule
