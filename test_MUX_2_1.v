`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/10
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	test_MUX_2_1.v
 * FileType:	simulate
 * LastModify:	18/11/10
 */

module test_MUX_2_1;

	reg [31:0] i_a, i_b;
	reg sel;

	wire [31:0] out;

	MUX_2_1 uut (
		.i_a(i_a), .i_b(i_b), .sel(sel), .out(out)
	);

	initial begin
		i_a = 32'd59;
		i_b = 32'd133;

		sel = 1'b0;			// 测试样例 1.
		#40;
        
		sel = 1'b1;			// 测试样例 2.
		#40;

		$finish;
	end

	initial begin 
		$monitor($time, , , "i_a: %d, i_b: %d, sel: %b | out: %d;",
				 i_a, i_b, sel, out);
	end
      
endmodule

