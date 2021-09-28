//`include "combined.v"
module cache_2b_test();
    reg read_write;
    reg [9:0] address;
    reg [7:0] write_data;
    wire [7:0] read_data;
    wire hit;
    integer count = 0;// here we use this to control the display

    
    initial 
    begin
    #0  $dumpfile("testbench.vcd");
        $dumpvars(0, cache_2b_test);
    #100 $finish;
    end
    
    
    initial 
    begin
        #0 read_write = 0; address = 10'b0000000000; //should miss
        #10 read_write = 1; address = 10'b0000000000; write_data = 8'b11111111; //should hit
        #10 read_write = 0; address = 10'b0000000000; //should hit and read out 0xff
    //	
    //	//here check main memory content, 
    //	//the first byte should remain 0x00 if it is write-back, 
    //	//should change to 0xff if it is write-through.
    //	
        #10 read_write = 0; address = 10'b1000000000; //should miss
        #10 read_write = 0; address = 10'b0000000000; //should hit for 2-way associative, should miss for directly mapped
        
        #10 read_write = 0; address = 10'b1100000000; //should miss
        #10 read_write = 0; address = 10'b1000000000; //should miss both for directly mapped and for 2-way associative (Least-Recently-Used policy)
    //	//here check main memory content, 
    //	//the first byte should be 0xff
    end
    
    combined cache(read_data, hit, read_write, address, write_data);
    
    always #5 begin
            $display("count=%d read_write = %b",count, read_write);
            $display("count=%d ReadData = 0x%H",count, cache.cacheData);
            $display("count=%d MainMemory = 0x%H",count,cache.MainMemory.Mainmemory[0]);
            $display("----------------------------------------------------------");
            count=count+1;
        end
endmodule