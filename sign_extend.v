module sign_extend(
    input [15:0] a,
    output [31:0] z
    );
assign z = {{15{a[15]}},a};

endmodule
