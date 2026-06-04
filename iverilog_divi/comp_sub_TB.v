`timescale 1ns/1ps
`define SIMULATION

module comp_sub_TB;

reg [15:0] A;
reg [15:0] B;

wire Z_A;
wire [15:0] SUB_RESULT;

comp_sub utt(
    .A(A),
    .B(B),
    .Z_A(Z_A),
    .SUB_RESULT(SUB_RESULT)
);

initial begin

    A = 16'd20;
    B = 16'd4;

    #10;

    A = 16'd3;
    B = 16'd7;

    #10;

    A = 16'd100;
    B = 16'd50;

    #10;

    $finish;

end

    initial begin: TEST_CASE
        $dumpfile("comp_sub_TB.vcd");
        $dumpvars(0, utt);
        #(10000) $finish;
    end

endmodule