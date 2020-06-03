module full_adder(output sum , output c_out , input x , input y , input c_in);
	wire w1 , w2 , w3;
	xor xor1(w1 , x , y);
	xor xor2(sum , w1 , c_in);
	and and1(w2 , w1 , c_in);
	and and2(w3 , x, y);
	or or1(c_out , w2 , w3);
endmodule