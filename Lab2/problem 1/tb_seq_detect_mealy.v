`timescale 1ns/1ps
module tb_seq_detect_mealy;
    reg clk, reset, x;
    wire y;

    seq_detect_mealy dut(.clk(clk), .reset(reset), .x(x), .y(y));

    always #5 clk = ~clk;   // clock generation

    initial begin
        clk = 0; reset = 1; x = 0;
        #12 reset = 0;

        // Test input sequence: 11011011101
        @(posedge clk) x = 1;
        @(posedge clk) x = 1;
        @(posedge clk) x = 0;
        @(posedge clk) x = 1;
        @(posedge clk) x = 1;
        @(posedge clk) x = 0;
        @(posedge clk) x = 1;
        @(posedge clk) x = 1;
        @(posedge clk) x = 0;
        @(posedge clk) x = 1;

        #30 $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_seq_detect_mealy);
        $monitor("Time=%0t | x=%b | y=%b", $time, x, y);
    end
endmodule
