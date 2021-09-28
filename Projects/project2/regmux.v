`ifndef REGMUX
`define REGMUX

module RegMux(RegDst,reg1,reg2,dst);
input RegDst;
input [4:0]reg1,reg2;
output [4:0]dst;

assign dst=RegDst?reg2:reg1;
endmodule
`endif