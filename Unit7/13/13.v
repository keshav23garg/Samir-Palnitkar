`timescale 1ns/1ps
module stimulus;
	reg clk;
	initial begin
		clk = 1'b0;
		while(1) #5 clk = ~clk;
	end
	initial #100 $finish;
endmodule