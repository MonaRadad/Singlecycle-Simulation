module mux_2to1_5(
    input [4:0] a,
    input [4:0] b,
	 input sel,
    output [4:0] z
    );
assign z = sel ? b:a;

endmodule
