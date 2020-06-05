module comparator(output a_big_b , output a_small_b , output a_eq_b , input [3:0] a , input [3:0] b);
	wire [3:0] x;
	assign x = a^~b;
	assign a_eq_b = x[3]&&x[2]&&x[1]&&x[0];
	assign a_big_b = (a[3]&&~b[3])||(x[3]&&a[2]&&~b[2])||(x[3]&&x[2]&&a[1]&&~b[1])||(x[3]&&x[2]&&x[1]&&a[0]&&~b[0]);
	assign a_small_b = (~a[3]&&b[3])||(x[3]&&~a[2]&&b[2])||(x[3]&&x[2]&&~a[1]&&b[1])||(x[3]&&x[2]&&x[1]&&~a[0]&&b[0]);
endmodule