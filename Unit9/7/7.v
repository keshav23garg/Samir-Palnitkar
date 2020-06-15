`timescale 1ns/1ps

module fulladd4(sum,cout,a,b,cin);
	output [3:0] sum;
	output cout;
	input [3:0] a,b;
	input cin;
	
	assign {cout,sum} = a + b + cin;
endmodule
module stimulus;
	wire [3:0] sum;
	wire cout;
	reg [31:0] random;
	reg [3:0] a,b;
	reg cin, seed;
	fulladd4 add1(sum,cout,a,b,cin);
	initial begin
		repeat(20) begin
			random = $random;
			a = random[3:0];
			b = random[7:4];
			cin = random[8];
			 #0 $display("%d + %d + %d = %d , %d" ,a,b,cin,sum,cout);
		end
	end
	
endmodule