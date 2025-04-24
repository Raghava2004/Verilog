module mux2to1(input [1:0] A, input S, output Y);
    assign Y= (~S & A[0]) | (S & A[1]) ;
endmodule