module sc_computer(
	input  wire resetn,
	input  wire clock,
	//input  wire mem_clk,
	input  wire [17:0] sw,
	output wire [6:0] out_dig0_h,
	output wire [6:0] out_dig0_l,
	output wire [6:0] out_dig1_h,
	output wire [6:0] out_dig1_l,
	output wire [6:0] out_dig2_h,
	output wire [6:0] out_dig2_l,
	output wire [6:0] out_dig3_h,
	output wire [6:0] out_dig3_l
	);
	
	wire [31:0] out_port0, out_port1, out_port2, out_port3;
	wire [31:0] in_port0, in_port1, in_port2, in_port3;
	wire [3:0]  out_0_h;
	wire [3:0]  out_0_l;
	wire [3:0]  out_1_h;
	wire [3:0]  out_1_l;
	wire [3:0]  out_2_h;
	wire [3:0]  out_2_l;
	wire [3:0]  out_3_h;
	wire [3:0]  out_3_l;
	
	reg  clock_div;
	always @(posedge clock)
	begin
		clock_div = ~clock_div;
	end
	
	bin_to_dec BTD0 (out_port0, out_0_h, out_0_l);
	bin_to_dec BTD1 (out_port1, out_1_h, out_1_l);
	bin_to_dec BTD2 (out_port2, out_2_h, out_2_l);
	bin_to_dec BTD3 (out_port3, out_3_h, out_3_l);

	one_digit D0h  (out_0_h, out_dig0_h);
	one_digit D0l  (out_0_l, out_dig0_l);
	one_digit D1h  (out_1_h, out_dig1_h);
	one_digit D1l  (out_1_l, out_dig1_l);
	one_digit D2h  (out_2_h, out_dig2_h);
	one_digit D2l  (out_2_l, out_dig2_l);
	one_digit D3h  (out_3_h, out_dig3_h);
	one_digit D3l  (out_3_l, out_dig3_l);
	
	assign in_port0 = {27'b0, sw[17:13]};
	assign in_port1 = {27'b0, sw[12:8]};
	assign in_port2 = {27'b0, sw[7:3]};
	assign in_port3 = {29'b0, sw[2:0]};
	
	sc_computer_entity sce(resetn,clock_div,clock,
							in_port0,  in_port1,  in_port2,  in_port3, 
							out_port0, out_port1, out_port2, out_port3);
endmodule 