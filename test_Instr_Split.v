`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/9
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	test_Instr_Split.v
 * FileType:	simulate
 * LastModify:	18/11/9
 */

module test_Instr_Split;

	reg [31:0] i_instr;				// 定义输入管脚.

	wire [5:0] o_code;				// 定义输出管脚.
	wire [4:0] o_ri, o_rj, o_rk;
	wire [10:0] o_func;
	wire [15:0] imme_2;
	wire [25:0] imme_0;

	Instr_Split uut (
		.i_instr(i_instr), .o_code(o_code), .o_ri(o_ri), 
		.o_rj(o_rj), .o_rk(o_rk), .o_func(o_func), 
		.imme_2(imme_2), .imme_0(imme_0)
	);

	initial begin
		i_instr = 32'b00110011001100110011001100110011;
		#40;

		i_instr = 32'b00101011011100111011000100100011;
		#40;

		i_instr = 32'b00101111011100111111000100111011;
		#40;
	end

	initial begin 
		$monitor($time, , , "i_instr: %b | o_code: %b, o_ri: %b, o_rj: %b, o_rk: %b, o_func: %b, imme_2: %b, imme_0: %b;",
				 i_instr, o_code, o_ri, o_rj, o_rk, o_func, imme_2, imme_0);
	end
      
endmodule

