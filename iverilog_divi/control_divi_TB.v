`timescale 1ns/1ps
`define SIMULATION

module control_divi_TB;

reg clk;
reg rst;
reg init;
reg Z_A;
reg Z_B;

wire LD;
wire SH;
wire SUB;
wire ADD_C;
wire done;

control_divi utt(
    .clk(clk),
    .rst(rst),
    .init(init),
    .Z_A(Z_A),
    .Z_B(Z_B),
    .LD(LD),
    .SH(SH),
    .SUB(SUB),
    .ADD_C(ADD_C),
    .done(done)
);

parameter PERIOD = 20;

always #(PERIOD/2) clk = ~clk;

initial
begin
    clk  = 0;
    rst  = 1;
    init = 0;
    Z_A   = 0;
    Z_B   = 0;

    #30;
    rst = 0;

@(posedge clk);
init = 1;

@(posedge clk);
Z_A = 1;

@(posedge clk);

@(posedge clk);

Z_B = 0;

@(posedge clk);

Z_A = 0;

@(posedge clk);

@(posedge clk);

Z_B = 1;

@(posedge clk);

@(posedge clk);

init = 0;

@(posedge clk);

#50;
$finish;
end

 initial begin: TEST_CASE
 $dumpfile("control_divi_TB.vcd");
 $dumpvars(0, utt);
 #10000 $finish;
 end

endmodule