`timescale 1ns / 1ps


module TOP_OF_YOUR_BICYCLE(
	input wire clock,
	input wire mode,
	input wire [7:0]circ,
	input wire reed,
	input wire reset,
	output wire AVS,
	output wire DAY,
	output wire MAX,
	output wire point,
	output wire TIM,
	output wire col,
	output wire [7:0]lower0001,
	output wire [7:0]lower0010,
	output wire [7:0]lower0100,
	output wire [7:0]lower1000,
	output wire [7:0]upper01,
	output wire [7:0]upper10
);

wire [13:0]DAY_DATA;
wire [10:0]AVS_DATA;
wire [13:0]TIM_DATA;
wire [7:0]MAX_DATA;
wire [7:0]KMH_DATA;

calcul_block CALCUL_BLOCK(
    .clock(clock),
    .reset(reset),
    .reed(reed),
    .circ(circ),
    .AVS_DATA(AVS_DATA),
    .DAY_DATA(DAY_DATA),
    .MAX_DATA(MAX_DATA),
    .TIM_DATA(TIM_DATA),
    .KMH_DATA_PER(KMH_DATA)
    );

control_block CONTROL_BLOCK (
  .clock(clock),
  .reset(reset),
  .mode(mode),
  .DAY_DATA(DAY_DATA),
  .AVS_DATA(AVS_DATA),
  .TIM_DATA(TIM_DATA),
  .MAX_DATA(MAX_DATA),
  .KMH_DATA(KMH_DATA),
  .AVS(AVS),
  .DAY(DAY),
  .MAX(MAX),
  .TIM(TIM),
  .POINT(point),
  .COLON(col),
  .KMH(KMH),
  .Upper_1ascii(upper01),
  .Upper_10ascii(upper10),
  .displ_0001(lower0001),
  .displ_0010(lower0010),
  .displ_0100(lower0100),
  .displ_1000(lower1000)
);



endmodule