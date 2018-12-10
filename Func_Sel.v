`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/11
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	Func_Sel.v
 * FileType:	source
 * LastModify:	18/11/11
 */

`define CALCU 2'b00
`define LOAD  2'b01
`define SAVE  2'b10
`define BEQ_  2'b11


module Func_Sel(
		func, sel, out
    );

	parameter FUNC_SIZE = 11;

	input wire [10:0] func;		// 定义输入信号.
	input wire [1:0] sel;

	output wire [10:0] out;		// 定义输出信号.

	assign out = sel == `CALCU ? func :
		         sel == `BEQ_ ? 11'd1:
		         11'd0;

endmodule
