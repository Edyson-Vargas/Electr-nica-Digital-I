module regR (clk, rst, LD, SH, BIT_IN, R);

input clk;
input rst;
input LD;
input SH;
input BIT_IN;

output reg [15:0] R;

always @(posedge clk or posedge rst)
begin
    if(rst)
        R <= 0;

    else if(LD)
        R <= 0;

    else if(SH)
        R <= {R[14:0], BIT_IN};
end

endmodule