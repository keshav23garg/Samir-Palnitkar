module jk_ff(j,k,clr,clk,q,qbar);
	output q,qbar;
	input j,k,clk,clr;
	wire a,y,c,d,ybar,b,cbar;
	assign cbar = ~clk,
	a = ~(j&qbar&clk&clr),
	b = ~(k&clk&q),
	y = ~(a&ybar),
	ybar = ~(y&clr&b),
	c = ~(y&cbar),
	d = ~(cbar&ybar),
	q = ~(qbar&c),
	qbar = ~(q&clr&d);
endmodule

module counter(clr,clk,count_en,q);
	output [3:0] q;
	input clr,clk,count_en;
	wire c1,c2,c3;
	assign c1 = q[0]&count_en;
	assign c2 = q[1]&c1;
	assign c3 = q[2]&c2;
	jk_ff ff0(count_en,count_en,clr,clk,q[0],);
	jk_ff ff1(c1,c1,clr,clk,q[1],);
	jk_ff ff2(c2,c2,clr,clk,q[2],);
	jk_ff ff3(c3,c3,clr,clk,q[3],);
endmodule