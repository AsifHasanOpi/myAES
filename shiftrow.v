module shiftrow(
	input [0:127] in,
	output [0:127] out
);


	// First row is not shifted
	 assign out[0+:8]		= in[0+:8];
	 assign out[32+:8] 	= in[32+:8];
	 assign out[64+:8] 	= in[64+:8];
	 assign out[96+:8] 	= in[96+:8];
	 
	// Second row is cyclically left shifted by 1 offset
	assign out[8+:8] 		= in[40+:8];
	assign out[40+:8]		= in[72+:8];
	assign out[72+:8] 	= in[104+:8];
	assign out[104+:8] 	= in[8+:8];
	
	// Third row is cyclically left shifted by 2 offsets
	assign out[16+:8] 	= in[80+:8];
	assign out[48+:8] 	= in[112+:8];
	assign out[80+:8] 	= in[16+:8];
	assign out[112+:8] 	= in[48+:8];
	
	// Fourth row is cyclically left shifted by 3 offsets
	assign out[24+:8] 	= in[120+:8];
	assign out[56+:8] 	= in[24+:8];
	assign out[88+:8] 	= in[56+:8];
	assign out[120+:8] 	= in[88+:8];
	
endmodule


