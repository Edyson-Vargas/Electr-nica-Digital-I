`timescale 1ns/1ps
`define SIMULATION

module regB_TB;

reg clk;
reg rst;
reg LD;

reg [15:0] B_in;

wire [15:0] B_out;

regB utt (
    .clk(clk),
    .rst(rst),
    .LD(LD),
    .B_in(B_in),
    .B_out(B_out)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    LD = 0;

    B_in = 16'd4;

    #10 rst = 0;

    LD = 1;
    #10 LD = 0;

    #20 $finish;

end

initial begin: TEST_CASE
    $dumpfile("regB_TB.vcd");
    $dumpvars(0, utt);
    #(10000) $finish;
end

endmodule
