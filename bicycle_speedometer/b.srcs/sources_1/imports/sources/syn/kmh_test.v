`timescale 1us/10ns



module KMH_TEST (
	input wire CLK2048,
	input wire reset,
	input wire [3:0] TEST_SW,
	output reg REED_TEST
);
   


// Signal Definitions

reg [14:0] counter = 0;



// Functional Part

always @ (posedge CLK2048)
begin:count
	if(reset) begin
		counter <= 0;
		REED_TEST <= 0;
	end
	else begin
		case (counter)
			156 : begin
				if (TEST_SW==9) begin
					counter <= 0;
					REED_TEST <= 1;
				end else counter <= counter + 1;
			end
			194 : begin
				if (TEST_SW>=8) begin
					counter <= 0;
					REED_TEST <= 1;
				end else counter <= counter + 1;
			end
			382 : begin
				if (TEST_SW>=7) begin
					counter <= 0;
					REED_TEST <= 1;
				end else counter <= counter + 1;
			end
			764 : begin
				if (TEST_SW>=6) begin
				counter <= 0;
				REED_TEST <= 1;
				end else counter <= counter + 1;
			end
			1528 : begin
				if (TEST_SW>=5) begin
					counter <= 0;
					REED_TEST <= 1;
				end else counter <= counter + 1;
			end
			1916 : begin
				if (TEST_SW>=4) begin
					counter <= 0;
					REED_TEST <= 1;
				end else counter <= counter + 1;
			end
			3632 : begin
				if (TEST_SW>=3) begin
					counter <= 0;
					REED_TEST <= 1;
				end else counter <= counter + 1;
			end
			7664 : begin
				if (TEST_SW>=2) begin
					counter <= 0;
					REED_TEST <= 1;
				end else counter <= counter + 1;
			end
			15328 : begin
				if (TEST_SW>=1) begin
					counter <= 0;
					REED_TEST <= 1;
				end else counter <= counter + 1;
			end
			default: begin
				counter <= counter + 1;
				REED_TEST <= 0;
			end
		endcase
	end
end

   

endmodule
