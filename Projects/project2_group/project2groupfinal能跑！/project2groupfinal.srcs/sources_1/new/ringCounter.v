`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/10 12:48:54
// Design Name: 
// Module Name: ringCounter
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


module ringcount(out,reset,clk);
output [3:0] out;
input reset,clk;
reg [3:0] out=4'b1000;
always @ (posedge clk or posedge reset)
begin
    if (reset==1) out=4'b1000; 
    else begin
    case(out)
    4'b0001:out=4'b1000;
    4'b1000:out=4'b0100;
    4'b0100:out=4'b0010;
    4'b0010:out=4'b0001;
    endcase
    end
end
endmodule

