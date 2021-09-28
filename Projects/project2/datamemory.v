`ifndef DATAMEMORY
`define DATAMEMORY
`timescale 1ns / 1ps
module DataMemory(clk,Address,Writedata,Readdata,MemWrite,MemRead);
input MemWrite,MemRead,clk;
output reg [31:0]Readdata;
input [31:0]Address;
input [31:0]Writedata;
reg [31:0] storage [31:0];

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

always@(MemRead or MemWrite or Address or Writedata) begin
//always@(negedge clk) begin
    if(MemRead==1) Readdata=storage[Address/4];
    else if (MemWrite==1) storage[Address/4]=Writedata;
end

endmodule
`endif