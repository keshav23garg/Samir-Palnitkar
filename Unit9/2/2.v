`timescale 1ns/1ps

module full_add(sum,c_out,a,b,c_in);
	output reg sum,c_out;
	input a,b,c_in;
	always @(*) begin
		if($time>15&&$time<35)
			sum = a&b&c_in;
		else
			{c_out,sum} = a+b+c_in;
	end
endmodule

module stimulus;
	reg a,b,c_in;
	wire sum,c_out;
	full_add add1(sum,c_out,a,b,c_in);
	
	initial 
		$monitor($time ,"  %d+%d+%d = %d , %d" , a,b,c_in,sum,c_out);
	initial begin
		a = 0;
		b = 1; c_in = 0;
		#10 c_in = 1;
		#6 a = 0;
		#10 b = 1;
		a = 1;
		c_in = 1;
		#10 c_in = 0;
		#5 $finish;
	end
endmodule