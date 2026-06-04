module regB (clk, rst, LD, B_in, B_out);

input clk;
input rst;
input LD;
input [15:0] B_in;

output reg [15:0] B_out;

always @(posedge clk or posedge rst)
begin
    if(rst)
        B_out <= 0;

    else if(LD)
        B_out <= B_in;
end

endmodule