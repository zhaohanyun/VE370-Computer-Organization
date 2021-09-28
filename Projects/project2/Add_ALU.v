`ifndef ADD_ALU
`define ADDALU

module Add_ALU(newPC,imm,b_addr);
input [31:0]newPC;
input [31:0]imm;
output [31:0]b_addr;

assign b_addr=newPC+(imm<<2);
endmodule
`endif