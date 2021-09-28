`ifndef ALUCONTROL
`define ALUCONTROL

module ALUcontrol(funct,ALUop,alufunction);
input [5:0]funct;
input [1:0]ALUop; //how many bits is enough? why not just providing opcode?
output reg [3:0]alufunction;


always@(funct or ALUop) begin
    case (ALUop)
        2'b00:alufunction=4'b0010;//add
        2'b01:alufunction=4'b0110;//sub
        2'b11:alufunction=4'b0000;//and
        2'b10:begin
            case(funct)
                6'b100000:alufunction=4'b0010;//add
                6'b100010:alufunction=4'b0110;//sub
                6'b100100:alufunction=4'b0000;//and
                6'b100101:alufunction=4'b0001;//or
                6'b101010:alufunction=4'b0111;//slt
            endcase
            end
     endcase
end

endmodule
`endif
