`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/29 17:31:45
// Design Name: 
// Module Name: registers
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

/*
//Old Reg: Read & Write not separated
module registers(Readdata1,Readdata2,Readreg1,Readreg2,Writereg,Writedata,RegWrite,clock);
output [31:0] Readdata1;
output [31:0] Readdata2;
input RegWrite,clock;
input [4:0] Readreg1;
input [4:0] Readreg2;
input [4:0] Writereg;
input [31:0] Writedata;
reg [31:0] storage [0:31];
reg [31:0] Readdata1;
reg [31:0] Readdata2;
//initialize storage
initial begin
storage[0]=32'b0;
storage[1]=32'b0;
storage[2]=32'b0;
storage[3]=32'b0;
storage[4]=32'b0;
storage[5]=32'b0;
storage[6]=32'b0;
storage[7]=32'b0;
storage[8]=32'b0;
storage[9]=32'b0;
storage[10]=32'b0;
storage[11]=32'b0;
storage[12]=32'b0;
storage[13]=32'b0;
storage[14]=32'b0;
storage[15]=32'b0;
storage[16]=32'b0;
storage[17]=32'b0;
storage[18]=32'b0;
storage[19]=32'b0;
storage[20]=32'b0;
storage[21]=32'b0;
storage[22]=32'b0;
storage[23]=32'b0;
storage[24]=32'b0;
storage[25]=32'b0;
storage[26]=32'b0;
storage[27]=32'b0;
storage[28]=32'b0;
storage[29]=32'b0;
storage[30]=32'b0;
storage[31]=32'b0;
end
always @ (RegWrite or Readreg1 or Readreg2 or Writereg or Writedata)
begin
    Readdata1=storage[Readreg1];
    Readdata2=storage[Readreg2];
    if (RegWrite==1) storage[Writereg]=Writedata;
end
always @(negedge clock) begin
    $display("[$s0] = %h, [$s1] = %h, [$s2] = %h", storage[16], storage[17], storage[18]);
    $display("[$s3] = %h, [$s4] = %h, [$s5] = %h", storage[19], storage[20], storage[21]);
    $display("[$s6] = %h, [$s7] = %h, [$t0] = %h", storage[22], storage[23], storage[8]);
    $display("[$t1] = %h, [$t2] = %h, [$t3] = %h", storage[9], storage[10], storage[11]);
    $display("[$t4] = %h, [$t5] = %h, [$t6] = %h", storage[12], storage[13], storage[14]);
    $display("[$t7] = %h, [$t8] = %h, [$t9] = %h", storage[15], storage[24], storage[25]);

end
endmodule
*/
module registers(Readdata1,Readdata2,Readreg1,Readreg2,Writereg,Writedata,RegWrite,clk,VisData,Visreg);
output [31:0] Readdata1;
output [31:0] Readdata2;
input RegWrite,clk;
input [4:0] Readreg1;
input [4:0] Readreg2;

input [4:0] Visreg;
output [31:0] VisData;

input [4:0] Writereg;
input [31:0] Writedata;
reg [31:0] storage [0:31];
reg [31:0] Readdata1=32'b0;
reg [31:0] Readdata2=32'b0;
reg [31:0] VisData;
//initialize storage
initial begin
storage[0]=32'b0;
storage[1]=32'b0;
storage[2]=32'b0;
storage[3]=32'b0;
storage[4]=32'b0;
storage[5]=32'b0;
storage[6]=32'b0;
storage[7]=32'b0;
storage[8]=32'b0;
storage[9]=32'b0;
storage[10]=32'b0;
storage[11]=32'b0;
storage[12]=32'b0;
storage[13]=32'b0;
storage[14]=32'b0;
storage[15]=32'b0;
storage[16]=32'b0;
storage[17]=32'b0;
storage[18]=32'b0;
storage[19]=32'b0;
storage[20]=32'b0;
storage[21]=32'b0;
storage[22]=32'b0;
storage[23]=32'b0;
storage[24]=32'b0;
storage[25]=32'b0;
storage[26]=32'b0;
storage[27]=32'b0;
storage[28]=32'b0;
storage[29]=32'b0;
storage[30]=32'b0;
storage[31]=32'b0;
end
// Notes: changed to "write first and then read"!!!
always @ (*) begin
    Readdata1=storage[Readreg1];
    Readdata2=storage[Readreg2];
    VisData=storage[Visreg];
end 
always @ (posedge clk or negedge clk) begin
    $display("[$s0] = %h, [$s1] = %h, [$s2] = %h", storage[16], storage[17], storage[18]);
    $display("[$s3] = %h, [$s4] = %h, [$s5] = %h", storage[19], storage[20], storage[21]);
    $display("[$s6] = %h, [$s7] = %h, [$t0] = %h", storage[22], storage[23], storage[8]);
    $display("[$t1] = %h, [$t2] = %h, [$t3] = %h", storage[9], storage[10], storage[11]);
    $display("[$t4] = %h, [$t5] = %h, [$t6] = %h", storage[12], storage[13], storage[14]);
    $display("[$t7] = %h, [$t8] = %h, [$t9] = %h", storage[15], storage[24], storage[25]);
    //$display("[$zero]=%h",storage[0]);
end

always @ (negedge clk) begin
    if (RegWrite==1) storage[Writereg]<=Writedata;
end

endmodule