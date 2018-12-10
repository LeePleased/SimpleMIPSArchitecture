`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/9
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	Prog_Cnt.v
 * FileType:	source
 * LastModify:	18/11/10
 */


// 程序控制器, 上升沿更新输出地址.
module Prog_Cnt(
		imme, o_addr, sel, clk
    );
	
	parameter CONTENT_SIZE = 16;
	parameter IMME_SIZE = 32;

	input wire [IMME_SIZE-1:0] imme;		// 解码得到的立即数.
	input wire sel, clk;					// 控制信号, 时钟.

	output reg [CONTENT_SIZE-1:0] o_addr;	// 当前指令的地址.

	initial begin 
		o_addr = 0;
	end

	// 当 sel=1 时使用 Imme 作为下一步指令
	// 的地址, 否则 PC+1, 顺序执行.
	always @(posedge clk) begin 
		if (sel) begin
			o_addr = imme[CONTENT_SIZE-1:0];
		end else begin 
			o_addr = o_addr + 1;
		end
	end

endmodule
