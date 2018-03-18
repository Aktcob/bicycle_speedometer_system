`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2017 08:59:57 PM
// Design Name: 
// Module Name: average_speed
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module average_speed(
    input clock,reset,calc_enable,
    input gen_1s,
    input [13:0] DAY,
    input [12:0] TIM,
    output reg [10:0] AVS   //  0.1km/h
    );

wire [10:0]ans;
reg [23:0]A;
reg [12:0]B;

always @ (posedge clock)
begin
    if(reset) AVS <= 0;        
    if(calc_enable && gen_1s)
    begin
    A <= 36*DAY;
    if(TIM<1) B<=1;
    else B <= TIM;
    AVS <= ans;
    end
end

divide DIVIDE(
    .clock(clock),
    .A(A),
    .B({4'b0,B}),
    .ans(ans)
    );  
endmodule
