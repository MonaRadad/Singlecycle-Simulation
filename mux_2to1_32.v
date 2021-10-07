module mux_2to1_32(
    input [31:0] a,
    input [31:0] b,
	 input sel,
    output [31:0] z
    );
assign z = sel ? b:a;
endmodule
