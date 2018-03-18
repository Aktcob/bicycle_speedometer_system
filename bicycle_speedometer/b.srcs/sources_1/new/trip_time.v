`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2016 03:37:18 PM
// Design Name: 
// Module Name: trip_time
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


module trip_time(
    input clock,
    input reset,
    input calc_enable,
    input wire gen_1s,
    output reg [19:0]TIM_S,
    output reg [13:0]TIM_DISPLAY
    );
 
reg [15:0]count_s=0;
reg [15:0]count_m=0;
reg [15:0]count_h=0;
reg hour_flag=0;

always @ (posedge clock)
begin
    if(reset) begin
            TIM_S <= 0;
            TIM_DISPLAY <= 0;
            count_s <= 0;
            count_m <= 0;
            count_h <= 0;
            hour_flag <= 0;
            end
    if (calc_enable && gen_1s) begin
    TIM_S <= TIM_S +1;
    TIM_DISPLAY <= TIM_DISPLAY + 1;
    count_s <= count_s + 1;
    if(TIM_S == 3599)
        begin
        hour_flag <= 1;
        TIM_DISPLAY <= TIM_DISPLAY - 5859;
        end
    if(hour_flag==0)
        begin
        if(count_s == 59)
            begin
            TIM_DISPLAY <= TIM_DISPLAY + 41;
            count_s <= 0;
            end
        end
    else begin
        if(count_s == 59) begin
            count_s <= 0;
            count_m <= count_m + 1;
                if(count_m== 59) begin
                TIM_DISPLAY <= TIM_DISPLAY + 1;
                count_m <= 0;
                count_h <= count_h +1;
                    if(count_h==59) begin
                    TIM_DISPLAY <= TIM_DISPLAY + 41;
                    count_h <= 0;
                    end
                end
        end
    end
    end

end   
    
endmodule