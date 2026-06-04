module comp_sub (A, B, Z_A, SUB_RESULT);

input [15:0] A;
input [15:0] B;

output Z_A;
output [15:0] SUB_RESULT;

assign Z_A = (A >= B);

assign SUB_RESULT = A - B;

endmodule
