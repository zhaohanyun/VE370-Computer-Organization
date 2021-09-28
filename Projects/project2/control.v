`ifndef Control
`define Control

module Control(opcode,RegDst,Jump,Branch,MemRead,MemtoReg,ALUop,MemWrite,ALUSrc,RegWrite,BranchNot);
//branchnot is for bne
input [5:0]opcode;
output reg RegDst,Jump,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,BranchNot;
output reg [1:0] ALUop;

initial begin
    RegDst=1'b0;
    Jump=1'b0;
    Branch=1'b0;
    MemRead=1'b0;
    MemtoReg=1'b0;
    MemWrite=1'b0;
    ALUSrc=1'b0;
    RegWrite=1'b0;
    BranchNot=1'b0;
    ALUop=2'b00;
end

always@(opcode) begin
    case (opcode)
        6'b000000:begin  //R type
            ALUop=2'b10;RegDst=1'b1;Jump=1'b0;Branch=1'b0;MemRead=1'b0;MemtoReg=1'b0;
            MemWrite=1'b0;ALUSrc=1'b0;RegWrite=1'b1;BranchNot=1'b0;
        end

         6'b100011:begin //lw
            ALUop=2'b00;RegDst=1'b0;Jump=1'b0;Branch=1'b0;MemRead=1'b1;MemtoReg=1'b1;
            MemWrite=1'b0;ALUSrc=1'b1;RegWrite=1'b1;BranchNot=1'b0; 
        end

        6'b101011:begin //sw
            ALUop=2'b00;RegDst=1'b0;Jump=1'b0;Branch=1'b0;MemRead=1'b0;MemtoReg=1'b0;
            MemWrite=1'b1;ALUSrc=1'b1;RegWrite=1'b0;BranchNot=1'b0; 
        end

        6'b001000:begin //addi
            ALUop=2'b00;RegDst=1'b0;Jump=1'b0;Branch=1'b0;MemRead=1'b0;
            MemtoReg=1'b0;MemWrite=1'b0;ALUSrc=1'b1;RegWrite=1'b1;BranchNot=1'b0; 
        end

        6'b001100:begin //andi
            ALUop=2'b11;RegDst=1'b0;Jump=1'b0;Branch=1'b0;MemRead=1'b0;MemtoReg=1'b0;
            MemWrite=1'b0;ALUSrc=1'b1;RegWrite=1'b1;BranchNot=1'b0; 
        end

        6'b000100:begin //beq
            ALUop=2'b01;RegDst=1'b0;Jump=1'b0;Branch=1'b1;MemRead=1'b0;MemtoReg=1'b0;
            MemWrite=1'b0;ALUSrc=1'b0;RegWrite=1'b0;BranchNot=1'b0; 
        end

        6'b000101:begin //bne
            ALUop=2'b01;RegDst=1'b0;Jump=1'b0;Branch=1'b0;MemRead=1'b0;MemtoReg=1'b0;
            MemWrite=1'b0;ALUSrc=1'b0;RegWrite=1'b0;BranchNot=1'b1; 
        end

        6'b000010:begin //j
            ALUop=2'b00;RegDst=1'b0;Jump=1'b1;Branch=1'b0;MemRead=1'b0;MemtoReg=1'b0;
            MemWrite=1'b0;ALUSrc=1'b0;RegWrite=1'b0;BranchNot=1'b0; 
        end
        
    endcase
end

endmodule
`endif