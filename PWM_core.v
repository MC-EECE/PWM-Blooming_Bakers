module PWM_core #(parameter n = 10, parameter m = 4)( 
input reset, clk,
input [n-2:0] switch_in,
input [n-1:0] period,
input [m-1:0] compare_result,
 output reg out
);


reg [n-2:0] duty_cycle, counter;


always@(posedge clk or negedge reset)
begin
	
	
   if(~reset) 
   begin
		counter <= 32'b1; 
		duty_cycle <= 32'b0;
	end
	
	else if(counter == period)
	begin
		counter <= 32'b1;
	end
	
	else 
	begin
		counter <= counter + 1'b1;
		if(compare_result[0]) duty_cycle[7:0] <= switch_in[7:0];
		//if(compare_result[1]) duty_cycle[15:8] <= switch_in[15:8];
		//if(compare_result[2]) duty_cycle[23:16] <= switch_in[23:16];
		//if(compare_result[3]) duty_cycle[31:24] <= switch_in[31:24];
	end
	
end 


always@(posedge clk)
begin
	if(counter <= duty_cycle)
		out = 1'b1;
	
	else 
		out = 1'b0;
		
end
endmodule