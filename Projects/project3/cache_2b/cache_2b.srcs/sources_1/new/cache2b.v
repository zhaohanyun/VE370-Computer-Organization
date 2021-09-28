`timescale 1ns / 1ps
module cache2b(
    // this part is to accomplish write back in 2-way associative mode
    output reg  [7:0]   cacheData,	// we read the data from the cache   
	input               write,		// read: 0 write: 1
	input       [9:0]   address,	// address get from CPU
	input       [7:0]   CPUwrite,	// Data going to write in the cache
    output reg  [9:0]   memoryAddress,  // the output address to main memory
    output reg          memWrite,     // to tell the CPU to write or read  
    output reg  [127:0] writeCacheData, // output of cache of 4 words going to write into the main memory
    input       [127:0] readMain,  // data read from the memory
    output reg          detectHit      // hit or miss, hit for 1
    );

// here we initialized the cache with all zero
// altogether 270 bits:  
// first block: 267 valid bit, 266-262 5_bit tag, 261-134 128_bit data
// second block: 133 valid bit, 132-128 5_bit tag, 127-0 128_bit data
// two dirty bits. 269 for first block, 268 for the second block
    reg block;
    reg LRUblock[1:0];  //which block is LRU
    reg [269:0] cache [1:0];  //one set
	initial begin
		cache[0] = 270'b0;cache[1] = 270'b0;
		block = 1'b0; memoryAddress = 10'b0;
		LRUblock[1] = 1'b0;
		LRUblock[0] = 1'b0;
        memWrite = 1'b0;
	end
    wire hit; wire [3:0] byte_addr;		// the address to select the address

 assign byte_addr = address[3:0];
    assign hit = ((cache[0][267] == 1'b1 && cache[0][266:262] == address[9:5] ) || (cache[1][267] == 1'b1 && cache[1][266:262] == address[9:5]) || (cache[0][133] == 1'b1 && cache[0][132:128] == address[9:5])|| (cache[1][133] == 1'b1 && cache[1][132:128] == address[9:5]))? 1:0;

    always@(address or write or CPUwrite) begin
        
        detectHit = ((cache[0][267] == 1'b1 && cache[0][266:262] == address[9:5] ) || (cache[1][267] == 1'b1 && cache[1][266:262] == address[9:5]) || (cache[0][133] == 1'b1 && cache[0][132:128] == address[9:5])|| (cache[1][133] == 1'b1 && cache[1][132:128] == address[9:5]))? 1:0;

    end
    always@(*) begin
          begin
                memoryAddress = address;
                if(write == 1'b0) begin //if we have read instruction 
                    memWrite = 1'b0;
                    if(hit == 1'b1) begin //if hit return data to CPU
                        if (address[4] == 0) block = 0;else block = 1; // which set does it cover
                        if (cache[block][132:128] == address[9:5]) LRUblock[block] = 1'b1; else LRUblock[block] = 1'b0; // which is LRU block in the corresponding set
                        if (LRUblock[block] == 1'b1) begin
                            case (byte_addr)
					        0: cacheData <= cache[block][127:120]; 1: cacheData <= cache[block][119:112];
					        2: cacheData <= cache[block][111:104];3: cacheData <= cache[block][103:96];
					        4: cacheData <= cache[block][95:88];5: cacheData <= cache[block][87:80];
					        6: cacheData <= cache[block][79:72];7: cacheData <= cache[block][71:64];
					        8: cacheData <= cache[block][63:56];9: cacheData <= cache[block][55:48];
					        10: cacheData <= cache[block][47:40];11: cacheData <= cache[block][39:32];
					        12: cacheData <= cache[block][31:24];13: cacheData <= cache[block][23:16];
					        14: cacheData <= cache[block][15:8];15: cacheData <= cache[block][7:0];
					        default: ;
				            endcase
				        end
				        else begin
				            case (byte_addr)
					        0: cacheData <= cache[block][261:254]; 1: cacheData <= cache[block][253:246];
					        2: cacheData <= cache[block][245:238];3: cacheData <= cache[block][237:230];
					        4: cacheData <= cache[block][229:222];5: cacheData <= cache[block][221:214];
					        6: cacheData <= cache[block][213:206];7: cacheData <= cache[block][205:198];
					        8: cacheData <= cache[block][197:190];9: cacheData <= cache[block][189:182];
					        10: cacheData <= cache[block][181:174];11: cacheData <= cache[block][173:166];
					        12: cacheData <= cache[block][165:158];13: cacheData <= cache[block][157:150];
					        14: cacheData <= cache[block][149:142];15: cacheData <= cache[block][141:134];
					        default: ;
					        endcase
				        end
                    end
                    else begin //if not hit or some unknown instructions
                        if (address[4] == 0) block = 0;else block = 1; // use to judge the set

                        #0.1;
                       
                       if (LRUblock[block] == 1'b0) begin
                       if (cache[block][268]==1'b1) begin 
                            #0.1;
                            memWrite = 1'b1;
                            memoryAddress [9:5] = cache[block][132:128];
                            memoryAddress [4] = block;
                            memoryAddress [3:0] = 4'b0;
                            writeCacheData<= cache[block][127:0]; // if dirty, write back to the main memory
                            cache[block][268] = 1'b0;
                       #0.1;
                            memWrite = 1'b0;
                            memoryAddress = address;
                       end
                       #0.1;
                        cache[block][127:0] = readMain; // get new block of data
                        #0.1
                        case (byte_addr)
					        0: cacheData = cache[block][127:120];1: cacheData = cache[block][119:112];
					        2: cacheData = cache[block][111:104];3: cacheData = cache[block][103:96];
					        4: cacheData = cache[block][95:88];5: cacheData = cache[block][87:80];
					        6: cacheData = cache[block][79:72];7: cacheData = cache[block][71:64];
					        8: cacheData = cache[block][63:56];9: cacheData = cache[block][55:48];
					        10: cacheData = cache[block][47:40];11: cacheData = cache[block][39:32];
					        12: cacheData = cache[block][31:24];13: cacheData = cache[block][23:16];
					        14: cacheData = cache[block][15:8];15: cacheData = cache[block][7:0]; 
					        default: ;
				        endcase
                        cache[block][133] <= 1'b1;   // set valid = 1
                        cache[block][132:128]<=address[9:5]; // change tag to the target address
                        cache[block][268] <= 1'b0;  // not dirty
                        LRUblock[block] <= 1'b1;    //set new LRU block
                        end
                        else begin
                        if (cache[block][269]==1'b1) begin 
                            #0.1;
                            memWrite = 1'b1;
                            memoryAddress [9:5] = cache[block][266:262];
                            memoryAddress [4] = block;
                            memoryAddress [3:0] = 4'b0;
                            writeCacheData<= cache[block][261:134]; // if dirty, write back to the main memory
                            cache[block][269] = 1'b0;
                       #0.1;
                            memWrite = 1'b0;
                            memoryAddress = address;
                       end

                        #0.1;                       
                        cache[block][261:134] = readMain; // get new block of data
                        #0.1
                        case (byte_addr)
					        0: cacheData = cache[block][261:254]; 1: cacheData = cache[block][253:246];
					        2: cacheData = cache[block][245:238];3: cacheData = cache[block][237:230];
					        4: cacheData = cache[block][229:222];5: cacheData = cache[block][221:214];
					        6: cacheData = cache[block][213:206];7: cacheData = cache[block][205:198];
					        8: cacheData = cache[block][197:190];9: cacheData = cache[block][189:182];
					        10: cacheData = cache[block][181:174];11: cacheData = cache[block][173:166];
					        12: cacheData = cache[block][165:158];13: cacheData = cache[block][157:150];
					        14: cacheData = cache[block][149:142];15: cacheData = cache[block][141:134]; 
					        default: ;
				        endcase
                        cache[block][267] <= 1'b1;   // set valid = 1
                        cache[block][266:262]<=address[9:5]; // change tag to the target address
                        LRUblock[block] <= 1'b0;// set new LRU block
                        cache[block][269] <= 1'b0;  // not dirty
                        end
                    end
                end
                else if (write == 1'b1) begin // if we have write instruction
                    cacheData <= 8'b0;
                    memWrite = 1'b0;
                    if(hit == 1'b1) begin // if hit write to cache
                        if (address[4] == 0) block = 0; else block = 1;// which set
                        
                        if (cache[block][132:128] == address[9:5]) LRUblock[block] = 1'b1; else LRUblock[block] = 1'b0;// which is the least recently used block
                        if (LRUblock[block] == 1'b1) begin 
                        case (byte_addr) // here we write the CPU data to the cache
					        0: cache[block][127:120] <= CPUwrite;1: cache[block][119:112] <= CPUwrite;
					        2: cache[block][111:104] <= CPUwrite;3: cache[block][103:96] <= CPUwrite;
					        4: cache[block][95:88] <= CPUwrite;5: cache[block][87:80] <= CPUwrite;
					        6: cache[block][79:72] <= CPUwrite;7: cache[block][71:64] <= CPUwrite;
					        8: cache[block][63:56] <= CPUwrite;9: cache[block][55:48] <= CPUwrite;
					        10: cache[block][47:40] <= CPUwrite;11: cache[block][39:32] <= CPUwrite;
					        12: cache[block][31:24] <= CPUwrite;13: cache[block][23:16] <= CPUwrite;
					        14: cache[block][15:8] <= CPUwrite;15: cache[block][7:0] <= CPUwrite;
					        default: ;
				        endcase
				        cache[block][268]<=1'b1; //dirty
				        //cache[block][133]<=1'b1; //valid
				        end 
				        else begin
				        case (byte_addr)
					        0: cache[block][261:254] <= CPUwrite; 1: cache[block][253:246] <= CPUwrite;
					        2: cache[block][245:238] <= CPUwrite;3: cache[block][237:230] <= CPUwrite;
					        4: cache[block][229:222] <= CPUwrite;5: cache[block][221:214] <= CPUwrite;
					        6: cache[block][213:206] <= CPUwrite;7: cache[block][205:198] <= CPUwrite;
					        8: cache[block][197:190] <= CPUwrite;9: cache[block][189:182] <= CPUwrite;
					        10: cache[block][181:174] <= CPUwrite;11: cache[block][173:166] <= CPUwrite;
					        12: cache[block][165:158] <= CPUwrite;13: cache[block][157:150] <= CPUwrite;
					        14: cache[block][149:142] <= CPUwrite;15: cache[block][141:134] <= CPUwrite; 
					        default: ;
				        endcase
				        cache[block][269]<=1'b1; //dirty
				        //cache[block][267]<=1'b1; //valid
				        end
                                                                                            
                    end
                    else begin	// if no hit or other instructions
                        if (address[4] == 0) block = 0; else block = 1;// which set                                    
                        #0.1;
                        if (LRUblock[block] == 1'b0) begin                        
                        if (cache[block][268]==1'b1) begin 
                            #0.1;
                            memWrite = 1'b1;
                            memoryAddress [9:5] = cache[block][132:128];
                            memoryAddress [4] = block;
                            memoryAddress [3:0] = 4'b0;
                            writeCacheData<= cache[block][127:0]; // if dirty, write back to the main memory
                            cache[block][268] = 1'b0;
                       #0.1;
                            memWrite = 1'b0;
                            memoryAddress = address;
                       end
                        #0.1;
                            cache[block][127:0] = readMain; // load from main memory to cache
                        #0.1
                        cache[block][133] = 1'b1;    // set valid = 1
                        cache[block][132:128] = address[9:5]; // change tag size to target address
                        cache[block][268]<=1'b1;//dirty
                        // write data
                        case (byte_addr)
					        0: cache[block][127:120] = CPUwrite;1: cache[block][119:112] = CPUwrite;
					        2: cache[block][111:104] = CPUwrite;3: cache[block][103:96] = CPUwrite;
					   		4: cache[block][95:88] = CPUwrite;5: cache[block][87:80] = CPUwrite;
					        6: cache[block][79:72] = CPUwrite;7: cache[block][71:64] = CPUwrite;
					        8: cache[block][63:56] = CPUwrite;9: cache[block][55:48] = CPUwrite;
					        10: cache[block][47:40] = CPUwrite;11: cache[block][39:32] = CPUwrite;		        
					        12: cache[block][31:24] = CPUwrite;13: cache[block][23:16] = CPUwrite;
					        14: cache[block][15:8] = CPUwrite;15: cache[block][7:0] = CPUwrite;
					        default: ;
				        endcase
                        #0.1
                           memWrite = 1'b1;
                           memoryAddress [9:4] = address[9:4];
                           memoryAddress [3:0] = 4'b0;
//                           writeCacheData = cache[block][127:0]; // load the whole block into memory
                        end
				        else begin
				        if (cache[block][269]==1'b1) begin 
                            #0.1;
                            memWrite = 1'b1;
                            memoryAddress [9:5] = cache[block][266:262];
                            memoryAddress [4] = block;
                            memoryAddress [3:0] = 4'b0;
                            writeCacheData<= cache[block][261:134]; // if dirty, write back to the main memory
                            cache[block][269] = 1'b0;
                       #0.1;
                            memWrite = 1'b0;
                            memoryAddress = address;
                       end				        				        				       
                        #0.1;
				        cache[block][261:134] = readMain; // load from main memory to cache
                        #0.1
                        cache[block][267] = 1'b1;    // set valid = 1
                        cache[block][266:262] = address[9:5]; // change tag size to target address
                        cache[block][269] = 1'b1; //dirty
                        // write data
				        case (byte_addr)
					        0: cache[block][261:254] <= CPUwrite; 1: cache[block][253:246] <= CPUwrite;
					        2: cache[block][245:238] <= CPUwrite;3: cache[block][237:230] <= CPUwrite;
					        4: cache[block][229:222] <= CPUwrite;5: cache[block][221:214] <= CPUwrite;
					        6: cache[block][213:206] <= CPUwrite;7: cache[block][205:198] <= CPUwrite;
					        8: cache[block][197:190] <= CPUwrite;9: cache[block][189:182] <= CPUwrite;
					        10: cache[block][181:174] <= CPUwrite;11: cache[block][173:166] <= CPUwrite;
					        12: cache[block][165:158] <= CPUwrite;13: cache[block][157:150] <= CPUwrite;
					        14: cache[block][149:142] <= CPUwrite;15: cache[block][141:134] <= CPUwrite; 
					        default: ;
				        endcase

                        #0.1
                           memWrite = 1'b1;
                           memoryAddress [9:4] = address[9:4];
                           memoryAddress [3:0] = 4'b0;
  //                         writeCacheData = cache[block][266:262]; // load the whole block into memory 
				        end                                                                                 
                        #0.1
                           memWrite = 1'b0;
                           memoryAddress = address;                           
                end
            end
        end
    end
    

endmodule
