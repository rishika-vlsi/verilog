module cordic_stage #(
parameter WIDTH=16,
parameter SHIFT=0,
parameter signed [WIDTH-1:0] ANGLE=0
)(
input signed [WIDTH-1:0] xin,
input signed [WIDTH-1:0] yin,
input signed [WIDTH-1:0] zin,
output signed [WIDTH-1:0] xout,
output signed [WIDTH-1:0] yout,
output signed [WIDTH-1:0] zout
);
wire sign_z;
assign sign_z= zin[WIDTH-1];
assign xout = sign_z ? (xin + (yin>>>SHIFT)):(xin - (yin>>>SHIFT));
assign yout = sign_z ? (yin - (xin>>>SHIFT)):(yin + (xin>>>SHIFT));
assign zout = sign_z ? (zin + ANGLE):(zin - ANGLE);
endmodule


