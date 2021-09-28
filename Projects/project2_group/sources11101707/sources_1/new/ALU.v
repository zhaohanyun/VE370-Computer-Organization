`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/29 00:52:49
// Design Name: 
// Module Name: ALU
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


module ALU(result,overflow,zero,a,b,ainvert,bnegate,operation);
input [31:0] a;
input [31:0] b;
input ainvert,bnegate;
input [1:0] operation;
output overflow,zero;
output [31:0] result;
wire [31:0] carryconnection;
wire [31:0] setconnection;
wire [31:0] overflowconnection;
wire invzero;

reg constLess=1'b0;
onebitALU A0 (result[0],carryconnection[0],setconnection[0],overflowconnection[0],a[0],b[0],ainvert,bnegate,setconnection[31],bnegate,operation);
onebitALU A1 (result[1],carryconnection[1],setconnection[1],overflowconnection[1],a[1],b[1],ainvert,bnegate,constLess,carryconnection[0],operation);
onebitALU A2 (result[2],carryconnection[2],setconnection[2],overflowconnection[2],a[2],b[2],ainvert,bnegate,constLess,carryconnection[1],operation);
onebitALU A3 (result[3],carryconnection[3],setconnection[3],overflowconnection[3],a[3],b[3],ainvert,bnegate,constLess,carryconnection[2],operation);
onebitALU A4 (result[4],carryconnection[4],setconnection[4],overflowconnection[4],a[4],b[4],ainvert,bnegate,constLess,carryconnection[3],operation);
onebitALU A5 (result[5],carryconnection[5],setconnection[5],overflowconnection[5],a[5],b[5],ainvert,bnegate,constLess,carryconnection[4],operation);
onebitALU A6 (result[6],carryconnection[6],setconnection[6],overflowconnection[6],a[6],b[6],ainvert,bnegate,constLess,carryconnection[5],operation);
onebitALU A7 (result[7],carryconnection[7],setconnection[7],overflowconnection[7],a[7],b[7],ainvert,bnegate,constLess,carryconnection[6],operation);
onebitALU A8 (result[8],carryconnection[8],setconnection[8],overflowconnection[8],a[8],b[8],ainvert,bnegate,constLess,carryconnection[7],operation);
onebitALU A9 (result[9],carryconnection[9],setconnection[9],overflowconnection[9],a[9],b[9],ainvert,bnegate,constLess,carryconnection[8],operation);
onebitALU A10 (result[10],carryconnection[10],setconnection[10],overflowconnection[10],a[10],b[10],ainvert,bnegate,constLess,carryconnection[9],operation);
onebitALU A11 (result[11],carryconnection[11],setconnection[11],overflowconnection[11],a[11],b[11],ainvert,bnegate,constLess,carryconnection[10],operation);
onebitALU A12 (result[12],carryconnection[12],setconnection[12],overflowconnection[12],a[12],b[12],ainvert,bnegate,constLess,carryconnection[11],operation);
onebitALU A13 (result[13],carryconnection[13],setconnection[13],overflowconnection[13],a[13],b[13],ainvert,bnegate,constLess,carryconnection[12],operation);
onebitALU A14 (result[14],carryconnection[14],setconnection[14],overflowconnection[14],a[14],b[14],ainvert,bnegate,constLess,carryconnection[13],operation);
onebitALU A15 (result[15],carryconnection[15],setconnection[15],overflowconnection[15],a[15],b[15],ainvert,bnegate,constLess,carryconnection[14],operation);
onebitALU A16 (result[16],carryconnection[16],setconnection[16],overflowconnection[16],a[16],b[16],ainvert,bnegate,constLess,carryconnection[15],operation);
onebitALU A17 (result[17],carryconnection[17],setconnection[17],overflowconnection[17],a[17],b[17],ainvert,bnegate,constLess,carryconnection[16],operation);
onebitALU A18 (result[18],carryconnection[18],setconnection[18],overflowconnection[18],a[18],b[18],ainvert,bnegate,constLess,carryconnection[17],operation);
onebitALU A19 (result[19],carryconnection[19],setconnection[19],overflowconnection[19],a[19],b[19],ainvert,bnegate,constLess,carryconnection[18],operation);
onebitALU A20 (result[20],carryconnection[20],setconnection[20],overflowconnection[20],a[20],b[20],ainvert,bnegate,constLess,carryconnection[19],operation);
onebitALU A21 (result[21],carryconnection[21],setconnection[21],overflowconnection[21],a[21],b[21],ainvert,bnegate,constLess,carryconnection[20],operation);
onebitALU A22 (result[22],carryconnection[22],setconnection[22],overflowconnection[22],a[22],b[22],ainvert,bnegate,constLess,carryconnection[21],operation);
onebitALU A23 (result[23],carryconnection[23],setconnection[23],overflowconnection[23],a[23],b[23],ainvert,bnegate,constLess,carryconnection[22],operation);
onebitALU A24 (result[24],carryconnection[24],setconnection[24],overflowconnection[24],a[24],b[24],ainvert,bnegate,constLess,carryconnection[23],operation);
onebitALU A25 (result[25],carryconnection[25],setconnection[25],overflowconnection[25],a[25],b[25],ainvert,bnegate,constLess,carryconnection[24],operation);
onebitALU A26 (result[26],carryconnection[26],setconnection[26],overflowconnection[26],a[26],b[26],ainvert,bnegate,constLess,carryconnection[25],operation);
onebitALU A27 (result[27],carryconnection[27],setconnection[27],overflowconnection[27],a[27],b[27],ainvert,bnegate,constLess,carryconnection[26],operation);
onebitALU A28 (result[28],carryconnection[28],setconnection[28],overflowconnection[28],a[28],b[28],ainvert,bnegate,constLess,carryconnection[27],operation);
onebitALU A29 (result[29],carryconnection[29],setconnection[29],overflowconnection[29],a[29],b[29],ainvert,bnegate,constLess,carryconnection[28],operation);
onebitALU A30 (result[30],carryconnection[30],setconnection[30],overflowconnection[30],a[30],b[30],ainvert,bnegate,constLess,carryconnection[29],operation);
onebitALU A31 (result[31],carryconnection[31],setconnection[31],overflow,a[31],b[31],ainvert,bnegate,constLess,carryconnection[30],operation);

or(invzero,result[0],result[1],result[2],result[3],result[4],result[5],result[6],result[7],result[8],result[9],
result[10],result[11],result[12],result[13],result[14],result[15],result[16],result[17],result[18],result[19],
result[20],result[21],result[22],result[23],result[24],result[25],result[26],result[27],result[28],result[29],
result[30],result[31]);
not(zero,invzero);

endmodule

