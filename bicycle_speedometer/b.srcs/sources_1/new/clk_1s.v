`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/26/2017 10:52:02 PM
// Design Name: 
// Module Name: clk_1s
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


module clk_1s(
    input wire clock,
    output reg clk1s
    );
    
    reg [12:0]count;
    always @ (posedge clock)
    begin
    count <= count + 1;
    if (count == 2048) begin
        clk1s<=~clk1s;
        count <= 0;
        end
    end
endmodule
