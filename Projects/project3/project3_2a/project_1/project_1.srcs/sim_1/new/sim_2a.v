`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/26 11:55:33
// Design Name: 
// Module Name: sim_2a
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


module sim_2a();
reg read_write;
reg [9:0]address;
reg [31:0]write_data;
wire [31:0]rd;
wire hit_miss;
integer count = 0;// here we use this to control the display
initial 
begin
	#0 read_write = 0; address = 10'b0000000000; //should miss
	#10 read_write = 1; address = 10'b0000000000; write_data = 32'b00000000000000000000000011111111;//write_data = 8'b11111111; //should hit
	#10 read_write = 0; address = 10'b0000000000; //should hit and read out 0xff
	
	//here check main memory content, 
	//the first byte should remain 0x00 if it is write-back, 
	//should change to 0xff if it is write-through.
	
	#10 read_write = 0; address = 10'b1000000000; //should miss
	#10 read_write = 0; address = 10'b0000000000; //should hit for 2-way associative, should miss for directly mapped
	
	#10 read_write = 0; address = 10'b1100000000; //should miss
	#10 read_write = 0; address = 10'b1000000000; //should miss both for directly mapped and for 2-way associative (Least-Recently-Used policy)
	
	//here check main memory content, 
	//the first byte should be 0xff
end
hierarchy_mem hm(read_write,address,write_data,rd,hit_miss);
    always #5 begin
//        $display("count=%d read_write = %b",count, read_write);
//        $display("count=%d ReadData = 0x%H",count, hm.cacheData);
        $display("count=%d MainMemory[0] = 0x%H",count,hm.mm.Mainmemory[0]);
        $display("count=%d dirty = 0x%H",count,hm.cache.dirty);
  //      $display("count=%d MainMemory[1] = 0x%H",count,hm.mm.Mainmemory[1]);
 //       $display("count=%d MainMemory[2] = 0x%H",count,hm.mm.Mainmemory[2]);
 //       $display("count=%d MainMemory[3] = 0x%H",count,hm.mm.Mainmemory[3]);
//        $display("count=%d wd_CM] = 0x%H",count,hm.cache.wd_CM);
//        $display("count=%d rw_CM] = 0x%H",count,hm.cache.rw_CM);
//        $display("count=%d addr_CM] = 0x%H",count,hm.cache.addr_CM);
      //  $display("count=%d MainMem WriteData = 0x%H",count,hm.mm.WriteData);
         //$display("count=%d MainMem Write Address = 0x%H",count,hm.mm.Address);
         //$display("count=%d MainMem ReadData = 0x%H",count,hm.cache.rd_CM[31:0]);
         
         // $display("count=%d MainMem ReadData = 0x%H",count,hm.mm.ReadData);
  //   $display("count=%d cachemem[0] = 0x%H",count,hm.cache.cachemem[0]);
     // $display("count=%d MainMem ReadData = 0x%H",count,hm.cache.addr_CC[5:2]);
  //    $display("count=%d MainMem ReadData = 0x%H",count,hm.mm.ReadData);
     //cachemem[addr_CC[5:4]*4]=rd_CM[31:0];
        $display("----------------------------------------------------------");
        count=count+1;
    end
endmodule
