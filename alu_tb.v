`timescale 1ns/1ps
module alu_tb;
reg[7:0] a,b;
reg[2:0] sel;
wire[7:0] result;
wire carry;

alu uut (
.a(a),
.b(b),
.sel(sel),
.result(result),
.carry(carry)
);
initial begin
$dumpfile("dump.vcd");
$dumpvars(0, alu_tb);
a= 8'd10;
b= 8'd5;
sel= 3'b000; #10;
sel= 3'b001; #10;
sel= 3'b010; #10;
sel= 3'b011; #10;
sel= 3'b100; #10;
sel= 3'b101; #10;
$finish;
end
endmodule

