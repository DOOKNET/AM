module FIR_Control(
	input	clk,
	input	rst_n,
	input	signed	[15:0]	s_axis_data_tdata,
	output	reg 	[7:0]	data_out
);

wire 	s_axis_data_tready;
wire	m_axis_data_tvalid;
wire 	[39:0]	m_axis_data_tdata;		//滤波器输出信号

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)	begin
		data_out <= 0;
	end
	else	begin
		data_out <= m_axis_data_tdata[33:26];
	end
end

//--------------调用FIR核----------------//
FIR						FIR_inst0(
  .aclk					(clk),
  .s_axis_data_tvalid	(1),					//拉高时IP核开始工作
  .s_axis_data_tready	(s_axis_data_tready),	
  .s_axis_data_tdata	(s_axis_data_tdata),	//输入信号
  .m_axis_data_tvalid	(m_axis_data_tvalid),	//拉高时表明数据输出有效
  .m_axis_data_tdata	(m_axis_data_tdata)		//输出信号
);
//---------------------------------------//


endmodule 
