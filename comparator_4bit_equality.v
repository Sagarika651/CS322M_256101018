module comparator_4bit_equality (
    input [3:0] A,
    input [3:0] B,
    output equal
);
    assign equal = (A == B) ? 1'b1 : 1'b0;
endmodule
