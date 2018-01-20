module modulate(
	input	clk,
	input	[7:0]	cos_100k,
	input	signed	[7:0]	cos_1M,
	output	signed	[15:0]	AM_mod
);

MULT		MULT_inst(		
  .CLK		(clk),
  .A		(cos_100k),
  .B		(cos_1M),
  .P		(AM_mod)
);

endmodule
