`ifndef MUX32
`define MUX32

module Mux32(sel,data1,data2,data);
input sel;
input [31:0]data1, data2;
output [31:0]data;

assign data=sel?data2:data1;
endmodule
`endif