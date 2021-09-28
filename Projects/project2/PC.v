`ifndef MODULE_PC
`define MODULE_PC

module PC(clk,in, out);
input clk;
input [31:0]in;
output reg [31:0]out;

initial begin
    out=32'b11111111111111111111111111111100 ; //not from 0x00400000?
    //out=32'b0;
end

always@(posedge clk)begin
    out=in;
end

endmodule 
`endif