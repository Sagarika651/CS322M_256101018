module seq_detect_mealy(
    input clk, reset, x,
    output wire y
);
    reg [2:0] state;        // must be reg (storage element)
    wire [2:0] next_state;  // combinational output

    parameter S0=0, S1=1, S2=2, S3=3;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // Next-state logic
    assign next_state = (state == S0 && x)  ? S1 :
                        (state == S0 && ~x) ? S0 :
                        (state == S1 && x)  ? S2 :
                        (state == S1 && ~x) ? S0 :
                        (state == S2 && ~x) ? S3 :
                        (state == S2 && x)  ? S2 :
                        (state == S3 && x)  ? S1 :
                                              S0;

    // Output logic (Mealy → depends on state & input)
    assign y = (state == S3 && x) ? 1 : 0;

endmodule
