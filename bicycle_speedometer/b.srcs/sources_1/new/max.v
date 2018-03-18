`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2017 03:26:04 PM
// Design Name: 
// Module Name: max
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


module max(
    input clock,reset,
    input [7:0] KMH,
    output reg [7:0]MAX
    );
    
    always @ (posedge clock)
    begin
    if(reset) MAX <= 0;
    if(KMH > MAX) MAX <= KMH;
    end
    
endmodule
