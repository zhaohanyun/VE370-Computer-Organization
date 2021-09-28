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
reg [7:0] memory [63:0][3:0];
integer i;
/*
initial begin
$readmemb("D:/Courses/VE370/Project/p2/InstructionMem_for_P2_Demo_bonus.txt",memory);
end
*/

//BONUS:
initial begin
        { memory[0][3], memory[0][2], memory[0][1], memory[0][0] } = 32'b00100000000010000000000000100000; // 1
        { memory[1][3], memory[1][2], memory[1][1], memory[1][0] } = 32'b00100000000010010000000000110111; // 2
        { memory[2][3], memory[2][2], memory[2][1], memory[2][0] } = 32'b00000001000010011000000000100100; // 3
        { memory[3][3], memory[3][2], memory[3][1], memory[3][0] } = 32'b00000001000010011000000000100101; // 4
        { memory[4][3], memory[4][2], memory[4][1], memory[4][0] } = 32'b10101100000100000000000000000100; // 5
        { memory[5][3], memory[5][2], memory[5][1], memory[5][0] } = 32'b10101100000010000000000000001000; // 6
        { memory[6][3], memory[6][2], memory[6][1], memory[6][0] } = 32'b00000001000010011000100000100000; // 7
        { memory[7][3], memory[7][2], memory[7][1], memory[7][0] } = 32'b00000001000010011001000000100010; // 8
        { memory[8][3], memory[8][2], memory[8][1], memory[8][0] } = 32'b00010010001100100000000000001001; // 9
        { memory[9][3], memory[9][2], memory[9][1], memory[9][0] } = 32'b10001100000100010000000000000100; // 10
        { memory[10][3], memory[10][2], memory[10][1], memory[10][0] } = 32'b00110010001100100000000001001000; // 11
        { memory[11][3], memory[11][2], memory[11][1], memory[11][0] } = 32'b00010010001100100000000000001001; // 12
        { memory[12][3], memory[12][2], memory[12][1], memory[12][0] } = 32'b10001100000100110000000000001000; // 13
        { memory[13][3], memory[13][2], memory[13][1], memory[13][0] } = 32'b00010010000100110000000000001010; // 14
        { memory[14][3], memory[14][2], memory[14][1], memory[14][0] } = 32'b00000010010100011010000000101010; // 15
        { memory[15][3], memory[15][2], memory[15][1], memory[15][0] } = 32'b00010010100000000000000000001111; // 16
        { memory[16][3], memory[16][2], memory[16][1], memory[16][0] } = 32'b00000010001000001001000000100000; // 17
        { memory[17][3], memory[17][2], memory[17][1], memory[17][0] } = 32'b00001000000000000000000000001110; // 18
        { memory[18][3], memory[18][2], memory[18][1], memory[18][0] } = 32'b00100000000010000000000000000000; // 19
        { memory[19][3], memory[19][2], memory[19][1], memory[19][0] } = 32'b00100000000010010000000000000000; // 20
        { memory[20][3], memory[20][2], memory[20][1], memory[20][0] } = 32'b00001000000000000000000000011111; // 21
        { memory[21][3], memory[21][2], memory[21][1], memory[21][0] } = 32'b00100000000010000000000000000001; // 22
        { memory[22][3], memory[22][2], memory[22][1], memory[22][0] } = 32'b00100000000010010000000000000001; // 23
        { memory[23][3], memory[23][2], memory[23][1], memory[23][0] } = 32'b00001000000000000000000000011111; // 24
        { memory[24][3], memory[24][2], memory[24][1], memory[24][0] } = 32'b00100000000010000000000000000010; // 25
        { memory[25][3], memory[25][2], memory[25][1], memory[25][0] } = 32'b00100000000010010000000000000010; // 26
        { memory[26][3], memory[26][2], memory[26][1], memory[26][0] } = 32'b00001000000000000000000000011111; // 27
        { memory[27][3], memory[27][2], memory[27][1], memory[27][0] } = 32'b00100000000010000000000000000011; // 28
        { memory[28][3], memory[28][2], memory[28][1], memory[28][0] } = 32'b00100000000010010000000000000011; // 29
        { memory[29][3], memory[29][2], memory[29][1], memory[29][0] } = 32'b00001000000000000000000000011111; // 30
        
        for ( i = 30; i < 64; i = i+1 ) 
        begin
            memory[i][3] = 8'b0;
            memory[i][2] = 8'b0;
            memory[i][1] = 8'b0;
            memory[i][0] = 8'b0;
        end
end
// direction need to be inversed
assign Instruction[31:24]=memory[Readaddr/4][3];
assign Instruction[23:16]=memory[Readaddr/4][2];
assign Instruction[15:8]=memory[Readaddr/4][1];
assign Instruction[7:0]=memory[Readaddr/4][0];

endmodule
