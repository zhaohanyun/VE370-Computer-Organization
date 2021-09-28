`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/29 00:50:13
// Design Name: 
// Module Name: add
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

module add(out,carry,a,b,carryin);
input a;
input b;
output carry;
input carryin;
output out;
reg out=1'b0;
reg carry;
always @ (a or b or carryin)
begin
out=(a+b+carryin)%2;
carry=(a+b+carryin)/2;
end
endmodule
