
 
`timescale 1ns / 1ps
module stimulus;
	reg x;
	reg y;
	reg c_in;
	wire sum;
	wire c_out;
	// Instantiate the Unit Under Test (UUT)
	full_adder uut (sum,c_out,x,y,c_in);
 
	initial begin
	$dumpfile("output.vcd");
    $dumpvars(0,stimulus);
		// Initialize Inputs
		x = 0;
		y = 0;
		c_in = 0;
	#20 x = 1;
	#20 y = 1;
	#20 c_in = 1;
	#20 y = 0;
	#20 y = 1;	
	#20 x = 1;	  
	#20 ;
	
	end  
 
		initial begin
		 $monitor("t=%3d x=%d,y=%d,c_in=%d,sum=%d,c_out=%d \n",$time,x,y,c_in,sum,c_out );
		 end
 
endmodule
 