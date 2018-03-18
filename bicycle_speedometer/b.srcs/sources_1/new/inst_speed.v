`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2016 04:46:59 PM
// Design Name: 
// Module Name: inst_speed
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


module inst_speed(
    input clock,enable_10ms, reset,calc_enable,reed,gen_1s,
    input [7:0] circ,
    output reg [7:0] KMH
    );
reg [7:0]distance_inst=0;   //unit cm
reg [7:0]distance_m_inst=0;;   //unit m
reg [16:0]tim=0;            //clk2048
reg reed_flag;
reg stop_flag;
reg [23:0] A;
wire [10:0] ans;

always @ (posedge clock)
begin   
        A <= 147*circ;
        if(reset) begin
        distance_inst <=0;
        distance_m_inst <= 0;
        tim <= 0;
        end
       if(distance_inst> 100) begin
            distance_inst <= distance_inst -100;
            distance_m_inst <= distance_m_inst +1;
       end
       if (reed && calc_enable) begin
              reed_flag <=1 ;
            //    if (reed_inst==300) reed_inst<=0;
        end
     //   if (enable_10ms && calc_enable) begin
                tim <=tim + 1 ;
                if (tim==32768) stop_flag<=1;
                else stop_flag<=0;
   //     end
        if(calc_enable && (reed_flag==1))
        begin
     //      KMH <= 36*circ/(10*tim);
           KMH <= ans[7:0];
           tim <= 0;
           reed_flag <= 0;
        end
        else if(stop_flag) KMH <= 0;
end


divide DIVIDE_2(
    .clock(clock),
    .A(A),
    .B(tim),
    .ans(ans)
    );  
  

endmodule
