module tb_comparator_4bit_equality;
    reg [3:0] A, B;
    wire equal;

    comparator_4bit_equality uut (.A(A), .B(B), .equal(equal));

    initial begin
        $display("   A    B  | Equal");
        A = 4'b0000; B = 4'b0000; #10 $display("%b %b |   %b", A, B, equal);
        A = 4'b1010; B = 4'b1010; #10 $display("%b %b |   %b", A, B, equal);
        A = 4'b1100; B = 4'b0011; #10 $display("%b %b |   %b", A, B, equal);
        A = 4'b1111; B = 4'b1110; #10 $display("%b %b |   %b", A, B, equal);
        $finish;
    end
endmodule
