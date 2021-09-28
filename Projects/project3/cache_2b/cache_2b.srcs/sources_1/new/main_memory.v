`timescale 1ns / 1ps
module main_memory (
    input       write,
    input       [9:0]  FullAddress,
    input       [127:0]  WriteData,
    output      [127:0]  ReadData
);
    integer i;
    wire    [7:0]  Address;
    assign Address[7:2] = FullAddress[9:4];
    assign Address[1:0] = 2'b0;  // we need to get the effective address
    // initialize memory
    // the size of mainmemory is 256
    reg [31:0] Mainmemory [0:255];
    // set all memory to zero
    initial begin
        for (i = 0; i < 256; i = i + 1)
            Mainmemory[i] = 32'b0;
    end
    // use random numbers to generate the memory 
    //initial begin   
     //for (i = 0; i < 256; i = i + 1)
    //Mainmemory[i]={$random};  
     // end    
        assign ReadData = {Mainmemory[Address] , Mainmemory[Address+1] , Mainmemory[Address+2] , Mainmemory[Address+3]};                           
    always @* begin
    // when we have write, we can replace the original main memory data with new ones
       if (write == 1) begin
       Mainmemory[Address] = WriteData[127:96]; Mainmemory[Address+1] = WriteData[95:64];
       Mainmemory[Address+2] = WriteData[63:32];Mainmemory[Address+3] = WriteData[31:0];
       end
    end
endmodule
