module control_divi (clk, rst, init, Z_A, Z_B, LD, SH, SUB, ADD_C, done);
    
input clk;
input rst;
input init;
input Z_A;
input Z_B;

output reg LD;
output reg SH;
output reg SUB;
output reg ADD_C;
output reg done;

parameter START      = 3'b000;
parameter CHECK      = 3'b001;
parameter SUBTRACT   = 3'b010;
parameter SHIFT      = 3'b011;
parameter CHECK_END  = 3'b100;
parameter END_STATE  = 3'b101;

reg [2:0] state;
reg [2:0] next_state;

always @(posedge clk or posedge rst)
begin
  if(rst)
    state <= START;
  else
    state <= next_state;
end

always @(*)
begin
  next_state = state;

    case(state)

        START:
        begin
            if(init)
                next_state = CHECK;
        end

        CHECK:
        begin
            if(Z_A)
                next_state = SUBTRACT;
            else
                next_state = SHIFT;
            end

        SUBTRACT:
        begin
            next_state = SHIFT;
        end

        SHIFT:
        begin
            next_state = CHECK_END;
        end

        CHECK_END:
        begin
            if(Z_B)
                next_state = END_STATE;
            else
                next_state = CHECK;
        end

        END_STATE:
        begin
            if(!init)
                next_state = START;
        end

        default:
            next_state = START;

    endcase
end

always @(*)
begin

    LD    = 0;
    SH    = 0;
    SUB   = 0;
    ADD_C = 0;
    done  = 0;

    case(state)

        START:
        begin
            LD = 1;
        end

        CHECK:
        begin
        end

        SUBTRACT:
        begin
            SUB = 1;
        end

        SHIFT:
        begin
            SH    = 1;
            ADD_C = 1;
        end

        CHECK_END:
        begin
        end

        END_STATE:
        begin
            done = 1;
        end

    endcase
end

endmodule