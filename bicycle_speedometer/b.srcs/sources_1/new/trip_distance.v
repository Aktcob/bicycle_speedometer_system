`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2017 08:44:27 PM
// Design Name: 
// Module Name: trip_distance
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

module trip_distance(
    input clock , reset , reed , calc_enable,
    input [7:0] circ,
    output reg [13:0] DAY_M,
    output wire [13:0] DAY   //0.1km
    );

reg [31:0] DAY_CM=0;

always @ (posedge clock)
begin
        if(reset) begin
                DAY_M <=0;
                DAY_CM <= 0;
                end
        if (reed && calc_enable) begin
            DAY_CM<= DAY_CM + circ ;
        end        
        if(DAY_CM > 100) 
        begin
        DAY_M <= DAY_M +1;
        DAY_CM <= DAY_CM -100;
        end
 end
assign DAY = DAY_M / 100;
//assign DAY_M = DAY_CM / 100;
endmodule
