/////////////////////////////////////////////////////////////
//                                                         //
// School of Software of SJTU                              //
//                                                         //
/////////////////////////////////////////////////////////////

// module sc_computer (resetn,clock,mem_clk,pc,inst,aluout,memout,imem_clk,dmem_clk,
// 							in_port0,  in_port1,  in_port2,  in_port3, 
// 							out_port0, out_port1, out_port2, out_port3);
   
//    input resetn,clock,mem_clk;
// 	input  [31:0] in_port0,  in_port1,  in_port2,  in_port3;
//    output [31:0] pc, inst, aluout, memout;
// 	output [31:0] out_port0, out_port1, out_port2, out_port3;
//    output        imem_clk,dmem_clk;
// 	///////////////////////////////////////////////////////////////////////////////////////////////
//    wire   [31:0] data;
//    wire          wmem; // all these "wire"s are used to connect or interface the cpu,dmem,imem and so on.
   
//    sc_cpu cpu (clock,resetn,inst,memout,pc,wmem,aluout,data);          // CPU module.
//    sc_instmem  imem (pc,inst,clock,mem_clk,imem_clk);                  // instruction memory.
//    sc_datamem  dmem (aluout, data, memout, wmem, 
// 							clock, mem_clk, dmem_clk, resetn,
// 							in_port0,  in_port1,  in_port2,  in_port3, 
// 							out_port0, out_port1, out_port2, out_port3); 	  // data memory.

// endmodule

module sc_computer_entity (resetn,clock,mem_clk,
							in_port0,  in_port1,  in_port2,  in_port3, 
							out_port0, out_port1, out_port2, out_port3);
   
	input resetn,clock,mem_clk;
	input  [31:0] in_port0,  in_port1,  in_port2,  in_port3;
	output [31:0] out_port0, out_port1, out_port2, out_port3;
	///////////////////////////////////////////////////////////////////////////////////////////////
   wire   [31:0] pc, inst, aluout, memout;
   wire          imem_clk, dmem_clk;
   wire   [31:0] data;
   wire          wmem; // all these "wire"s are used to connect or interface the cpu,dmem,imem and so on.
   
   sc_cpu cpu (clock,resetn,inst,memout,pc,wmem,aluout,data);          // CPU module.
   sc_instmem  imem (pc,inst,clock,mem_clk,imem_clk);                  // instruction memory.
   sc_datamem  dmem (aluout, data, memout, wmem, 
							clock, mem_clk, dmem_clk, resetn,
							in_port0,  in_port1,  in_port2,  in_port3, 
							out_port0, out_port1, out_port2, out_port3); 	  // data memory.

endmodule



