`timescale 1ns/1ps

module tb_AM();

//---------接口设置----------//
reg 	sclk;
reg		rst_n;
wire 	signed	[8:0]	cos_100k;
wire	signed	[7:0]	cos_1M;
//--------------------------//
initial		sclk = 1;
always	#5	sclk = ~sclk;

initial	begin
	rst_n = 0;
	#500
	rst_n = 1;
end
//--------------------------//
cos_make		cos_make_inst(
	.clk		(sclk),
	.rst_n		(rst_n),
	.cos_100k	(cos_100k),
	.cos_1M		(cos_1M)
);

endmodule


