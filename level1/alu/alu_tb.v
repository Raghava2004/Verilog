`timescale 1ns/1ns
`include "alu.v"

module alu_tb;

    reg [3:0] A, B;
    reg [2:0] Op;
    wire [3:0] Result;
    wire carr, zero;

    alu uut(A, B, Op, Result, carr, zero);

    initial begin
    $dumpfile("alu_tb.vcd");
    $dumpvars(0, alu_tb);
        // Test 1: Addition (A + B)
        A = 4'b0000; B = 4'b0000; Op = 3'b000; // 3 + 5
        #10;
        
        // Test 2: Subtraction (A - B)
        A = 4'b0110; B = 4'b0011; Op = 3'b001; // 6 - 3
        #10;

        // Test 3: AND Operation
        A = 4'b1101; B = 4'b1011; Op = 3'b010; // 1101 & 1011
        #10;

        // Test 4: OR Operation
        A = 4'b1101; B = 4'b1011; Op = 3'b011; // 1101 | 1011
        #10;

        // Test 5: XOR Operation
        A = 4'b1101; B = 4'b1011; Op = 3'b100; // 1101 ^ 1011
        #10;

        // Test 6: NOT Operation
        A = 4'b1101; B = 4'b0000; Op = 3'b101; // ~1101 (B doesn't matter, NOT A)
        #10;

        // Test 7: Left Shift (A << 1)
        A = 4'b1010; B = 4'bxxxx; Op = 3'b110; // 1010 << 1
        #10;

        // Test 8: Right Shift (A >> 1)
        A = 4'b1010; B = 4'bxxxx; Op = 3'b111; // 1010 >> 1
        #10;

        // Test 9: Zero result (A + B = 0)
        A = 4'b0000; B = 4'b0000; Op = 3'b000; // 0 + 0
        #10;

        // End simulation
        $finish;
    end

    // Monitor output during simulation
    initial begin
        $monitor("At time %t: A = %b, B = %b, Op = %b, Result = %b, carr = %b, zero = %b", $time, A, B, Op, Result, carr, zero);
    end

endmodule
