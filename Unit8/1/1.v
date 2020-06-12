`timescale 1ns/1ps

module stimulus;
	
	function [31:0] factorial;
		input [3:0] number;
		reg [3:0] i;
		begin
			i = 4'b0001;
			factorial = 32'd1;
			repeat(number) begin
				factorial = factorial * i;
				i = i+1;
			end
		end
	endfunction
	
	reg [31:0] fact;
	reg [3:0] no;
	initial begin
		no = 4'd14;
		fact = factorial(no);
		$display("factorial of %d is %d" , no, fact);
		$finish;
	end
endmodule