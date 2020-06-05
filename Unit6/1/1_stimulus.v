`timescale 1ns / 1ps
module stimulus;
	reg x,y,z;
	wire b,d;
	binary_sub sub1(d,b,x,y,z);
	initial begin
		$dumpfile("output.vcd");
		$dumpvars(0,stimulus);
		x=0;
		y=0;
		z=0;
		#20 z = 1;
		#20 z = 0;
		y = 1;
		#20 z = 1;
		#20 x = 1;
		y = 0;
		z = 0;
		#20 z = 1;
		#20 z = 0;
		y = 1;
		#20 z = 1;
		#20 $finish;
		
	end
	initial begin 
		$display("time      x y z b d",$time);
		$monitor("%3d       %d %d %d %d %d",$time,x,y,z,b,d);
	end
endmodule