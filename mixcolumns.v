module mixcolumns(
    input [127:0] in,
    output [127:0] out
);

function [7:0] mb2;
	input [7:0] x;
		begin 
		/* multiplication by 2 is shifting on bit to the left,
		and if the num a 1 @ MSB, xor the result with 0001 1011*/
		
		if(x[7] == 1) mb2 = ((x << 1) ^ 8'h1b);
		else mb2 = x << 1;
	end 	
endfunction

function [7:0] mb3;
	input [7:0] x;
	begin 
		/* multiplication by 3 = (NUM) XOR (NUM Muliplication by 2) */
		mb3 = mb2(x) ^ x;
	end 
endfunction
	
	
genvar i;

generate
	for(i=0;i<=3;i=i+1) begin : main_calculation

	 assign out[i*32+:8]  			= mb2(in[(i*32)+:8])	^ (in[(i*32 + 8)+:8])		^ (in[(i*32 + 16)+:8])		^ mb3(in[(i*32 + 24)+:8]);
	 assign out[(i*32 + 8)+:8] 	= mb3(in[(i*32)+:8])	^ mb2(in[(i*32 + 8)+:8])	^ (in[(i*32 + 16)+:8])		^ (in[(i*32 + 24)+:8]);
	 assign out[(i*32 + 16)+:8] 	= (in[(i*32)+:8])		^ mb3(in[(i*32 + 8)+:8])	^ mb2(in[(i*32 + 16)+:8])	^ (in[(i*32 + 24)+:8]);
	 assign out[(i*32 + 24)+:8] 	= (in[(i*32)+:8])		^ (in[(i*32 + 8)+:8])		^ mb3(in[(i*32 + 16)+:8])	^ mb2(in[(i*32 + 24)+:8]);
	end
endgenerate

endmodule
