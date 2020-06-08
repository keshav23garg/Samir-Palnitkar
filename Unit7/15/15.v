`timescale 1ns/1ps
module stimulus;
	reg clk;
	initial begin 
		$dumpfile("output.vcd");
		$dumpvars(0,stimulus);
		clk = 1'b0;
		forever begin
			#6 clk = ~clk;
			#4 clk = ~clk;
		end
	end
	initial	
		#100 $finish;
endmodule