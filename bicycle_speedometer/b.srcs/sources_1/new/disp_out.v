`timescale 1us/10ns


module disp_out (
  input wire clock,
  input wire enable_10ms,
  input wire [13:0] m_time,
  output wire [7:0] displ_0001,
  output wire [7:0] displ_0010,
  output wire [7:0] displ_0100,
  output wire [7:0] displ_1000
);


parameter dualwidth = 14;
parameter bcdwidth  = 16;

reg [bcdwidth-1:0] bcd;
wire bcd_finish;
reg bcd_start;
wire [bcdwidth-1:0] bcd_out;


// instantiations
dual2bcd #(
  .dualwidth(dualwidth),
  .bcdwidth(bcdwidth)
) inst1_dual2bcd (
  clock,
  bcd_start,
  m_time,
  bcd_finish,
  bcd_out
);

bcd2ascii bcd_2_ascii_0001 (bcd[3:0],   displ_0001);
bcd2ascii bcd_2_ascii_0010 (bcd[7:4],   displ_0010);
bcd2ascii bcd_2_ascii_0100 (bcd[11:8],  displ_0100);
bcd2ascii bcd_2_ascii_1000 (bcd[15:12], displ_1000);


always @ (posedge clock)
begin
    bcd_start <= enable_10ms;
    if (bcd_finish)
      bcd <= bcd_out;
end

endmodule
