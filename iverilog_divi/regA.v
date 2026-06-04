module regA (clk, rst, LD, SH, SUB, A_in, SUB_RESULT, A_out);

input clk;
input rst;
input LD;
input SH;
input SUB;
input [15:0] A_in;
input [15:0] SUB_RESULT;
output reg [15:0] A_out;

always @(posedge clk or posedge rst)
begin
    if(rst)
        A_out <= 0;

    else if(LD)
        A_out <= A_in;

    else if(SUB)
        A_out <= SUB_RESULT;

    else if(SH)
        A_out <= A_out << 1;
end

endmodule