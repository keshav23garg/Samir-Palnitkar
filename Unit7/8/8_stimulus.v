`timescale 1ns/1ps
module stimulus;
	reg d,clk,clr;
	wire q;
	d_ff ff1(q,clr,clk,d);
	initial begin
		$dumpfile("output.vcd");
		$dumpvars(0,stimulus);
		#200 $finish;
	end
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end
	initial begin
		d = 1'b0;
		clr = 1'b0;
		#15 d = 1'b1;
		#20 d = 1'b0;
		#6 d = 1'b1;
		#10 clr = 1'b1;
		#23 clr = 1'b0;
	end
	initial 
		$monitor($time, " d = %d , q = %d clr = %d", d,q,clr);
endmodule