`ifndef BRANCHUNIT
`define BRANCHUNIT

module BranchUnit(Branch,BranchNot,zero,branchcontrol);
input Branch,BranchNot,zero;
output reg branchcontrol;
initial begin
    branchcontrol=0;
end

always@(Branch or BranchNot or zero) begin
    
    if(Branch==1) begin
        if(zero==1) branchcontrol=1;
        else branchcontrol=0;
    end
    else if (BranchNot==1) begin
        if(zero==0) branchcontrol=1;
        else branchcontrol=0;
    end
    else branchcontrol=0;

    if(Branch==1 && BranchNot==1) branchcontrol=0; //error

end
endmodule
`endif