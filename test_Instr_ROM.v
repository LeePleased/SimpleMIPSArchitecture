`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/9
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	test_Instr_ROM.v
 * FileType:	simulate
 * LastModify:	18/11/9
 */


module test_Instr_ROM;

	reg [15:0] i_addr;		// 定义输入输出管脚.
	wire [31:0] o_instr;

	Instr_ROM #(16, 32) uut (
		.i_addr(i_addr),  .o_instr(o_instr)
	);

	integer i;

	initial begin
		for (i = 0; i <= 16'd6; i = i + 1) begin
			i_addr = i;
			#40;
		end

		$finish;
	end

	initial begin 
		$monitor($time, , , "i_addr: %d: o_instr: %b;", i_addr, o_instr);
	end
      
endmodule
