`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/10
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	ALU.v
 * FileType:	source
 * LastModify:	18/11/10
 */

`define ADD 0;
`define SUB 1;
`define AND 2;
`define OR  3;
`define XOR 4;
`define SLT 5;		// Ri <- (Rj < Rk).


// 运算逻辑单元, 组合逻辑.
module ALU(
		i_a, i_b, i_func, out, zero
    );

	parameter DATA_SIZE = 32;
	parameter FUNC_SIZE = 11;

	input wire [DATA_SIZE-1:0] i_a, i_b;		// 定义两个操作数.
	input wire [FUNC_SIZE-1:0] i_func;			// 定义运算操作码.

	output wire [DATA_SIZE-1:0] out;			// 定义运算输出.
	output wire zero;							// 定义零标志状态位.

	assign out = i_func == 0 ? i_a + i_b :
				 i_func == 1 ? i_a - i_b :
				 i_func == 2 ? i_a & i_b :
				 i_func == 3 ? i_a | i_b :
				 i_func == 4 ? (~i_a & i_b) | (i_a & ~i_b) :
				 i_func == 5 ? i_a < i_b :
				 0;

	assign zero = (out == 0);

endmodule
