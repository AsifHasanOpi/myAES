`timescale 1ns/100ps

module myAES_tb;

reg [127:0] in;
reg [127:0] key;
wire [127:0] out;

myAES a(in,key,out);


initial begin
$monitor("in= %h, key= %h,  out= %h ",in,key,out);
in=128'h_54776F204F6E65204E696E652054776F;
key=128'h_5468617473206D79204B756E67204675;
#10;


end

endmodule

