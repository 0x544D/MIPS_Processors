module divideby3fsm(    input clk,
                        input reset,
                        output y);
                        
        reg[1:0] state, nextstate;
        
        parameter S0 = 2'b00;
        parameter S1 = 2'b01;
        parameter S2 = 2'b10;
        
        //state register
        always @ (posedge clk, posedge reset)
        if(reset)   state <= S0;
        else        state <= nextstate;
        
        // next state logic
        always @ (*)
        case(state)
            S0: nextstate = S1;
            S1: nextstate = S2;
            S2: nextstate = S0;
            default: nextstate = S0;
        endcase
        
        // output logic
        assign y = (state == S0);
endmodule