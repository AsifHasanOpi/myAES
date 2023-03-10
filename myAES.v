module myAES(

	input [127:0] in, key,
	output [127:0] out 
	);


wire [127:0] temp_data [0:9], temp_key [0:10];	

assign temp_data[0] = in ^ key; // round 0
assign temp_key[0] = key;
 	 
genvar i;

generate 
for(i=0; i<9; i=i+1) begin : ro
	rounds r(.in(temp_data[i]), .key(temp_key[i]), .rc(i), .out(temp_data[i+1]), .keyout(temp_key[i+1])); // round 1 - 9
	end
	
endgenerate	
 
finalround r1(.in(temp_data[9]), .key(temp_key[9]), .rc(9), .out(out), .keyout(temp_key[10])); // round 10
  
endmodule

