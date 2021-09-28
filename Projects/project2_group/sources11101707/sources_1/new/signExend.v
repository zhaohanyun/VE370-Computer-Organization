`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/29 01:01:55
// Design Name: 
// Module Name: signExend
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


module signExtend(extendedImm,Imm);
input [15:0] Imm;
output [31:0] extendedImm;
reg [31:0] extendedImm=32'b0;
always @ (Imm) begin
extendedImm[15:0]=Imm;
extendedImm[31]=Imm[15];
extendedImm[30]=Imm[15];
extendedImm[29]=Imm[15];
extendedImm[28]=Imm[15];
extendedImm[27]=Imm[15];
extendedImm[26]=Imm[15];
extendedImm[25]=Imm[15];
extendedImm[24]=Imm[15];
extendedImm[23]=Imm[15];
extendedImm[22]=Imm[15];
extendedImm[21]=Imm[15];
extendedImm[20]=Imm[15];
extendedImm[19]=Imm[15];
extendedImm[18]=Imm[15];
extendedImm[17]=Imm[15];
extendedImm[16]=Imm[15];
end
endmodule
