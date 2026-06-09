module divi (clk, rst, init, A, B, done, R);

input clk;
input rst;
input init;
input [15:0] A;
input [15:0] B;

output [15:0] R;
output done;

wire LD;
wire SH;
wire SUB;
wire ADD_C;
wire Z_A;
wire Z_B;
wire [15:0] A_reg;
wire [15:0] B_reg;
wire [15:0] SUB_RESULT;
regA RA(.clk(clk), .rst(rst), .LD(LD), .SH(SH), .SUB(SUB), .A_in(A), 
  .SUB_RESULT(SUB_RESULT), .A_out(A_reg));
regB RB(.clk(clk), .rst(rst), .LD(LD), .B_in(B), .B_out(B_reg));
comp_sub CS(.A(A_reg), .B(B_reg),.Z_A(Z_A), .SUB_RESULT(SUB_RESULT));
regR RR(.clk(clk), .rst(rst), .LD(LD), .SH(SH), .BIT_IN(Z_A), .R(R));
counter CNT(.clk(clk), .rst(rst), .ADD_C(ADD_C), .Z_B(Z_B));

control_divi CTRL(.clk(clk), .rst(rst), .init(init), .Z_A(Z_A), .Z_B(Z_B), .LD(LD), .SH(SH),
  .SUB(SUB), .ADD_C(ADD_C), .done(done));

endmodule
