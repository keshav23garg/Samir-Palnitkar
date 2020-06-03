`timescale 1ns / 1ps
module stimulus;
	reg i0,i1,switch;
	wire out;
	mux mux1 (out , i0 , i1 , switch);
		
	initial begin
		$dumpfile("output.vcd");
		$dumpvars(0,stimulus);
		i0 = 0;
		i1 = 0;
		switch = 0;
		#20 i0 = 1;
		#20 switch = 1;
		#20 i1 = 1;
		#20 switch = 0;
		#20;
	end
	initial
		$monitor("time = %3d i0 = %d , i1 = %d , switch = %d , output = %d" , $time , i0 , i1 , switch , out);
endmodule