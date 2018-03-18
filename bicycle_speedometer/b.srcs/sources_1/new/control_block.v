`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2017 05:49:07 PM
// Design Name: 
// Module Name: control_block
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


module control_block(
    input wire clock,
    input wire reset,
    input wire mode,
    input wire [13:0]DAY_DATA,
    input wire [10:0]AVS_DATA,
    input wire [13:0]TIM_DATA,
    input wire [7:0]MAX_DATA,
    input wire [7:0]KMH_DATA,
    output reg AVS,DAY,MAX,TIM,POINT,COLON,KMH,
    output wire [7:0] Upper_1ascii,
    output wire [7:0] Upper_10ascii,
    output wire [7:0] displ_0001,
    output wire [7:0] displ_0010,
    output wire [7:0] displ_0100,
    output wire [7:0] displ_1000
    );
    
reg  [1:0] MODE; 
wire [7:0] Upper100_ascii;
wire [7:0] Upper1000_ascii;
wire enable_10ms;
wire clk1s;
wire clkblink;
reg [13:0] m_time;
reg [13:0] m_upper;

always @(posedge clock)
begin
    if(reset)begin
    m_time <=0;
    m_upper <= 0;
    end
                 KMH<=1;
                 if(KMH<99)   m_upper<= {6'b000000,KMH_DATA};
                 else m_upper <= 99;
                if(mode) begin
                         if(MODE==2'b11) MODE <= 2'b00; 
                         else MODE <= MODE + 1;
                         end
            if(KMH_DATA < 65)
            begin
                    case (MODE)
                      2'b00: 
                      begin
                          COLON<=0;
                          POINT<=1;
                          DAY<=1;
                          AVS<=0;
                          MAX<=0;
                          TIM<=0;
                          m_time<=DAY_DATA;
                      end
                      2'b01: 
                      begin
                          COLON<=0;
                          POINT<=1;
                          DAY<=0;
                          AVS<=1;
                          MAX<=0;
                          TIM<=0;
                          m_time<={3'b000,AVS_DATA};
                      end
                      2'b10:
                      begin
                          COLON<=clk1s;
                          POINT<=0;
                          DAY<=0;
                          AVS<=0;
                          MAX<=0;
                          TIM<=1;
                          m_time<=TIM_DATA;
                      end
                      2'b11:
                      begin
                          COLON<=0;
                          POINT<=0;
                          DAY<=0;
                          AVS<=0;
                          MAX<=1;
                          TIM<=0;
                          m_time<={6'b000000,MAX_DATA};
                      end
                      default: DAY<=0;
                    endcase
              end
              else if(KMH_DATA >65) begin
                    case (MODE)
                    2'b00: 
                    begin
                        COLON<=0;
                        POINT<=1;
                        DAY<=1;
                        AVS<=clkblink;
                        MAX<=clkblink;
                        TIM<=clkblink;
                        m_time<=DAY_DATA;
                    end
                    2'b01: 
                    begin
                        COLON<=0;
                        POINT<=1;
                        DAY<=clkblink;
                        AVS<=1;
                        MAX<=clkblink;
                        TIM<=clkblink;
                        m_time<={3'b000,AVS_DATA};
                    end
                    2'b10:
                    begin
                        COLON<=clk1s;
                        POINT<=0;
                        DAY<=clkblink;
                        AVS<=clkblink;
                        MAX<=clkblink;
                        TIM<=1;
                        m_time<=TIM_DATA;
                    end
                    2'b11:
                    begin
                        COLON<=0;
                        POINT<=0;
                        DAY<=clkblink;
                        AVS<=clkblink;
                        MAX<=1;
                        TIM<=clkblink;
                        m_time<={6'b000000,MAX_DATA};
                    end
                    default: DAY<=0;
                  endcase
              end
end 

disp_out DISP_LOWER (
  clock,
  enable_10ms,
  m_time,
  displ_0001,
  displ_0010,
  displ_0100,
  displ_1000
);

disp_out DISP_UPPER (
  .clock(clock),
  .enable_10ms(enable_10ms),
  .m_time(m_upper),
  .displ_0001(Upper_1ascii),
  .displ_0010(Upper_10ascii),
  .displ_0100(Upper_100ascii),
  .displ_1000(Upper_1000ascii)
);

gen_10ms inst_gen_10ms (
  clock,
  enable_10ms
);

clk_1s CLK_1S(
    .clock(clock),
    .clk1s(clk1s)
    );
    
clk_blink CLK_BLINK(
       .clock(clock),
       .clkblink(clkblink)
       );
       
endmodule
