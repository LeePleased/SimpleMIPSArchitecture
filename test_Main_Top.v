`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/9
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	test_Main_Top.v
 * FileType:	simulate
 * LastModify:	18/11/11
 */

`define TIME_SCALE 20
`define NUM_COMMAND 3 + 1
`define RESIDUAL_TIME 1


module test_Main_Top;

	reg clk;	// 输入时钟信号.

	// 输出 MIPS 的状态信号.
	wire [15:0] _pc_addr_;
	wire [10:0] _o_func_;
	wire [5:0] _i_code_;
	wire [4:0] _ri_, _rj_, _rk_;
	wire [31:0] _imme_, _o_reg_j_, _o_reg_k_;
	wire [31:0] _o_alu_, _o_mem_;
	wire _zero_;

	// Instantiate the Unit Under Test (UUT)
	Main_Top uut (
		.clk(clk), ._pc_addr_(_pc_addr_), ._i_code_(_i_code_), 
		._ri_(_ri_), ._rj_(_rj_), ._rk_(_rk_), ._imme_(_imme_), 
		._o_func_(_o_func_), ._o_reg_j_(_o_reg_j_), ._o_reg_k_(_o_reg_k_), 
		._o_alu_(_o_alu_), ._o_mem_(_o_mem_), ._zero_(_zero_)
	);

	always #(`TIME_SCALE/2) clk = ~clk;

	initial begin
		clk = 0;
		#((`NUM_COMMAND)*`TIME_SCALE - `RESIDUAL_TIME);

		$finish;
	end
      
endmodule
