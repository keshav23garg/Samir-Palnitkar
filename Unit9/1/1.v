`timescale 1ns/1ps

module d_ff(q,d,clk,preset,clr);
	input d,clk,preset,clr;
	output reg q;
	always @(posedge clk)
		q = d;
	always @(preset or clr) begin
		if(preset)
			assign q = 1;
		else 
			deassign q;
		if(clr)
			assign q = 0;
		else 
			deassign q;
	end
endmodule

module stimulus;
	wire q;
	reg d,clr,clk,preset;
	d_ff ff1(q,d,clk,preset,clr);
	initial begin
		clk = 1'b0;
		clr = 1'b1;
		preset = 1'b0;
		d = 1'b1;
		forever #5 clk = ~clk;
	end
	initial
		$monitor($time , " d = %d , clr = %d , preset = %d , q = %d" ,d,clr,preset,q);
	initial begin
		#5 clr = 1'b0;
		#15 d = 1'b0;
		#10 preset = 1'b1;
		#5 preset = 1'b0;
		#20 $finish;
	end
endmodule