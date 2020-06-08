
//d flip flop with only changes at -ve edge of the clock 
module d_ff(q,clr,clk,d);
	output reg q;
	input clr,clk,d;
	always @(negedge clk) begin
		if(clr) 
			q <= 1'b0;
		else 
			q <= d;
	end
endmodule