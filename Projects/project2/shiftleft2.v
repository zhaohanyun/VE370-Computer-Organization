`ifndef SHIFTLEFT2
`define SHIFTLEFT2

module Shiftleft2_26bit(instruction,j_addr);
input [25:0]instruction;
output [27:0]j_addr;

assign j_addr=instruction<<2;
endmodule

module Shiftleft2_32bit(signeximm,addaluop2);
input [31:0]signeximm;
output [31:0]addaluop2;

assign addaluop2=signeximm<<2;
endmodule

//左移位宽加深，右移位宽不变。这里会不会有问题？
`endif