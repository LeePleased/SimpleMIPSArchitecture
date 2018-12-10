`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/9
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	Instr_ROM.v
 * FileType:	source
 * LastModify:	18/11/9
 */


// 指令内存模块, 只读, 组合逻辑, 预先文件读入.
module Instr_ROM(
		i_addr, o_instr
    );
	
	parameter CONTENT_SIZE = 16;
	parameter INSTRUCT_SIZE = 32;
	parameter TOTAL_ROM_SIZE = 256;

	input wire [CONTENT_SIZE-1:0] i_addr;		// 读入指令的地址.
	output wire [INSTRUCT_SIZE-1:0] o_instr;	// 对应读出的指令.

	integer i;									// 将内存初始化为 0.

	// 指令存储器, 预先读入指令数据.
	reg [INSTRUCT_SIZE-1:0] rom_mem [TOTAL_ROM_SIZE-1:0];

	// 指令内存读入预准备文件的内容: 
	// 
	// 			指令内容						指令编码
	// 
	//		LOAD $0, $1, 0		000010 00000 00001 0000000000000000
	//		LOAD $1, $2, 1		000010 00001 00010 0000000000000001
	//		ADD $2, $0, $1		000001 00010 00000 00001 00000000000

	initial begin
		for (i = 0; i < TOTAL_ROM_SIZE; i = i + 1) begin
			rom_mem[i] = 0;
		end
		$readmemb("Instr_rom.txt", rom_mem);	// 从文件读入指令.
	end

	assign o_instr = rom_mem[i_addr];

endmodule
