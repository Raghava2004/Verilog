module ripple_carry_addr(input [3:0] A, input [3:0] B, input Cin , output [3:0]Sum, output Cout);
    wire [2:0] c;

    fulladdr a1(A[0],B[0],Cin, Sum[0],c[0]);
    fulladdr a2(A[1],B[1],c[0], Sum[1],c[1]);
    fulladdr a3(A[2],B[2],c[1], Sum[2],c[2]);
    fulladdr a4(A[3],B[3],c[2], Sum[3],Cout);
    
endmodule


module fulladdr(input A,input B, input Cin, output S, output Cou);

    assign S= A xor B xor Cin;
    assign Cou=(A and B) or (B and Cin) or (Cin and A);

endmodule