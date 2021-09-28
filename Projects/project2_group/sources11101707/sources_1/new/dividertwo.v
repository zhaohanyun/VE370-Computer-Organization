`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/10 13:06:18
// Design Name: 
// Module Name: dividertwo
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


module dividertwo(out,reset,clk);
integer a=0;
output out;
input clk,reset;
reg out;
always @ (posedge clk or posedge reset)
begin
if (reset==1)begin
out<=0;
a<=0;
end
else if (a==299) begin//499 for 1s
out<=1;
a<=0;
end 
else if (a==2) out<=0;

a=a+1;
end
endmodule
