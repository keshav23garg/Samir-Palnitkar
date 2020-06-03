`timescale 1ns / 1ps
module stimulus;
	reg x , y;
	wire a , b , c;
	my_and uut1 (a , x , y);
	my_or uut2 (b , x , y);
	my_not uut3 (c , x);
	
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
		$monitor("time=%3d  input1=%d , input2=%d , and=%d , or=%d , not=%d",$time,x,y,a,b,c);
endmodule