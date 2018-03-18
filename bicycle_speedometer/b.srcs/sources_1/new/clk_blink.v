`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2017 12:00:15 PM
// Design Name: 
// Module Name: clk_blink
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


module clk_blink(
    input wire clock,
    output reg clkblink
    );
    
    reg [12:0]count;
    always @ (posedge clock)
    begin
    count <= count + 1;
    if (count<2048) begin
        clkblink<=1;
        end
    else if((count>2048)&&(count<6144)) begin
        clkblink<=0;
        end
    else if(count==6144) count<=0;
    end
endmodule
