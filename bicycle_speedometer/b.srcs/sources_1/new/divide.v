`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2017 11:59:54 PM
// Design Name: 
// Module Name: divide
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


module divide(
    input clock,
    input [23:0]A,
    input [16:0]B,
    output reg [10:0]ans
    );
    
    always @ (posedge clock)
    begin
            if( A>(ans*B) ) ans<= ans+1;
            else if(ans>0) ans <= ans-1;
    end  
endmodule
