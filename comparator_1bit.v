module comparator_1bit (
    input A,
    input B,
    output o1,  // A > B
    output o2,  // A == B
    output o3   // A < B
);
    assign o1 = A & ~B;
    assign o2 = ~(A ^ B);  // XOR = 0 => equal
    assign o3 = ~A & B;
endmodule
