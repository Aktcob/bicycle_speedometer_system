`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2017 10:31:16 PM
// Design Name: 
// Module Name: calcul_block
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


module calcul_block(
    input wire clock,
    input wire reset,
    input wire reed,
    input wire [7:0]circ,
    output wire [10:0]AVS_DATA,
    output wire [13:0]DAY_DATA,
    output wire [7:0]MAX_DATA,
    output wire [13:0]TIM_DATA,
    output reg [7:0]KMH_DATA_PER
    );


    wire gen_1s;
    wire tt_flg;
    wire [13:0]DAY_M;   //DISTANCE   unit: m
    wire [19:0]TIM_S;   //TIME       unit: s
    reg  [13:0]DAY_M_PER;
    wire  [7:0]KMH_DATA;   
    
    always @ (posedge clock)
    begin
        if(gen_1s)
        begin
        DAY_M_PER <= DAY_M;
        KMH_DATA_PER <= KMH_DATA;
        end
    end
    
    gen_1s GEN_1S(
    .clock,
    .gen_1s
    );    

    gen_10ms inst_gen_10ms (
      clock,
      enable_10ms
    );

    threshold THRESHOLD(
            .reed(reed),
            .clock(clock),
            .gen_1s(gen_1s),
            .reset(reset),
            .calc_enable(calc_enable)
            );
            
    trip_time TRIP_TIME(
            .clock(clock),
            .reset(reset),
            .calc_enable(calc_enable),
            .gen_1s(gen_1s),
            .TIM_S(TIM_S),
            .TIM_DISPLAY(TIM_DATA)
                );
                
    trip_distance TRIP_DISTANCE(
                     .clock(clock),
                     .reset(reset),
                     .reed(reed),
                     .calc_enable(calc_enable),
                     .circ(circ),
                     .DAY_M(DAY_M),
                     .DAY(DAY_DATA)
                              );

      average_speed AVERAGE_SPEED(
              .clock(clock),
              .reset(reset),
              .calc_enable(1),
              .gen_1s(gen_1s),
              .DAY(DAY_M_PER),
              .TIM(TIM_S),
              .AVS(AVS_DATA)
                           );
                           
    inst_speed INST_SPEED(
                .clock(clock),
                .enable_10ms(enable_10ms),
                .reset(reset),
                .calc_enable(1),
                .reed(reed),
                .gen_1s(gen_1s),
                .circ(circ),
                .KMH(KMH_DATA)
                       );
                           
    max MAX(
           .clock(clock),
           .reset(reset),
           .KMH(KMH_DATA_PER),
           .MAX(MAX_DATA)
    );
endmodule
