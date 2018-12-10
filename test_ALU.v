`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/10
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	test_ALU.v
 * FileType:	simulate
 * LastModify:	18/11/10
 */

module test_ALU;

	reg [31:0] i_a, i_b;			// 定义输入管脚.
	reg [10:0] i_func;

	wire [31:0] out;				// 定义输出管脚.
	wire zero;

	AL_Unit uut (
		.i_a(i_a), .i_b(i_b), .i_func(i_func), 
		.out(out), .zero(zero)
	);

	integer i;

	initial begin
		i_a = 32'hfffffff3;
		i_b = 32'd2;
	
		for (i = 11'd0; i <= 11'd6; i = i + 1) begin 
			i_func = i;
			#40;
		end

		$finish;
	end

	initial begin 
		$monitor($time, , , "i_a: %x, i_b: %x, func: %d | out: %x, zero: %b;",
				 i_a, i_b, i_func, out, zero);
	end
      
endmodule

