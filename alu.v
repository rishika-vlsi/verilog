module alu (
input [7:0] a,
input [7:0] b,
input [2:0] sel,
output reg [7:0] result,
output reg carry
);
always @(*) begin
carry=0;

case(sel)
3'b000: {carry, result}= a+b;
3'b001: {carry, result}= a-b;
3'b010: result = a & b;
3'b011: result= a | b;
3'b100: result= a^b;
3'b101: result= ~a;
default: result = 8'b00000000;
endcase
end
endmodule

