`timescale 1ns / 1ps
`include "mux4to1.v"


module mux4to1_tb;

    // Testbench signals
    reg [3:0] A;    // 4-bit input
    reg [1:0] S;    // 2-bit select
    wire Y;         // Output

    // Instantiate the Unit Under Test (UUT)
    mux4to1 uut (
        .A(A),
        .S(S),
        .Y(Y)
    );

    // Test all combinations
    initial begin
        $dumpfile("mux4to1.vcd");
        $dumpvars(0,mux4to1_tb);

        
        $display("Time\tA\tS\tY");
        $monitor("%0dns\t%b\t%b\t%b", $time, A, S, Y);

        // Apply test cases
        A = 4'b0000; S = 2'b00; #10;
        A = 4'b0001; S = 2'b01; #10;
        A = 4'b0010; S = 2'b10; #10;
        A = 4'b0011; S = 2'b11; #10;
        
        A = 4'b1100; S = 2'b00; #10;
        A = 4'b1010; S = 2'b01; #10;
        A = 4'b0101; S = 2'b10; #10;
        A = 4'b1111; S = 2'b11; #10;

        $finish;  // End simulation
    end

endmodule
