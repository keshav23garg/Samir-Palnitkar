`timescale 1ns/1ps

module stimulus;
	reg [3:0] a,b;
	reg [2:0] select;
	wire [4:0] out;
	ALU uut(out , select , a , b );
	initial begin
		$dumpfile("output.vcd");
		$dumpvars(0,stimulus);
		a = 4'b1010;
		b = 4'b1000;
		select = 3'b000;
		repeat(7)
			#20 select = select+1;
	end
	initial 
		$monitor($time , "  a = %d , b = %d , out = %d",a,b,out);
endmodule