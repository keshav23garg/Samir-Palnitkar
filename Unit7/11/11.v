`define TRUE 1'b1;

`define FALSE 1'b0;

//Delays
`define Y2RDELAY 3 //Yellow to red delay
`define R2GDELAY 2 //Red to green delay
module sig_control(hwy,cntry,X,clock,clear);
output [1:0] hwy, cntry;
reg [1:0] hwy,cntry;
input X;
input clock,clear;
parameter RED=2'd0,
YELLOW=2'd1,
GREEN=2'd2;
//State definition HWY CONTRY
parameter S0=3'd0, //GREEN RED
S1=3'd1, //YELLOW RED
S2=3'd2, //RED RED
S3=3'd3, //RED GREEN
S4=3'd4; //RED YELLOW
reg [2:0] state;
reg [2:0] next_state;
always @(posedge clock)
if(clear)
state<=S0; //Controller starts in S0 state
else
state<=next_state; //State change
always @(state)
begin
if(state==S1)
hwy=YELLOW;
else if(state==S2)
hwy=RED;
else if(state==S3)
begin
hwy=RED;
cntry=GREEN;
end
else if(state==S4)
begin
hwy=RED;
cntry=YELLOW;
end
else
begin
hwy=GREEN; //Default Light Assignment for Highway light
cntry=RED; //Default light Assignment for Country light
end
end
always @(state or X)
begin
if(state==S0)
if(X)
next_state=S1;
else
next_state=S0;
else if(state== S1)
begin //delay some positive edges of clock
repeat(`Y2RDELAY) @(posedge clock);
next_state=S2;
end
else if(state== S2)
begin //delay some positive edges of clock
repeat(`R2GDELAY) @(posedge clock);
next_state=S3;
end
else if(state== S3)
if(X)
next_state=S3;
else
next_state=S4;
else
begin //delay some positive edges of clock
repeat(`Y2RDELAY) @(posedge clock);
next_state=S0;
end
end
endmodule