module my_or(output a , input x , input y);
	assign a = x|y;
endmodule
module my_and(output a , input x , input y);
	assign a = x&y;
endmodule
module my_not(output a , input x );
	assign a = ~x;
endmodule