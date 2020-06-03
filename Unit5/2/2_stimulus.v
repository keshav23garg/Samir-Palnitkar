`timescale 1ns / 1ps
module stimulus;
	reg x , y;
	wire z;
	my_xor xor1 (z, x, y);
	
	initial begin 
		$dumpfile("output.vcd");
		$dumpvars(0,stimulus);
		x = 0;
		y = 0;
		#20 x = 1;
		#20 y = 1;
		#20 x = 0;	
		#20 ;
	end
	initial
		$monitor("time=%3d  input1=%d , input2=%d , xor=%d",$time,x,y,z);
endmodule