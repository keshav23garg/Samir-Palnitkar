`timescale 1ns / 1ps
module mux(output z , input i0 , input i1 , input s);
	bufif0 #(1:2:3,3:4:5,5:6:7) gate1 (z, i0, s);
	bufif1 #(1:2:3,3:4:5,5:6:7) gate2 (z, i1, s);
endmodule