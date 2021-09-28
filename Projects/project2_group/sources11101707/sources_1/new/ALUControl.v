`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/29 12:15:12
// Design Name: 
// Module Name: ALUControl
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


module ALUControl(operation,ALUOp,funcCode);
output [3:0] operation;
input [1:0] ALUOp;
input [5:0] funcCode;
reg [3:0] operation;
always @ (ALUOp or funcCode) begin
case(ALUOp)
    2'b00:operation=4'b0010;//ADD
    2'b01:operation=4'b0110;//SUB
    2'b10:begin
    case(funcCode)
        6'b100000:operation=4'b0010;
        6'b100010:operation=4'b0110;
        6'b100100:operation=4'b0000;
        6'b100101:operation=4'b0001;
        6'b101010:operation=4'b0111;
    endcase
    end
    2'b11:operation=4'b0000;//AND
endcase
end
endmodule
