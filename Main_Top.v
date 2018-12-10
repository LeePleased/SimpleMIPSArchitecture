`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/9
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	Main_Top.v
 * FileType:	source
 * LastModify:	18/11/11
 */

`include "AL_Unit.v"
`include "Ctrl_Unit.v"
`include "Instr_ROM.v"
`include "Data_RAM.v"
`include "Instr_Split.v"
`include "MUX.v"
`include "Prog_Cnt.v"
`include "Reg_File.v"
`include "Sign_Ext.v"
`include "Func_Sel.v"


module Main_Top(
		clk, _pc_addr_, _i_code_, _ri_, _rj_, _rk_, _imme_, _o_func_,
		_o_reg_j_, _o_reg_k_, _o_alu_, _o_mem_, _zero_
    );

	input wire clk;			// 唯一的输入, 方波时钟信号.

	// 定义输出信号, 用于观察 MIPS 内部的情况.
	output wire [31:0] _imme_, _o_reg_j_, _o_reg_k_;
	output wire [31:0] _o_alu_, _o_mem_;
	output wire [15:0] _pc_addr_;
	output wire [10:0] _o_func_;
	output wire [5:0] _i_code_;
	output wire [4:0] _ri_, _rj_, _rk_;
	output wire _zero_;

	// 内部管脚总线, 将各个模块连接在一起.
	wire [31:0] imme, instr, e_imme_2, e_imme_0, i_reg_data;
	wire [31:0] o_reg_j, o_reg_k, alu_b, o_alu, o_mem;
	wire [25:0] imme_0;
	wire [15:0] pc_addr, imme_2;
	wire [10:0] i_func, o_func;
	wire [5:0] i_code;
	wire [4:0] ri, rj, rk, i_rk;
	wire [1:0] func_sel;
	wire pc_sel, imme_sel, rk_sel, reg_w_enable, alu_b_sel;
	wire zero, mem_w_enable, reg_i_sel;

	assign _imme_ = imme;
	assign _o_reg_j_ = o_reg_j;
	assign _o_reg_k_ = o_reg_k;
	assign _o_alu_ = o_alu;
	assign _o_mem_ = o_mem;
	assign _pc_addr_ = pc_addr;
	assign _o_func_ = o_func;
	assign _i_code_ = i_code;
	assign _ri_ = ri;
	assign _rj_ = rj;
	assign _rk_ = rk;
	assign _zero_ = zero;

	// 下面是 MIPS 的控制模块, 输出控制信号.
	Ctrl_Unit CU (
		.i_code(i_code), .zero(zero), .pc_sel(pc_sel), .ext_sel(imme_sel),
		.reg_i_w_enable(reg_w_enable), .reg_k_sel(rk_sel), .reg_i_sel(reg_i_sel),
		.alu_k_sel(alu_b_sel), .ram_w_enable(mem_w_enable), .func_sel(func_sel)
	);

	// 下面是 MIPS 下辖的各个执行模块.
	Prog_Cnt PC (
		.imme(imme), .o_addr(pc_addr),
		.sel(pc_sel), .clk(clk)
	);
	Instr_ROM IR (
		.i_addr(pc_addr), .o_instr(instr)
	);
	Instr_Split IS (
		.i_instr(instr), .o_code(i_code), .o_ri(ri), .o_rj(rj),
		.o_rk(rk), .o_func(i_func), .imme_0(imme_0), .imme_2(imme_2)
	);
	Sign_Ext #(26) SE_0 (
		.imme(imme_0), .out(e_imme_0)
	);
	Sign_Ext SE_2 (
		.imme(imme_2), .out(e_imme_2)
	);
	MUX_2_1 MUX_IMME (
		.i_a(e_imme_2), .i_b(e_imme_0), 
		.sel(imme_sel), .out(imme)
	);
	MUX_2_1 #(5) MUX_RK (
		.i_a(rk), .i_b(ri), .sel(rk_sel), .out(i_rk)
	);
	Reg_File RF (
		.reg_i(ri), .reg_j(rj), .reg_k(i_rk), .clk(clk),
		.i_data(i_reg_data), .w_enable(reg_w_enable),
		.o_data_j(o_reg_j), .o_data_k(o_reg_k)
	);
	MUX_2_1 MUX_ALU_B (
		.i_a(o_reg_k), .i_b(imme), 
		.sel(alu_b_sel), .out(alu_b)
	);
	Func_Sel FS (
		.func(i_func), .sel(func_sel), .out(o_func)
	);
	AL_Unit ALU (
		.i_a(o_reg_j), .i_b(alu_b), .zero(zero),
		.i_func(o_func), .out(o_alu)
	);
	Data_RAM DR (
		.i_addr(o_alu), .i_data(o_reg_k), .clk(clk),
		.o_data(o_mem), .w_enable(mem_w_enable)
	);
	MUX_2_1 MUX_RI (
		.i_a(o_mem), .i_b(o_alu), 
		.sel(reg_i_sel), .out(i_reg_data)
	);

endmodule
