`timescale 1us/10ns

//	The following line is needed for correct timing contraints, DO NOT REMOVE!
(* keep_hierarchy = "yes" *)
module CLK_DIVIDER_BIKE (
   input wire clk_i,
   input wire reset,
   output wire clk_o
);

// Signal Definitions
reg [13:0] count = 0;
reg [13:0] end_val = 125000000/(2*4096);
reg internal_slow_clock = 0;

// Output Clock Buffer
BUFG BUFG_4096 (
	.O(clk_o),
	.I(internal_slow_clock)
);

// Functional Part
always @ (posedge clk_i)
begin:counter
	if(reset) begin
		count <= 0;
		internal_slow_clock <= 0;
	end
	else begin
		if (count == end_val) begin
			count <= 0;
			internal_slow_clock <= ~internal_slow_clock;
		end else begin
			count <= count + 1;
		end
	end
end

endmodule