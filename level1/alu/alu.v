module alu(A,B,Op,Result,carr,zero);

    input [3:0] A,B;
    input [2:0] Op;
    output [3:0] Result;
    output carr,zero;
    reg [4:0] temp_result;
    wire [3:0] Result;
    wire carr,zero;

assign Result= temp_result[3:0];
assign carr=temp_result[4];
assign zero = (Result==4'd0);

always @(*) begin
    case(Op)
        3'b000 : temp_result=A+B;
        3'b001 : temp_result=A-B;
        3'b010 : temp_result={1'b0,A&B};        
        3'b011 : temp_result={1'b0,A|B};
        3'b100 : temp_result={1'b0,A^B};
        3'b101 : temp_result={1'b0,~A};
        3'b110 : temp_result={ A ,1'b0};
        3'b111 : temp_result={1'b0,A[3:1]};
        default : temp_result=5'b0;
    endcase
end



endmodule