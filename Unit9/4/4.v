`timescale 1ns/1ps
module full_adder(sum,c_out,a,b,c_in);
	parameter d_sum = 0 , d_out = 0;
	output sum,c_out;
	input a,b,c_in;
	wire s1,c1,c2;
	xor (s1,a,b);
	and (c1,a,b);
	xor #(d_sum) (sum,s1,c_in);
	and (c2,s1,c_in);
	or #(d_out) (c_out,c2,c1); 
endmodule

module fulladd4(sum,c_out,a,b,c_in);
	input [3:0] a,b;
	output [3:0] sum;
	output c_out;
	input c_in;
	wire c1,c2,c3;
	wire s0,s1,s2,s3;
	full_adder #(1,1) fa0(s0,c1,a[0],b[0],c_in);
	full_adder #(2,2) fa1(s1,c2,a[1],b[1],c1);
	full_adder #(3,3) fa2(s2,c3,a[2],b[2],c2);
	full_adder #(4,4) fa3(s3,c_out,a[3],b[3],c3);
	assign sum = {s3,s2,s1,s0};
endmodule
module fulladd4_v1(sum,c_out,a,b,c_in);
	input [3:0] a,b;
	output [3:0] sum;
	output c_out;
	input c_in;
	wire c1,c2,c3;
	wire s0,s1,s2,s3;
	full_adder fa0(s0,c1,a[0],b[0],c_in);
	full_adder fa1(s1,c2,a[1],b[1],c1);
	full_adder fa2(s2,c3,a[2],b[2],c2);
	full_adder fa3(s3,c_out,a[3],b[3],c3);
	
	defparam fa0.d_out = 1 , fa0.d_sum = 1;
	defparam fa1.d_out = 2 , fa1.d_sum = 2;
	defparam fa2.d_out = 3 , fa2.d_sum = 3;
	defparam fa3.d_out = 4 , fa3.d_sum = 4;
	
	assign sum = {s3,s2,s1,s0};
endmodule
module stimulus;
	//`define DPARAM 1'b0;
	reg [3:0] a,b;
	reg c_in;
	wire [3:0] sum;
	wire c_out;
	`ifndef DPARAM
		fulladd4 add1(sum,c_out,a,b,c_in);
	`else
		fulladd4_v1 add2(sum,c_out,a,b,c_in);
	`endif
	
	initial
		$monitor($time , "  sum=%d,cout=%d" , sum,c_out);
		
	initial begin
		a = 4'd2;
		b = 4'd5;
		c_in = 1'b1;
		#20 c_in = 1'b0;
		#20 a = 4'd3;
		#20 $finish;
	end
	
endmodule