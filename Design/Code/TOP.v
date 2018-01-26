module TOP(
	input	clk,
	input	rst_n,
	output	[7:0]	AM_demod
);

//--------------------------------//
reg 	signed	[15:0]	data_tdata;
wire 	signed	[15:0]	AM_mod;
//--------------------------------//

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)	begin
		data_tdata <= 0;
	end
	else if(AM_mod[15] == 1)	begin
		data_tdata <= -{AM_mod};		//如果符号位是1，对数据取反
	end
	else if(AM_mod[15] == 0)	begin
		data_tdata <= AM_mod;			//如果符号位是0，数据不变
	end
	else	begin
		data_tdata <= data_tdata;
	end
end

//--------------------------------//
modulate		modulate_inst0(
	.clk		(clk),
	.rst_n		(rst_n),
	.AM_mod		(AM_mod)
);
//--------------------------------//

//--------------------------------//
FIR_Control				FIR_Control_inst2(
	.clk				(clk),
	.rst_n				(rst_n),
	.s_axis_data_tdata	(data_tdata),
	.data_out			(AM_demod)
);
//--------------------------------//

endmodule
