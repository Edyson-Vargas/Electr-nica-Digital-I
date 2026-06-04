`timescale 1ns/1ps
`define SIMULATION

module regA_TB;

reg clk;
reg rst;
reg LD;
reg SH;
reg SUB;

reg [15:0] A_in;
reg [15:0] SUB_RESULT;

wire [15:0] A_out;

regA utt(
    .clk(clk),
    .rst(rst),
    .LD(LD),
    .SH(SH),
    .SUB(SUB),
    .A_in(A_in),
    .SUB_RESULT(SUB_RESULT),
    .A_out(A_out)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    LD = 0;
    SH = 0;
    SUB = 0;

    A_in = 16'd20;
    SUB_RESULT = 16'd15;

    #10 rst = 0;

    LD = 1;
    #10 LD = 0;

    SUB = 1;
    #10 SUB = 0;

    SH = 1;
    #10 SH = 0;

    #20 $finish;

 end

initial begin: TEST_CASE
    $dumpfile("regA_TB.vcd");
    $dumpvars(0, utt);
    #(10000) $finish;
end

endmodule