`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/29 09:50:39
// Design Name: 
// Module Name: shiftLeft26
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


module shiftLeft26(extendedImm,Imm);
    
input [25:0] Imm;
output [27:0] extendedImm;
reg [27:0] extendedImm;

always @ (Imm) begin
extendedImm[27:2]=Imm;
extendedImm[1]=1'b0;
extendedImm[0]=1'b0;
end
endmodule

