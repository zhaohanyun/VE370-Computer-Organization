`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/28 22:52:49
// Design Name: 
// Module Name: instructionMem
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


module instructionMem(Instruction,Readaddr);
output [31:0] Instruction;
input [31:0] Readaddr;
wire [31:0] Instruction;
reg [7:0] IM [63:0][3:0];
initial begin
$readmemb("C:/Users/Administrator/Desktop/VE370/Projects/InstructionMem.txt",IM);

end
assign Instruction[31:24]=IM[Readaddr/4][0];
assign Instruction[23:16]=IM[Readaddr/4][1];
assign Instruction[15:8]=IM[Readaddr/4][2];
assign Instruction[7:0]=IM[Readaddr/4][3];

endmodule
