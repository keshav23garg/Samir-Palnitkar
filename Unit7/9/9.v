 module d_ff(q,clk,d);
	output reg q;
	input clk,d;
	always @(*)
		wait (clk) q = d;
	
	/*always @(clk or d)
		if(clk)
		q=d;*/
	
endmodule