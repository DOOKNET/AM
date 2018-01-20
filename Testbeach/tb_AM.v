`timescale 1ns/1ps

module tb_AM();

//---------接口设置----------//
reg 	sclk;
reg		rst_n;
wire 	signed	[15:0]	AM_mod;
//--------------------------//
initial		sclk = 1;
always	#5	sclk = ~sclk;

initial	begin
	rst_n = 0;
	#500
	rst_n = 1;
end
//--------------------------//
TOP				TOP_inst(
	.clk		(sclk),
	.rst_n		(rst_n),
	.AM_mod		(AM_mod)
);

endmodule
