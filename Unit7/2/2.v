`timescale 1ns/1ps

module stimulus;
	reg clock;
	initial begin
		$dumpfile("output.vcd");
		$dumpvars(0,stimulus);
		clock = 1'b0;
	end
	always begin
		#30 clock = ~clock;
		#10 clock = ~clock;
	end
	initial 
		$monitor("time = %3d clock = %d" , $time , clock);
	initial
		#500 $finish;
endmodule