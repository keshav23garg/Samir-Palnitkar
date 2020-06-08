module mux(out , in , select);
	output reg out;
	input [3:0] in;
	input [1:0] select;
	always @(*) begin
		if(~select[0]&~select[1])
			out = in[0];
		else if(select[0]&~select[1])
			out = in[1];
		else if(~select[0]&select[1])
			out = in[2];
		else if(select[0]&select[1])
			out = in[3];
	end
endmodule