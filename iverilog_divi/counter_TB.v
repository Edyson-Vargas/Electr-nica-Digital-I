`timescale 1ns/1ps
`define SIMULATION

module counter_TB;

reg clk;
reg rst;
reg ADD_C;

wire Z_B;

counter utt(
    .clk(clk),
    .rst(rst),
    .ADD_C(ADD_C),
    .Z_B(Z_B)
);

always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    ADD_C = 0;

    #10 rst = 0;

    ADD_C = 1;

    repeat(18)
        #10;

    ADD_C = 0;

    #20 $finish;

end

    initial begin: TEST_CASE
        $dumpfile("counter_TB.vcd");
        $dumpvars(0, utt);
        #(10000) $finish;
    end

endmodule