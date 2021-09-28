`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/05 10:24:37
// Design Name: 
// Module Name: project2pipeline
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//Testing Log
/*
11.7 23:59
[31:0] NonJumpTarget
IDJump
[31:0] PCin
[31:0] IDinstr
*/
/*
11.8 0:30
[1:0] ForwardA;
[1:0] ForwardB;
ForwardC,ForwardD
[31:0] EXALUResult;
[31:0] ALUinA;
[31:0] ALUinB;

*/
module project2pipeline(PCout, clk, NonJumpTarget, IDJump, PCin,IDinstr, ForwardA, ForwardB,ForwardC,ForwardD,EXALUResult,ALUinA,ALUinB);
input clk;
output [31:0] PCout; 

output [31:0] PCin;
output [31:0] NonJumpTarget;
wire [31:0] JumpTarget;
output IDJump;
mux232 MUXA (PCin,NonJumpTarget,JumpTarget,IDJump);

wire PCWrite;
PC PCA (PCout,PCin,PCWrite,clk);

wire [31:0] IFPCplusFour;
reg [31:0] constFour=32'b0100;
Adder ADDA (IFPCplusFour,PCout,constFour);

wire [31:0] IFinstr;
instructionMem IMA (IFinstr,PCout);

wire IF_IDWrite;
wire IDFlush;
wire [31:0] IDPCplusFour;
output [31:0] IDinstr;
IFID IFIDREG (clk, IF_IDWrite, IDFlush, IFPCplusFour, IFinstr, IDPCplusFour, IDinstr);
//ID STAGE
wire [31:0] JumpTarget;
shiftLeft26 SL26 (JumpTarget[27:0],IDinstr[25:0]);

assign JumpTarget[31:28]=IDPCplusFour[31:28];

wire [1:0] IDALUOp;
wire IDRegDst,Branch,IDMemRead,IDMemtoReg,IDMemWrite,IDALUSrc,IDRegWrite,BranchNot;
Control CONTROL (IDALUOp,IDRegDst,IDJump,Branch,IDMemRead,IDMemtoReg,IDMemWrite,IDALUSrc,IDRegWrite,BranchNot,IDinstr[31:26]);

wire [1:0] IDALUOp2;
wire IDRegDst2,IDMemRead2,IDMemtoReg2,IDMemWrite2,IDALUSrc2,IDRegWrite2;
wire stall;
muxControl MUXB (IDALUOp2,IDRegDst2,IDALUSrc2,IDMemRead2,IDMemWrite2,IDRegWrite2,IDMemtoReg2,IDALUOp,IDRegDst,IDALUSrc,IDMemRead,IDMemWrite,IDRegWrite,IDMemtoReg,stall);

wire WBRegWrite;
wire [4:0] WBWriteAddr;
wire [31:0] WBWriteData;
wire [31:0] RFOut1;
wire [31:0] RFOut2;
registers REGFILE (RFOut1,RFOut2,IDinstr[25:21],IDinstr[20:16],WBWriteAddr,WBWriteData,WBRegWrite,clk);

output ForwardC;
output ForwardD;
wire [31:0] MEMALUResult;

wire [31:0] IDReadData1;
mux232 MUXC (IDReadData1,RFOut1,MEMALUResult,ForwardC);

wire [31:0] IDReadData2;
mux232 MUXD (IDReadData2,RFOut2,MEMALUResult,ForwardD);

wire EqualRes;
Equal EQUAL (EqualRes,IDReadData1,IDReadData2);

//GATES FOR BEQ AND BNE
wire NotEqualRes;
wire BeqSig,BneSig;
wire BranchOrNot;
not(NotEqualRes,EqualRes);
and(BeqSig,Branch,EqualRes);
and(BneSig,BranchNot,NotEqualRes);
or(BranchOrNot,BeqSig,BneSig);

wire [31:0] IDExtendedImm;
signExtend SEXD (IDExtendedImm,IDinstr[15:0]);

wire [31:0] ShiftedImm;
shiftLeft16 SL16 (ShiftedImm,IDExtendedImm);

wire [31:0] BranchTarget;
Adder ADDB (BranchTarget,IDPCplusFour,ShiftedImm);

mux232 MUXF (NonJumpTarget,IFPCplusFour,BranchTarget,BranchOrNot);

wire EXMemRead,EXRegDst, EXMemWrite, EXMemtoReg, EXRegWrite,EXALUSrc;
wire [1:0] EXALUOp;
wire [4:0] EXRs, EXRt, EXRd;
wire [31:0] EXExtendedImm;
wire [31:0] EXReadData1;
wire [31:0] EXReadData2;
IDEX IDEXREG (clk, IDMemRead2, IDRegDst2, IDMemWrite2, IDMemtoReg2, IDRegWrite2, IDReadData1, IDReadData2, IDExtendedImm, IDinstr[25:21], IDinstr[20:16], IDinstr[15:11], IDALUOp2, IDALUSrc2, 
          EXMemRead, EXRegDst, EXMemWrite, EXMemtoReg, EXRegWrite, EXReadData1, EXReadData2, EXExtendedImm, EXRs, EXRt, EXRd, EXALUOp, EXALUSrc);


//EX STAGE
reg [31:0] constZero=32'b0;

output [31:0] ALUinA;
output [1:0] ForwardA;
mux432 MUXG (ALUinA,EXReadData1,WBWriteData,MEMALUResult,constZero,ForwardA);

wire [31:0] MuxHOut;
output [1:0] ForwardB;
mux432 MUXH (MuxHOut,EXReadData2,WBWriteData,MEMALUResult,constZero,ForwardB);

output [31:0] ALUinB;
mux232 MUXJ (ALUinB,MuxHOut,EXExtendedImm,EXALUSrc);

wire [4:0] EXDst;
mux25 MUXI (EXDst,EXRt,EXRd,EXRegDst);

wire [3:0] operation;
ALUControl ALUCONTROL (operation,EXALUOp,EXExtendedImm[5:0]); 

output [31:0] EXALUResult;
wire overflow,zero;//Not used
ALU ALUA (EXALUResult,overflow,zero,ALUinA,ALUinB,operation[3],operation[2],operation[1:0]);

reg EX_Flush=1'b0; //EX_Flush const zero
wire MEMMemRead;
wire MEMMemWrite;
wire MEMMemtoReg;
wire MEMRegWrite;
wire [4:0] MEMDst;
wire [31:0] MEMMuxHOut;
EXMEM EXMEMREG (clk, EX_Flush, EXMemRead, EXMemWrite, EXMemtoReg, EXRegWrite, EXDst, EXALUResult, MuxHOut, 
                             MEMMemRead, MEMMemWrite, MEMMemtoReg, MEMRegWrite, MEMDst, MEMALUResult, MEMMuxHOut);

//MEM STAGE
wire [31:0] MEMReadData;
dataMemory DATAMEM (MEMReadData,MEMALUResult,MEMMuxHOut,MEMMemWrite,MEMMemRead,clk);

wire [31:0] WBReadData;
wire [31:0] WBALUResult;
wire WBMemtoReg;
MEMWB MEMWBREG (clk, MEMMemtoReg, MEMRegWrite, MEMDst, MEMReadData, MEMALUResult, WBMemtoReg, WBRegWrite, WBWriteAddr, WBReadData, WBALUResult);

//WB STAGE
mux232 MUXK (WBWriteData,WBALUResult,WBReadData,WBMemtoReg);

Hazard_Detection_Unit HDU (
    IDinstr[25:21], IDinstr[20:16], EXRt,EXRd, MEMDst,
    EXMemRead, MEMMemRead, EXRegWrite, Branch,
    PCWrite, IF_IDWrite, stall, IDFlush
    );

Forward_Unit FU (
    IDinstr[25:21], IDinstr[20:16], EXRs, EXRt, MEMDst, WBWriteAddr,
    MEMRegWrite, WBRegWrite,
    ForwardA, ForwardB,
    ForwardC, ForwardD
    );
endmodule
