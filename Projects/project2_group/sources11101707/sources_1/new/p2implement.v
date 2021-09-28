`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/10 12:51:18
// Design Name: 
// Module Name: p2implement
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


module p2implement(clk,manualclk,switch,Visreg,cathode,anode);
input [4:0] Visreg;
input switch;
output [6:0] cathode;
output [3:0] anode;
input manualclk;
input clk;
wire [31:0] VisData;
wire [31:0] PCout;
wire [3:0] ssdin,bufferin0,bufferin1,bufferin2,bufferin3;

wire [3:0] anodeinv;
wire sclk;
reg reset=1'b0;
project2pipeline P2PIP (manualclk,PCout,VisData,Visreg);
divider D1 (sclk,reset,clk);
//dividertwo D2 (ssclk,reset,sclk);
ringcount R (anodeinv,reset,sclk);
not(anode[3],anodeinv[3]);
not(anode[2],anodeinv[2]);
not(anode[1],anodeinv[1]);
not(anode[0],anodeinv[0]);
buffer B (ssdin,bufferin0,bufferin1,bufferin2,bufferin3,anodeinv);
mux24 MM0 (bufferin0,PCout[3:0],VisData[3:0],switch);
mux24 MM1 (bufferin1,PCout[7:4],VisData[7:4],switch);
mux24 MM2 (bufferin2,PCout[11:8],VisData[11:8],switch);
mux24 MM3 (bufferin3,PCout[15:12],VisData[15:12],switch);
ssd SSD (ssdin,cathode);
endmodule
