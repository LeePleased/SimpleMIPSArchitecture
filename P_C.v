`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/9
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	P_C.v
 * FileType:	source
 * LastModify:	18/11/9
 */


// P_C 程序计数器模块, 时序逻辑.
module P_C(
		clk, rst, enable,
		i_pc, o_pc
    );

	parameter CONTENT_SIZE = 16;

	input wire clk, rst, enable;			// 时钟信号, 复位信号, 读指令的使能信号.
	input wire [CONTENT_SIZE-1:0] i_pc;		// 输入下一条指令.

	output [CONTENT_SIZE-1:0] o_pc;			// 输出下一条指令.
	reg [CONTENT_SIZE-1:0] o_pc;

	always @(posedge clk) begin 			// 上升沿更新 P_C 的输出.
		if (rst) begin						// 当复位为 1 时将 P_C 指向 0.
			o_pc = 0;
		end else if (enable) begin 			// 只有使能端为 1 时才更新 P_C.
			o_pc = i_pc;
		end else begin 
			o_pc = o_pc;
		end
	end

endmodule
