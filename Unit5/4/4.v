`timescale 1ns / 1ps
module rs_latch(output q , output qbar , input set , input reset);
	nor #(1)nor1(q , reset , qbar);
	nor #(1)nor2(qbar , set , q);
endmodule