// d flip flop for changes at -ve edge only but clr could be done
module d_ff(q,clr,clk,d);
	output reg q;
	input clr,clk,d;
	always @(negedge clk or posedge clr) begin
		if(clr) 
			q <= 1'b0;
		else 
			q <= d;
	end
endmodule