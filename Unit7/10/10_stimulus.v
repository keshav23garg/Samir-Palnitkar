`timescale 1ns/1ps
module stimulus;
	reg [3:0] in;
	wire out;
	reg [1:0] select;
	mux mux1(out,in,select);
	initial
		$monitor($time , " i0 = %d , i1 = %d , i2 , %d , i3 = %d , select = %d , out = %d" , in[0],in[1],in[2],in[3],select,out);
	initial begin
		in = 4'b0111;
		select = 0;
		#20 select = 2'b00;
		#20 select = 2'b01;
		#20 select = 2'b10;
		#20 select = 2'b11;
		#20 $finish;
	end
endmodule