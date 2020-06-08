`timescale 1ns/1ps

module stimulus;
	reg [3:0] cache_var [1023:0];
	integer i;
	initial begin
		for (i = 0;i<1024;i=i+1) begin
			cache_var[i] = 4'b0000;
		end
	end
endmodule