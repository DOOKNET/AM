module cos_make(
	input	clk,
	input	rst_n,
	output	reg	[7:0]	cos_100k,
	output	reg	signed	[7:0]	cos_1M
);

//------------------------------------//
parameter freq_s = 32'd429497;		//调制信号频率
parameter freq_c = 32'd42949673;		//载波频率
parameter cnt_width = 8'd32;
//------------------------------------//

//------------------------------------//
reg 	[cnt_width-1:0]	cnt_s = 0;
reg		[cnt_width-1:0]	cnt_c = 0;
wire 	[9:0]	addr_s;
wire	[9:0]	addr_c;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)	begin
		cnt_s <= 0;
		cnt_c <= 0;
	end
	else	begin
		cnt_s <= cnt_s + freq_s;
		cnt_c <= cnt_c + freq_c;
	end
end

assign	addr_s = cnt_s[cnt_width-1:cnt_width-10];
assign	addr_c = cnt_c[cnt_width-1:cnt_width-10];
//------------------------------------//

//------------调用ROM核----------------//
wire 	signed	[7:0]	cos_100k_r;
wire 	signed	[7:0]	cos_1M_r;

ROM			ROM_inst(
	.clka	(clk),
	.addra	(addr_s),
	.douta	(cos_100k_r),
	.clkb	(clk),
	.addrb	(addr_c),
	.doutb	(cos_1M_r)
);

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)	begin
		cos_100k <= 0;
		cos_1M <= 0;
	end
	else	begin
		cos_100k <= cos_100k_r + 8 'd128;
		cos_1M <= cos_1M_r;
	end
end

endmodule
