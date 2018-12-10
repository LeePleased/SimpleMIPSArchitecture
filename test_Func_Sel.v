`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/11
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	test_Func_Sel.v
 * FileType:	simulate
 * LastModify:	18/11/11
 */


module test_Func_Sel;

	reg [10:0] func;
	reg [1:0] sel;

	wire [10:0] out;

	Func_Sel uut (
		.func(func), .sel(sel), .out(out)
	);

	initial begin
		func = 11'd5;

		sel = 2'd0;		// 测试样例 1.
		#40;
        
		sel = 2'd1;		// 测试样例 2.
		#40;

		sel = 2'd2;		// 测试样例 3.
		#40;

		sel = 2'd3;		// 测试样例 4.
		#40;

		$finish;
	end
      
endmodule

