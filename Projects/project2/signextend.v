`ifndef MODULE_SIGNEXTEND
`define MODULE_SIGNEXTEND

module SignExtend(in, out);
input [15:0]in;
output [31:0] out;

assign out={{16{in[15]}},in[15:0]};

endmodule

`endif

