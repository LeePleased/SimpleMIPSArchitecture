`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/10
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	Ctrl_Unit.v
 * FileType:	source
 * LastModify:	18/11/10
 */

`define NOP  6'b000000				// 不需要作任何事.
`define ALU  6'b000001				// 算数逻辑运算.
`define LW   6'b000010				// 从数据内存中加载.
`define SW   6'b000011 				// 将字载入数据内存.
`define BEQ  6'b000100 				// 等号条件跳转.
`define JUMP 6'b000101 				// 无条件跳转指令.


// 程序控制单元, 向其它模块提供控制信号.
module Ctrl_Unit(
		i_code, zero, pc_sel, ext_sel, reg_i_w_enable, 
		reg_k_sel, reg_i_sel, alu_k_sel, ram_w_enable, func_sel
    );

	parameter CODE_SIZE = 6;

	input wire [CODE_SIZE-1:0] i_code;									// 输入指令的类型.
	input wire zero;													// 输入零状态标志位.

	output wire pc_sel, ext_sel, reg_i_w_enable, reg_k_sel;				// 定义输出控制信号.
	output wire reg_i_sel, alu_k_sel, ram_w_enable;
	output wire[1:0] func_sel;

	// pc_sel: PC 单元控制信号, 为 1 时选择 imme, 立即数.
	assign pc_sel = i_code == `JUMP ? 1 :
					i_code == `BEQ && zero == 1 ? 1 :
					0;

	// ext_sel: 经拓展符号后立即数的选择信号, 为 1 时选择 26 位, 否则 16 位.
	assign ext_sel = i_code == `JUMP ? 1 :
					 0;

	// reg_w_enable: 寄存器文件输入 Ri 所指向的地址是否可写.
	assign reg_i_w_enable = i_code == `ALU ? 1:
							i_code == `LW ? 1 :
							0;

	// reg_i_sel: 寄存器文件输入 Ri 的选择信号, 为 1 时选择 alu, 否则选 mem.
	assign reg_i_sel = i_code == `ALU ? 1:
					   i_code == `LW ? 0:
					   0;

	// alu_k_sel: ALU 模块 reg_k 输入部分的选择信号, 为 1 时选择 imme.
	assign alu_k_sel = i_code == `LW ? 1:
					   i_code == `SW ? 1:
					   i_code == `ALU ? 0:
					   i_code == `BEQ ? 0: // BEQ 需要 Rk-Ri, 不能用 immw 替代.
					   0;

	// reg_k_sel: 用 BEQ 或 SW 指令时, 应该用 ri 代替 rk 作为减法操作数, 信号为 1.
	assign reg_k_sel = i_code == `BEQ ? 1:
					   i_code == `SW ? 1:
					   0;

	// ram_w_enable: 数据内存中 data_addr 指向的地址是否可写, 为 1 表示可写.
	assign ram_w_enable = i_code == `SW ? 1:
						  0;

	// 指示 ALU 模块进行算数逻辑的种类, 0 表示不变, BEQ 表示减法, 其余都是加法.
	assign func_sel = i_code == `ALU ? 2'b00:
					  i_code == `BEQ ? 2'b11:
					  2'b01;

endmodule
