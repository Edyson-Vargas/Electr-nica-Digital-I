module counter (clk, rst, ADD_C, Z_B);

input clk;
input rst;
input ADD_C;

output Z_B;

reg [4:0] count;

always @(posedge clk or posedge rst)
begin
    if(rst)
        count <= 0;

    else if(ADD_C)
        count <= count + 1;
end

assign Z_B = (count == 16);

endmodule