module rounds(
    input [127:0] in, key,
	 input [3:0] rc,
    output [127:0] out, keyout
);


wire [127:0] afterSubBytes;
wire [127:0] afterShiftRows;
wire [127:0] afterMixColumns;


keygen k(rc, key, keyout);
subbytes s(in,afterSubBytes);
shiftrow r(afterSubBytes,afterShiftRows);
mixcolumns m(afterShiftRows,afterMixColumns);

assign out = afterMixColumns ^  keyout;
		
endmodule


module finalround(
    input [127:0] in, key,
	 input [3:0] rc,
    output [127:0] out, keyout
);


wire [127:0] afterSubBytes;
wire [127:0] afterShiftRows;


keygen k1(rc, key, keyout);
subbytes s2(in,afterSubBytes);
shiftrow r2(afterSubBytes,afterShiftRows);

assign out = afterShiftRows ^ keyout;
		
endmodule


