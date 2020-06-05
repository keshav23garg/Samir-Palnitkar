`timescale 1ns / 1ps
module stimulus;
	reg [3:0] a;
	reg [3:0] b;
	wire a_big_b , a_small_b , a_eq_b;
	comparator comp1(a_big_b , a_small_b , a_eq_b, a, b);
	initial begin
		$dumpfile("output.vcd");
		$dumpvars(0,stimulus);
		a = 4'b0000;
		b = 4'b0000;
		#20 a = 4'b1111;
		#20 b = 4'b1111;
		a = 4'b0000;
		#20 $finish;
	end
	initial begin
		$monitor("time = %3d , a_big_b=%d , a_small_b=%d , a_eq_b=%d" , $time ,a_big_b , a_small_b , a_eq_b);
	end
endmodule 