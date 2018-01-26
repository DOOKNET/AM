`timescale 1ns/1ps

module tb_AM();

//===================解调部分====================//
//----------接口设置----------//
reg 	sclk;
reg		rst_n;
wire 	[7:0]	AM_demod;
//--------------------------//
initial		sclk = 1;
always	#5	sclk = ~sclk;		//100M时钟

initial	begin
	rst_n = 0;
	#500
	rst_n = 1;
end
//----------解调模块----------//
TOP				TOP_inst(
	.clk		(sclk),
	.rst_n		(rst_n),
	.AM_demod	(AM_demod)
);
//---------------------------//

//==============================================//

/*
//===================调制部分====================//
//---------接口设置----------//
reg 	sclk;
reg		rst_n;
wire 	signed	[15:0]	AM_mod;
//--------------------------//
initial		sclk = 1;
always	#5	sclk = ~sclk;		//100M时钟

initial	begin
	rst_n = 0;
	#500
	rst_n = 1;
end
//-----------调制模块----------//
modulate		modulate_inst0(
	.clk		(sclk),
	.rst_n		(rst_n),
	.AM_mod		(AM_mod)
);
//==============================================//
*/

endmodule
