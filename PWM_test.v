module PWM_test #(parameter n = 10, parameter m = 4)(
input CLOCK_50, 
input [1:0] KEY,
input [17:0] SW,
output [8:0] LEDG
);

wire s, t, h, mil;
wire [n-1:0] sw_period, sw_duty ;

assign sw_duty[7:0] = SW[7:0];
assign sw_period[9:0] = SW[17:8];


 PWM_core run0( 
 .reset(KEY[1]),
 .clk(mil),
 .switch_in(sw_duty),
 .period(sw_period),
 .compare_result(4'b1111),
 .out(LEDG[8])
);

 clock_divider clock0(
	CLOCK_50,
	s,		//Seconds
	t,		//Tenths of seconds
	h,		//Hundredths of seconds
	mil		//milliseconds
	);

endmodule