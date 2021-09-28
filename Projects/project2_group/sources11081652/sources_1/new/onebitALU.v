`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/29 00:47:32
// Design Name: 
// Module Name: onebitALU
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

module onebitALU(result,carryout,set,overflow,a,b,ainvert,binvert,less,carryin,operation);
input a,b,ainvert,binvert,less,carryin;
input [1:0] operation;
output result,carryout,set,overflow;
wire ainv,binv,amuxout,bmuxout,andmux0,ormux1;
wire medium1,medium2;
wire cininv,coutinv;
not(ainv,a);
not(binv,b);
mux2 MA2 (amuxout,a,ainv,ainvert);
mux2 MB2 (bmuxout,b,binv,binvert);
add ADD (set,carryout,amuxout,bmuxout,carryin);
mux4 M4 (result,andmux0,ormux1,set,less,operation);


and(andmux0,amuxout,bmuxout);
or(ormux1,amuxout,bmuxout);

not(cininv,carryin);
not(coutinv,carryout);

and(medium1,cininv,carryout);
and(medium2,carryin,coutinv);
or(overflow,medium1,medium2);


endmodule


