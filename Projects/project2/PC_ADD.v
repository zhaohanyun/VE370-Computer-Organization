`ifndef PC_ADD
`define PC_ADD

module PC_ADD4(PC,newPC);
input [31:0]PC;
output [31:0]newPC;

assign newPC=PC+4;

endmodule
`endif