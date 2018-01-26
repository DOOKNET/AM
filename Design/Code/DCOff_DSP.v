module DCOff_DSP(
	input 	clk,
	input 	rst,
	input 	[7:0] din,
	output 	[7:0] dc
);

wire signed [15:0] PRODUCT;

wire signed [7:0] K;

//wire signed [31:0] ACOUT;

assign K=16'h0085;

ADDMACC_MACRO #(
	.DEVICE("7SERIES"), // Target Device: "VIRTEX6", "SPARTAN6", "7SERIES"
	.LATENCY(4), // Desired clock cycle latency, 0-4
	.WIDTH_PREADD(8), // Pre-adder input width, 1-25
	.WIDTH_MULTIPLIER(8), // Multiplier input width, 1-18
	.WIDTH_PRODUCT(16) // MACC output width, 1-48
) ADDMACC_MACRO_inst (
	.PRODUCT(PRODUCT), // MACC result output, width defined by WIDTH_PRODUCT parameter
	.CARRYIN(1'b0), // 1-bit carry-in input
	.CLK(clk), // 1-bit clock input
	.CE(1'b1), // 1-bit clock enable input
	.LOAD(1'b1), // 1-bit accumulator load input
	.LOAD_DATA(PRODUCT), // Accumulator load data input, width defined by WIDTH_PRODUCT parameter
	.MULTIPLIER(K), // Multiplier data input, width defined by WIDTH_MULTIPLIER parameter
	.PREADD2(-PRODUCT[15:8]), // Preadder data input, width defined by WIDTH_PREADD parameter
	.PREADD1(din), // Preadder data input, width defined by WIDTH_PREADD parameter
	.RST(rst) // 1-bit active high synchronous reset
);

assign dc=PRODUCT[15:8];

endmodule