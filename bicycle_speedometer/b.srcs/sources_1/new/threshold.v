`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2016 04:12:42 PM
// Design Name: 
// Module Name: threshold
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
// tzutzu
//////////////////////////////////////////////////////////////////////////////////


module threshold(
    input reed,
    input clock,
    input wire gen_1s,
    input reset,
    output reg calc_enable
    );
reg [0:7] trshld; //threshold

always @ (posedge clock)
begin : threshold 
    if (reset)
        begin 
        trshld <= 0; 
        calc_enable <= 0;
        end
    if (reed)
        begin  
        trshld <= trshld +1 ; 
        end
    if (gen_1s)
        begin
        if(trshld>1) 
            begin
            calc_enable <= 1;
            trshld <= 0;
            end
        else begin
            calc_enable <= 0;
            trshld <= 0;
            end            
        end
 end

   
endmodule
