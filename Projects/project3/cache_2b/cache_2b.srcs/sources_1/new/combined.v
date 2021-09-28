`timescale 1ns / 1ps
`include "main_memory.v"
`include "cache2b.v"
module combined(
    output [7:0] cacheData,	// data read from cache
	output hit,			// 0 for miss, 1 for hit
	input write,		// write/read from CPU, 0 for read 1 for write
	input [9:0] address,	// address received from CPU
	input [7:0] CPUwrite	// data received from CPU
    );
    wire memwrite;
    wire [127:0] readMain;	// we need to read data from main memory if not hit
    wire [127:0] writeCacheData;	// data write to memory
    wire [9:0] memoryAddress;
    
    main_memory MainMemory(memWrite, memoryAddress, writeCacheData, readMain);
 // this part is designed to eliminate the delay
    cache2b combined_module(
        .cacheData(cacheData),		
	    .write(write),		// write/read from CPU, 0 for read 1 for write
	    .address(address),	// address received from CPU
	    .CPUwrite(CPUwrite),	// data received from CPU
        .writeCacheData(writeCacheData), // output data from the cache to the memory
        .readMain(readMain),  //  data read from the memory
        .detectHit(hit),// whether hit or not
        .memoryAddress(memoryAddress), // the output address to main memory
        .memWrite(memWrite) // to tell the CPU to write or not
    );

endmodule
