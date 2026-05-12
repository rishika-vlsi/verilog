`timescale 1ns/1ps
module cordic_test;
localparam WIDTH =16;
localparam real SCALE=16384.0;
reg signed [WIDTH-1:0] angle_in;
wire signed [WIDTH-1:0] cos_out;
wire signed [WIDTH-1:0] sin_out;
cordic_top #(.WIDTH(WIDTH)) dut(
.angle_in(angle_in),
.cos_out(cos_out),
.sin_out(sin_out)
);
function signed [WIDTH-1:0] to_fixed;
input real r;
begin
to_fixed =$rtoi(r*SCALE);
end
endfunction
function real from_fixed;
 input signed [WIDTH-1:0] v;
begin
from_fixed =$itor(v)/SCALE;
end
endfunction
task show_result;
begin
$display("Angle(rad) =%f | cos= %f | sin= %f", from_fixed(angle_in), from_fixed(cos_out), from_fixed(sin_out));
end
endtask
initial begin
$dumpfile("cordic.vcd");
$dumpvars(0, cordic_test);
$display("PARALLEL CORDIC TESTBENCH");
$display("RAW cos=%0d RAW sin-%0d", cos_out, sin_out);
angle_in= to_fixed(0.0);
#1 show_result();
angle_in= to_fixed(0.5235987756);
#1 show_result();
angle_in= to_fixed(0.7853981634);
#1 show_result();
angle_in= to_fixed(1.0471975512);
#1 show_result();
angle_in= to_fixed(1.5707963268);
#1 show_result();
$finish;
end
endmodule




