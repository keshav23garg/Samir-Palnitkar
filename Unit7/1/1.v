`timescale 1ns/1ps
module stimulus;
	reg oscillate;
	initial begin
	oscillate=1'b0;
	forever #30 oscillate=~oscillate;
	end
	initial 
		$monitor($time ," oscillate = %b" ,oscillate);
	initial 
		#500 $finish;
endmodule