`timescale 1ns/1ps

module stimulus;
	reg [7:0] count;
	reg clk;
	initial begin
		count = 8'b00000101;
		clk = 1'b0;
		forever #5 clk=~clk;
	end
	initial 
	begin : counter
	forever begin
		@(posedge clk) count = count+1;
		if(count==8'b01000011) disable counter;
	end
	end
	initial 
		$monitor($time , "  count=%d  " , count);
	initial 
		#1000 $finish;
endmodule