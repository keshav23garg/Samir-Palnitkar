module my_or(output a , input x , input y);
	assign a = x|y;
endmodule
module my_and(output a , input x , input y);
	assign a = x&y;
endmodule
module my_not(output a , input x );
	assign a = ~x;
endmodule
module my_xor(output z , input x , input y);
	wire a,b,c,d;
	my_not not_a (a , x);
	my_not not_b (b , y);
	my_and and_1 (c , x , b);
	my_and and_2 (d , a , y);
	my_or or_1 (z , c , d);
endmodule