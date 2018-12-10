`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/10
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	test_MUX_3_1.v
 * FileType:	simulate
 * LastModify:	18/11/10
 */

module test_MUX_3_1;

	reg [31:0] i_a, i_b, i_c;				// 定义输入管脚.
	reg [1:0] sel;

	wire [31:0] out;						// 定义输出管脚.

	MUX_3_1 uut (
		.i_a(i_a), .i_b(i_b), .i_c(i_c), 
		.sel(sel), .out(out)
	);

	initial begin
		i_a = 32'd128;
		i_b = 32'd55559;
		i_c = 32'd7773;

		sel = 2'd0;			// 测试样例 1, 检查打印 i_a.
		#40;
        
        sel = 2'd1;			// 测试样例 2, 检查打印 i_b.
        #40;

        sel = 2'd2;			// 测试样例 3, 检查打印 i_c.
        #40;
        sel = 2'd3;
        #40;

        $finish;
	end

	initial begin 
		$monitor($time, , , "i_a: %d, i_b: %d, i_c: %d, sel: %b | out: %d;",
				i_a, i_b, i_c, sel, out);
	end	
      
endmodule

