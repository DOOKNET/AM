module modulate(
	input		clk,
	input		rst_n,
	output	signed	[15:0]	AM_mod
);

wire 	[7:0]	cos_s;
wire	signed	[7:0]	cos_c;

//------------调用出波模块------------//
cos_make		cos_make_inst0(
	.clk			(clk),
	.rst_n		(rst_n),
	.cos_s		(cos_s),
	.cos_c		(cos_c)
);
//-----------------------------------//

//------------调用乘法器--------------//
MULT		MULT_inst1(		
  .CLK	(clk),
  .A		(cos_s),
  .B		(cos_c),
  .P		(AM_mod)
);

endmodule
