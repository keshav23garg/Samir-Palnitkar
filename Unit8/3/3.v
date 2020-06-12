`timescale 1ns/1ps

module stimulus;
	function [4:0] ALU;
		input [3:0] a,b;
		input [2:0] select;
		begin
			case(select)
				3'b000 : ALU = a;
				3'b001 : ALU = a+b;
				3'b010 : ALU = a-b;
				3'b011 : ALU = a/b;
				3'b100 : ALU = a%b;
				3'b101 : ALU = a<<1;
				3'b110 : ALU = a>>1;
				3'b111 : ALU = a>b;
			endcase
		end
	endfunction
	
	reg [4:0] result;
	reg [2:0] select;
	initial begin
		select = 3'b000;
		repeat(7) begin
			result = ALU(4'd8,4'd6,select);
			#10 select = (select+1);
		end
	end
	initial 
		$monitor("select = %d , result = %d" , select , result);
endmodule