`timescale 1ns / 1ps
module cache2a(rw_CC,addr_CC,wd_CC,rd_CC,hit_miss,rw_CM,addr_CM,wd_CM,rd_CM);
input rw_CC;//between CPU and 
input [9:0]addr_CC;
input [31:0]wd_CC;
output [31:0]rd_CC;
output hit_miss;
output rw_CM; //between Cache and Main mem
output [9:0]addr_CM;
output [127:0]wd_CM;
input [127:0]rd_CM;

//4 bit offs in addr, 2 bit index, 4 bit tag
//4 blocks in cache, 4 word in block
reg [31:0] cachemem [15:0];
reg [3:0] valid;
reg [3:0] dirty;
reg [3:0] tag[3:0];

integer i=0;

initial begin
    addr_CM=10'b0;
    wd_CM=128'b0;
    for (i=0;i<16;i++) begin
        cachemem[i] =32'b0;
    end
    valid=4'b0;
    dirty=4'b0;
    for(i=0;i<4;i++)begin
        tag[i]=4'b0;
    end
end

//always@(addr_CC or wd_CC or rw_CC) begin
always@* begin
    //index=addr_CC[5:4];
    if(tag[addr_CC[5:4]]==addr_CC[9:6] and valid[addr_CC[5:4]!=0]) begin //hit
        if(rw_CC) begin  //write
            hit_miss=1;
            cachemem[addr_CC[5:2]]=wd_CC;
            rd_CC=cachemem[addr_CC[5:2]];
            dirty=1;
        end

        else begin //read
            rd_CC=cachemem[addr_CC[5:2]];
            hit_miss=1;
        end
        
    end

    else begin //miss
        if(rw_CC) begin //write
            if(dirty[addr_CC[5:4]] begin //dirty
                rw_CM=1;
                addr_CM=addr_CC;
                wd_CM={cachemem[addr_CC[5:4]*4+3],cachemem[addr_CC[5:4]*4+2],cachemem[addr_CC[5:4]*4+1],cachemem[addr_CC[5:4]*4]};
                //write the whole block to main mem
                hit_miss=0;
                #10  
                cachemem[addr_CC[5:4]*4+3]=rd_CM[127:96];
                cachemem[addr_CC[5:4]*4+2]=rd_CM[95:64];
                cachemem[addr_CC[5:4]*4+1]=rd_CM[63:32];
                cachemem[addr_CC[5:4]*4]=rd_CM[31:0];
                cachemem[addr_CC[5:2]]=wd_CC;
                rd_CC=cachemem[addr_CC[5:2]];
                dirty[addr_CC[5:4]=0; //reset dirty
                valid[addr_CC[5:4]=1;
            end
            else begin//not dirty
                rw_CM=1;
                addr_CM=addr_CC;
                hit_miss=0;
                #10 cachemem[addr_CC[5:2]]=wd_CC;                
                rd_CC=cachemem[addr_CC[5:2]];
                dirty[addr_CC[5:4]=1;
                valid[addr_CC[5:4]=1;
            end
        end
        else begin //read
            if(dirty[addr_CC[5:4]] begin //dirty,need to write back first then send back new stuff to cachce
                rw_CM=1;//still need to write
                addr_CM=addr_CC;
                wd_CM={cachemem[addr_CC[5:4]*4+3],cachemem[addr_CC[5:4]*4+2],cachemem[addr_CC[5:4]*4+1],cachemem[addr_CC[5:4]*4]};
                hit_miss=0;
                #10
                cachemem[addr_CC[5:4]*4+3]=rd_CM[127:96];
                cachemem[addr_CC[5:4]*4+2]=rd_CM[95:64];
                cachemem[addr_CC[5:4]*4+1]=rd_CM[63:32];
                cachemem[addr_CC[5:4]*4]=rd_CM[31:0];
                rd_CC=cachemem[addr_CC[5:2]];
                dirty[addr_CC[5:4]=0; //reset dirty
                valid[addr_CC[5:4]=1;
            end
            else begin //not dirty
                rw_CM=0;//still need to write
                addr_CM=addr_CC;
                hit_miss=0;
                #10
                cachemem[addr_CC[5:4]*4+3]=rd_CM[127:96];
                cachemem[addr_CC[5:4]*4+2]=rd_CM[95:64];
                cachemem[addr_CC[5:4]*4+1]=rd_CM[63:32];
                cachemem[addr_CC[5:4]*4]=rd_CM[31:0];
                rd_CC=cachemem[addr_CC[5:2]];
                dirty[addr_CC[5:4]=0; //reset dirty
                valid[addr_CC[5:4]=1;
            end
        end
    end
end


//main mem always have to send back 

module main_memory (
    input       write,
    input       [9:0]  FullAddress,
    input       [127:0]  WriteData,
    output      [127:0]  ReadData
);
    integer i;
    wire    [7:0]  Address;
    assign Address[7:2] = FullAddress[9:4];
    assign Address[1:0] = 2'b0;  // block addr
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

module hierarchy_mem(rw,addr,wd,rd,hit_miss);
input rw;
input [9:0]addr;
input [31:0]wd;
output [32:0]rd
output hit_miss;

wire rw_CM;
wire [9:0]addr_CM;
wire [127:0]wd_CM;
wire [127:0]rd_CM;

cache2a cache(rw,addr,wd,rd,hit_miss,rw_CM,addr_CM,wd_CM,rd_CM);
main_memory mm(rw_CM,addr_CM,wd_CM,rd_CM);

endmodule