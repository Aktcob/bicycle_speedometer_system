`timescale 1us/10ns


module gen_10ms (
  input wire  clock,
  output wire enable_10ms
);


// internal signals
reg [5:0] reg_out;


// start of module description

always @ (posedge clock)
begin:counter // block name
  if ( reg_out == 40 ) begin
    reg_out <= 0;
  end else begin
    reg_out <= reg_out + 1;
  end
end

assign enable_10ms = (reg_out == 40) ? 1 : 0 ;

endmodule
