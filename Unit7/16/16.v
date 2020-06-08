`timescale 1ns/1ps 

module stimulus;
	reg clk,a;
	initial begin
		clk = 1'b0;
		a = 1'b0;
		$dumpfile("output.vcd");
		$dumpvars(0,stimulus);
		forever #5 clk =~clk;
	end
	initial begin
		#500 $finish;
	end
	initial begin
		repeat(20) @(posedge clk) a = a;
		a = a+1;
	end
endmodule