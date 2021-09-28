`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/07 16:27:57
// Design Name: 
// Module Name: tyc_part
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

//***************************************** ID/IF
//module Test_Bench;
//parameter half_period=0.001;

//reg clk;
//reg IF_ID_Write;
    
//reg IF_Flush;
//reg [31:0] IF_PCplusFour;
//reg [31:0] IF_Instruction;
//wire [31:0] ID_PCplusFour;
//wire [31:0] ID_Instruction;

//IFID testIFID(clk, IF_ID_Write, IF_Flush, IF_PCplusFour, IF_Instruction, ID_PCplusFour, ID_Instruction);
//initial begin
//    #0 clk=0;IF_Flush=0;IF_PCplusFour=8;IF_Instruction=1;IF_ID_Write=1;
//    #200 IF_PCplusFour=12;
//    #200 IF_PCplusFour=16;IF_ID_Write=0;IF_Instruction=2;
//    #400 IF_PCplusFour=20;IF_ID_Write=1;

//end
//always #half_period clk = ~clk;
//initial #1000 $stop;
//endmodule

//******************************************** equal


//module Test_Bench;
//parameter half_period=0.001;
//reg clk;
//wire EqualResult;
//reg [31:0]ReadData1,ReadData2;

//Equal equal_test(EqualResult,ReadData1, ReadData2);
//initial begin
//    #0 ReadData1=1;ReadData2=2;
//    #200 ReadData1=2;
//    #200 ReadData2=3;
//    #400 ReadData1=4;ReadData2=4;

//end
//always #half_period clk = ~clk;
//initial #1000 $stop;
//endmodule

//******************************* Forward
//module Test_Bench;
//parameter half_period=0.001;
//reg [4:0] IF_ID_RegisterRs;
//reg [4:0] IF_ID_RegisterRt;
//reg [4:0] ID_EX_RegisterRs;
//reg [4:0] ID_EX_RegisterRt;
//reg [4:0] EX_MEM_RegisterRd;
//reg [4:0] MEM_WB_RegisterRd;
//reg EX_MEM_RegWrite;
//reg MEM_WB_RegWrite;
//wire [1:0] ForwardA;
//wire [1:0] ForwardB;
//wire ForwardC;
//wire ForwardD;

//Forward_Unit Forward(
//    IF_ID_RegisterRs, IF_ID_RegisterRt, ID_EX_RegisterRs, ID_EX_RegisterRt, EX_MEM_RegisterRd, MEM_WB_RegisterRd,
//    EX_MEM_RegWrite, MEM_WB_RegWrite,
//    ForwardA, ForwardB,
//    ForwardC, ForwardD
//    );
//initial begin
//    #0 IF_ID_RegisterRs=1;EX_MEM_RegWrite=1;
//    #200 EX_MEM_RegisterRd=1;
//    #200 IF_ID_RegisterRs=0; EX_MEM_RegisterRd=10;
//    #200 MEM_WB_RegisterRd =3;ID_EX_RegisterRs=3;EX_MEM_RegWrite=0;
//    #200 MEM_WB_RegWrite=1;


//end

//initial #1000 $stop;
//endmodule

//**********************************PC
//module Test_Bench;
//parameter half_period=0.001;
//wire[31:0] PCout;
//reg[31:0] PCin;
//reg PCWrite;
//reg clk;

//PC pc(PCout,PCin,PCWrite,clk);
//initial begin
//    #0 clk=0;PCWrite=1;
//    #200 PCin=1;
//    #200 PCin=2;
//    #200 PCin=3;
//    #200 PCin=4;

//end
//always #half_period clk = ~clk;
//initial #1000 $stop;
//endmodule

//****************************************hazard
module Test_Bench;
parameter half_period=0.001;
reg [4:0] IF_ID_RegisterRs;
reg [4:0] IF_ID_RegisterRt;
reg [4:0] ID_EX_RegisterRt;
reg [4:0] ID_EX_RegisterRd;
reg [4:0] EX_MEM_RegisterRd;
reg ID_EX_MemRead;
reg EX_MEM_MemRead;
reg ID_EX_RegWrite;
reg IDbranch;
wire  PCWrite;
wire  IF_ID_Write;
wire stall;
wire  IF_Flush;

Hazard_Detection_Unit hazard(
    IF_ID_RegisterRs, IF_ID_RegisterRt, ID_EX_RegisterRt, ID_EX_RegisterRd, EX_MEM_RegisterRd,
    ID_EX_MemRead, EX_MEM_MemRead, ID_EX_RegWrite, IDbranch,
    PCWrite, IF_ID_Write, stall, IF_Flush
    );
initial begin
    #0 ID_EX_MemRead=1;ID_EX_RegisterRt=1;IF_ID_RegisterRs=1;
    #200 ID_EX_MemRead=0;
end

initial #400 $stop;
endmodule
