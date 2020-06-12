`timescale 1ns/1ps
module stimulus;
	function [7:0] multiply;
	input [3:0] a,b;
	begin
		multiply = a*b;
	end
	endfunction
	
	reg[7:0] result;
	initial begin
		result = multiply(2,5);
		$display("result = %d" , result);
		$finish;
	end
endmodule