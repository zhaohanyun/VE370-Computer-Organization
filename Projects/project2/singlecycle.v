`ifndef SINGLECYCLE
`define SINGLECYCLE

module singlecycle(clk,PCout,readdata2,writedata,RegDst,Jump,Branch,MemRead,MemtoReg,ALUop,MemWrite,ALUSrc,RegWrite,BranchNot,ALUresult);
input clk;
output [31:0]PCout;
//wire[31:0] PCin,PCout;//the input and output of PC
wire[31:0] PCin;//the input and output of PC
PC pc(clk,PCin,PCout);

wire [31:0]instruction;
inst_mem im(PCout,instruction);

output RegDst,Jump,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,BranchNot;
output [1:0] ALUop;
Control control(instruction[31:26],RegDst,Jump,Branch,MemRead,MemtoReg,ALUop,MemWrite,ALUSrc,RegWrite,BranchNot);

wire [4:0]writereg;
output [31:0]writedata;
wire [31:0] readdata1;
output [31:0]readdata2;
Regfile regfile(clk,instruction[25:21],instruction[20:16],writereg,writedata,readdata1,readdata2,RegWrite);
//clk, readreg1, readreg2, writereg, writedata, readdata1, readdata2,regwrite

RegMux regmux(RegDst,instruction[20:16],instruction[15:11],writereg);

wire[31:0]signeximm;
SignExtend signextend(instruction[15:0], signeximm);

wire [3:0]aluoperation;
ALUcontrol alucontrol(instruction[5:0],ALUop,aluoperation);

wire [31:0] operand1, operand2;//operand1 seems unused because readdata1 directly connected to ALU
Mux32 mux32A(ALUSrc,readdata2,signeximm,operand2);

wire zero;
output [31:0] ALUresult;
ALU alu(ALUresult,zero,readdata1,operand2,aluoperation);

wire branchcontrol;
BranchUnit branchunit(Branch,BranchNot,zero,branchcontrol);

wire[31:0] addaluop1,addaluop2;
Shiftleft2_32bit shiftleft2_32(signeximm,addaluop2);

wire [31:0]PCplus4;
PC_ADD4 pc_add4(PCout,PCplus4);

wire [27:0]jumpaddr;
Shiftleft2_26bit shiftleft2_26(instruction[25:0],jumpaddr);

wire [31:0]b_addr;//branch addr
Add_ALU addalu(PCplus4,addaluop2,b_addr);

wire [31:0]branchornextaddr;
Mux32 mux32B(branchcontrol,PCplus4,b_addr,branchornextaddr);


Mux32 mux32C(Jump,branchornextaddr,{PCplus4[31:28],jumpaddr[27:0]},PCin);

wire [31:0] Readdata;
DataMemory dm(clk,ALUresult,readdata2,Readdata,MemWrite,MemRead);

Mux32 mux32D(MemtoReg,ALUresult,Readdata,writedata);

endmodule
`endif