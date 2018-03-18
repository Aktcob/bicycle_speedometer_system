`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Taha
// 
// Create Date: 12/05/2016 05:32:44 PM
// Design Name: 
// Module Name: gen_1s
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: genarates 1 seconds from the crystall oscillator freuency
// frequency of 2.048KHz 488
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module gen_1s(
    input clock,
    output wire gen_1s
    );
    
  reg [12:0] reg_out; 
 always @ (posedge clock)
 begin 
    if (reg_out == 4096) begin
        reg_out <= 0;
    end else begin
        reg_out <= reg_out +1;
    end
 end
assign gen_1s = (reg_out == 4096 ) ? 1:0 ;

endmodule
