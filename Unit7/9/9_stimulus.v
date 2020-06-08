`timescale 1ns/1ps
module stimulus;
	reg d,clk;
	wire q;
	d_ff ff1(q,clk,d);
	initial begin
		$dumpfile("output.vcd");
		$dumpvars(0,stimulus);
	end
	initial 
		#100 $finish;
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end
	initial begin
		d = 1'b1;
		#15 d = 1'b0;
		#20 d = 1'b1;
		#6 d = 1'b0;
	end
	initial 
		$monitor($time, " d = %d , q = %d ", d,q);
endmodule