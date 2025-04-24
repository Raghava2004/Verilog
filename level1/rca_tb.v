`include "ripple_carry_adder.v"
`timescale 1ns/1ns

module rca_tb;

    reg [3:0] A;
    reg [3:0] B;
    reg Cin;

    wire [3:0] Sum;
    wire Cout;

    ripple_carry_addr uut(
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin

        $dumpfile("rca.vcd");
        $dumpvars(0,rca_tb);

        A = 4'b0000; B = 4'b0000; Cin = 1'b0; #10;  // Test case 1
        A = 4'b0011; B = 4'b0101; Cin = 1'b0; #10;  // Test case 2
        A = 4'b1111; B = 4'b1111; Cin = 1'b0; #10;  // Test case 3
        A = 4'b1010; B = 4'b0101; Cin = 1'b1; #10;  // Test case 4
        A = 4'b1110; B = 4'b0001; Cin = 1'b1; #10;  // Test case 5
        A = 4'b1111; B = 4'b1111; Cin = 1'b1; #10;  // Test case 6

        // End simulation
        $finish;

    end

endmodule