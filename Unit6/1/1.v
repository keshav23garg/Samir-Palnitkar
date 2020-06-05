module binary_sub(output d , output b , input x , input y , input z);
	assign d = (~x&&~y&&z)||(~x&&y&&~z)||(x&&~y&&~z)||(x&&y&&z);
	assign b = (~x&&y)||(~x&&z)||(y&&z);
endmodule