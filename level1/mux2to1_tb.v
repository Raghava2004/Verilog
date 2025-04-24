`include "mux2to1.v"
`timescale 1ns/1ns

module mux2to1_tb;
    reg [1:0]A;
    reg S;
    wire Y;

    mux2to1 uut(
        .A(A),
        .S(S),
        .Y(Y)
    );

    initial begin
        $dumpfile("mux2to1_tb.vcd");
        $dumpvars(0,mux2to1_tb);

        A=2'b00; S=0; #10;
        A=2'b01; S=0; #10;
        A=2'b10; S=0; #10;
        A=2'b11; S=0; #10;

        A=2'b00; S=1; #10;
        A=2'b01; S=1; #10;
        A=2'b10; S=1; #10;
        A=2'b11; S=1; #10;

    end 
endmodule