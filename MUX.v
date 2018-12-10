`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/10
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	MUX.v
 * FileType:	source
 * LastModify:	18/11/10
 */


// 多路选择器: 2 选 1.
module MUX_2_1(
		i_a, i_b, sel, out
    );

	parameter DATA_SIZE = 32;

	input wire [DATA_SIZE-1:0] i_a;			// 定义 2 个输入信号.
	input wire [DATA_SIZE-1:0] i_b;
	input wire sel;							// 定义多路选择信号.

	output wire [DATA_SIZE-1:0] out;		// 定义输出信号.

	assign out = sel == 1'b0 ? i_a : i_b;

endmodule


// 多路选择器: 3 选 1.
module MUX_3_1(
		i_a, i_b, i_c, sel, out
	);

	parameter DATA_SIZE = 32;

	input wire [DATA_SIZE-1:0] i_a;
	input wire [DATA_SIZE-1:0] i_b;
	input wire [DATA_SIZE-1:0] i_c;
	input wire [1:0] sel;

	output wire [DATA_SIZE-1:0] out;

	assign out = sel == 2'b00 ? i_a :
				 sel == 2'b01 ? i_b :
				 i_c;						// sel=2 或 sel=3 都输出 i_c.

endmodule
