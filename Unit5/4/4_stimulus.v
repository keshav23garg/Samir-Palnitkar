`timescale 1ns / 1ps
module stimulus;
	reg set , reset;
	wire q , bar;
	rs_latch latch (q,qbar,set,reset);
	
	initial begin 
		$dumpfile("output.vcd");
		$dumpvars(0,stimulus);
		set=0;
		reset=0;
		#20 set = 0;
		reset =1;
		#20 set = 1;
		reset = 0;
		#20 set = 1;
		reset = 0;
		#20 set = 0;
		#20;
	end
	initial
		$monitor("time=%3d set=%d , reset=%d , q=%d , qbar=%d " ,$time , set,reset,q,qbar);
endmodule