`ifndef ALU
`define ALU

module ALU(result,zero,a,b,operation);
input [31:0]a,b;
output  zero;
output reg [31:0]result;//when a reg is needed?
input [3:0]operation;

assign zero=((a-b)==0);

initial begin
    result=32'b0;
end
always@(a or b or operation) begin
    case(operation)
        4'b0010://add
        result=a+b;

        4'b0110://sub
        result=a-b;

        4'b0000://and
        result=a & b;

        4'b0001://or
        result=a | b;

        4'b0111://slt
        result=(a<b)?1:0;

    endcase
end

endmodule
`endif