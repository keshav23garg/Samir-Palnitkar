`timescale 1ns/1ps
module stimulus;
	reg clk,clr,count_en;
	wire [3:0] q;
	initial 
		$monitor($time , "count q = %b , clr = %b , count_en = %b", q[3:0], clr , count_en);
	counter c1(clr,clk,count_en,q);
	
	initial begin
		$dumpfile("output.vcd");
		$dumpvars(0,stimulus);
		clr = 1'b0;
		#50 clr = 1'b1;
		#100 clr = 1'b0;
		#75 clr = 1'b1;
	end
	initial begin
		clk = 1'b0;
		forever #5 clk=~clk;
	end
	initial begin
		count_en=1'b0;
		#60 count_en=1'b1;
		#20 count_en=1'b0;
		#10 count_en=1'b1;
		
	end
	initial #500 $finish;
	
endmodule