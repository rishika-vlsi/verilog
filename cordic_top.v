module cordic_top #(
parameter integer WIDTH =16
)(
input signed [WIDTH-1:0] angle_in,
output signed [WIDTH-1:0] cos_out,
output signed [WIDTH-1:0] sin_out
);
localparam signed [WIDTH-1:0] K = 16'sd9949;
localparam signed [WIDTH-1:0] A0=16'sd12868;
localparam signed [WIDTH-1:0] A1=16'sd7596;
localparam signed [WIDTH-1:0] A2=16'sd4014;
localparam signed [WIDTH-1:0] A3=16'sd2037;
localparam signed [WIDTH-1:0] A4=16'sd1023;
localparam signed [WIDTH-1:0] A5=16'sd512;
localparam signed [WIDTH-1:0] A6=16'sd256;
localparam signed [WIDTH-1:0] A7=16'sd128;
localparam signed [WIDTH-1:0] A8=16'sd64;
localparam signed [WIDTH-1:0] A9=16'sd32;
localparam signed [WIDTH-1:0] A10=16'sd16;
localparam signed [WIDTH-1:0] A11=16'sd8;
localparam signed [WIDTH-1:0] A12=16'sd4;
localparam signed [WIDTH-1:0] A13=16'sd2;
localparam signed [WIDTH-1:0] A14=16'sd1;
localparam signed [WIDTH-1:0] A15=16'sd1;
wire signed [WIDTH-1:0] x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16;
wire signed [WIDTH-1:0] y0, y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15, y16;
wire signed [WIDTH-1:0] z0, z1, z2, z3, z4, z5, z6, z7, z8, z9, z10, z11, z12, z13, z14, z15, z16;
assign x0=K;
assign y0=0;
assign z0=angle_in;
cordic_stage #(.WIDTH(WIDTH), .SHIFT(0), .ANGLE(A0)) s0 (.xin(x0), .yin(y0), .zin(z0), .xout(x1), .yout(y1), .zout(z1));
cordic_stage #(.WIDTH(WIDTH), .SHIFT(1), .ANGLE(A1)) s1 (.xin(x1), .yin(y1), .zin(z1), .xout(x2), .yout(y2), .zout(z2));
cordic_stage #(.WIDTH(WIDTH), .SHIFT(2), .ANGLE(A2)) s2 (.xin(x2), .yin(y2), .zin(z2), .xout(x3), .yout(y3), .zout(z3));
cordic_stage #(.WIDTH(WIDTH), .SHIFT(3), .ANGLE(A3)) s3 (.xin(x3), .yin(y3), .zin(z3), .xout(x4), .yout(y4), .zout(z4));
cordic_stage #(.WIDTH(WIDTH), .SHIFT(4), .ANGLE(A4)) s4 (.xin(x4), .yin(y4), .zin(z4), .xout(x5), .yout(y5), .zout(z5));
cordic_stage #(.WIDTH(WIDTH), .SHIFT(5), .ANGLE(A5)) s5 (.xin(x5), .yin(y5), .zin(z5), .xout(x6), .yout(y6), .zout(z6));
cordic_stage #(.WIDTH(WIDTH), .SHIFT(6), .ANGLE(A6)) s6 (.xin(x6), .yin(y6), .zin(z6), .xout(x7), .yout(y7), .zout(z7));
cordic_stage #(.WIDTH(WIDTH), .SHIFT(7), .ANGLE(A7)) s7 (.xin(x7), .yin(y7), .zin(z7), .xout(x8), .yout(y8), .zout(z8));
cordic_stage #(.WIDTH(WIDTH), .SHIFT(8), .ANGLE(A8)) s8 (.xin(x8), .yin(y8), .zin(z8), .xout(x9), .yout(y9), .zout(z9));
cordic_stage #(.WIDTH(WIDTH), .SHIFT(9), .ANGLE(A9)) s9 (.xin(x9), .yin(y9), .zin(z9), .xout(x10), .yout(y10), .zout(z10));
cordic_stage #(.WIDTH(WIDTH), .SHIFT(10), .ANGLE(A10)) s10 (.xin(x10), .yin(y10), .zin(z10), .xout(x11), .yout(y11), .zout(z11));
cordic_stage #(.WIDTH(WIDTH), .SHIFT(11), .ANGLE(A11)) s11 (.xin(x11), .yin(y11), .zin(z11), .xout(x12), .yout(y12), .zout(z12));
cordic_stage #(.WIDTH(WIDTH), .SHIFT(12), .ANGLE(A12)) s12 (.xin(x12), .yin(y12), .zin(z12), .xout(x13), .yout(y13), .zout(z13));
cordic_stage #(.WIDTH(WIDTH), .SHIFT(13), .ANGLE(A13)) s13 (.xin(x13), .yin(y13), .zin(z13), .xout(x14), .yout(y14), .zout(z14));
cordic_stage #(.WIDTH(WIDTH), .SHIFT(14), .ANGLE(A14)) s14 (.xin(x14), .yin(y14), .zin(z14), .xout(x15), .yout(y15), .zout(z15));
cordic_stage #(.WIDTH(WIDTH), .SHIFT(15), .ANGLE(A15)) s15 (.xin(x15), .yin(y15), .zin(z15), .xout(x16), .yout(y16), .zout(z16)); 
assign cos_out =x16;
assign sin_out=y16;
endmodule

