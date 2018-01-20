module TOP(
	input	clk,
	input	rst_n,
	output	signed	[15:0]	AM_mod
);

//-----------------------------------//
wire 	[7:0]	cos_100k;
wire	signed	[7:0]	cos_1M;
//-----------------------------------//

//-----------------------------------//
cos_make		cos_make_inst0(
	.clk		(clk),
	.rst_n		(rst_n),
	.cos_100k	(cos_100k),
	.cos_1M		(cos_1M)
);

//-----------------------------------//
modulate		modulate_indt1(
	.clk		(clk),
	.cos_100k	(cos_100k),
	.cos_1M		(cos_1M),
	.AM_mod		(AM_mod)
);


endmodule