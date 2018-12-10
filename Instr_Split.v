`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/9
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	Instr_Split.v
 * FileType:	source
 * LastModify:	18/11/9
 */


// 解析命令, 将指令拆解, 组合逻辑.
module Instr_Split(
		i_instr, o_code, o_ri, o_rj, o_rk, o_func, imme_2, imme_0
    );

	parameter INSTRUCT_SIZE = 32;
	parameter CODE_INDEX_SIZE = 6;
	parameter REGISTER_INDEX_SIZE = 5;
	parameter FUNC_INDEX_SIZE = 11;
	parameter IMME_2_SIZE = 16;
	parameter IMME_0_SIZE = 26;

	input wire [INSTRUCT_SIZE-1:0] i_instr;			// 输入的指令.
	output wire [CODE_INDEX_SIZE-1:0] o_code;		// 指令类型 i_code 字段.
	output wire [REGISTER_INDEX_SIZE-1:0] o_ri;		// 寄存器 Ri 字段.
	output wire [REGISTER_INDEX_SIZE-1:0] o_rj;		// 寄存器 Rj 字段.
	output wire [REGISTER_INDEX_SIZE-1:0] o_rk;		// 寄存器 Rk 字段.
	output wire [FUNC_INDEX_SIZE-1:0] o_func;		// 运算类型 i_func 字段.
	output wire [IMME_2_SIZE-1:0] imme_2;			// 2 寄存器类型指令的立即数.
	output wire [IMME_0_SIZE-1:0] imme_0;			// 无寄存器类型指令的立即数.

	assign o_code = i_instr[31:26];
	assign o_ri = i_instr[25:21];
	assign o_rj = i_instr[20:16];
	assign o_rk = i_instr[15:11];
	assign o_func = i_instr[10:0];
	assign imme_2 = i_instr[15:0];
	assign imme_0 = i_instr[25:0];

endmodule
