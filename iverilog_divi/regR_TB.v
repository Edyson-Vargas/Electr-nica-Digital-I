`timescale 1ns/1ps
`define SIMULATION

module regR_TB;

reg clk;
reg rst;
reg LD;
reg SH;
reg BIT_IN;

wire [15:0] R;

regR utt(
    .clk(clk),
    .rst(rst),
    .LD(LD),
    .SH(SH),
    .BIT_IN(BIT_IN),
    .R(R)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;

    LD = 0;
    SH = 0;
    BIT_IN = 0;

    #10 rst = 0;

    LD = 1;
    #10 LD = 0;

    BIT_IN = 1;
    SH = 1;
    #10;

    BIT_IN = 0;
    #10;

    BIT_IN = 1;
    #10;

    SH = 0;

    #20 $finish;

end

    initial begin: TEST_CASE
        $dumpfile("regR_TB.vcd");
        $dumpvars(0, utt);
        #(10000) $finish;
    end

endmodule