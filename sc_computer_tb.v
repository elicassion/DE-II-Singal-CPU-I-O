`timescale 1 ns/ 100 ps
module sc_computer_tb;
// constants                                           
// general purpose registers
// test vector input registers
reg clock;
reg mem_clk;
reg resetn;
// wires                                               
wire [31:0]  aluout;
wire dmem_clk;
wire imem_clk;
wire [31:0]  inst;
wire [31:0]  memout;
wire [31:0]  pc;
wire [31:0]  in_port0, in_port1, in_port2, in_port3;
wire [31:0]  out_port0, out_port1, out_port2, out_port3;
assign in_port0 = 8'h22222222;
assign in_port1 = 8'h55555555;
assign in_port2 = 8'h88888888;
assign in_port3 = 8'hffffffff;
initial                                                
begin
	#0 clock = 0;
	#0 resetn = 0;
	#0 mem_clk = 1;
	#5 resetn = 1;
	$display("Running testbench");
end
always #10 clock = ~clock;
always #5 mem_clk = ~mem_clk;
sc_computer i1 (
		.aluout(aluout),
		.clock(clock),
		.dmem_clk(dmem_clk),
		.imem_clk(imem_clk),
		.inst(inst),
		.mem_clk(mem_clk),
		.memout(memout),
		.pc(pc),
		.resetn(resetn),
		.in_port0(in_port0),  .in_port1(in_port1),  .in_port2(in_port2),  .in_port3(in_port3), 
		.out_port0(out_port0), .out_port1(out_port1), .out_port2(out_port2), .out_port3(out_port3)
	);                               
endmodule

