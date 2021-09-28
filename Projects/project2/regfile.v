`ifndef REGFILE
`define REGFILE

module Regfile(clk, readreg1, readreg2, writereg, writedata, readdata1, readdata2,regwrite);
input clk,regwrite;
input[4:0]readreg1,readreg2,writereg;
input[31:0] writedata;
output reg[31:0] readdata1,readdata2;
reg [31:0] regs[0:31];

//read is neg, write is pos??

//always@(posedge clk) begin
//    readdata1<=regs[readreg1];
//    readdata2<=regs[readreg2];
//end

integer i;
initial begin
    for (i = 0; i < 32; i = i + 1)
        regs[i] = 32'b0;
end

always@(*)begin
 readdata1=regs[readreg1];
readdata2=regs[readreg2];

end
always@(negedge clk) begin
    if(regwrite) begin
        regs[writereg]<=writedata;
    end
end

always @ (posedge clk or negedge clk) begin
    $display("[$s0] = %h, [$s1] = %h, [$s2] = %h", regs[16], regs[17], regs[18]);
    $display("[$s3] = %h, [$s4] = %h, [$s5] = %h", regs[19], regs[20], regs[21]);
    $display("[$s6] = %h, [$s7] = %h, [$t0] = %h", regs[22], regs[23], regs[8]);
    $display("[$t1] = %h, [$t2] = %h, [$t3] = %h", regs[9], regs[10], regs[11]);
    $display("[$t4] = %h, [$t5] = %h, [$t6] = %h", regs[12], regs[13], regs[14]);
    $display("[$t7] = %h, [$t8] = %h, [$t9] = %h", regs[15], regs[24], regs[25]);
    //$display("[$zero]=%h",regs[0]);
end

endmodule
`endif