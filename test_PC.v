`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/9
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	test_Prog_Cnt.v
 * FileType:	simulate
 * LastModify:	18/11/10
 */


module test_PC;

	// Inputs
	reg [31:0] imme;			// 定义输入, 输出管脚.
	reg sel, clk;

	wire [15:0] o_addr;			// 输出管脚用 wire 绑定.

	Prog_Cnt uut (
		.imme(imme), .o_addr(o_addr), 
		.sel(sel), .clk(clk)
	);

	always #40 clk = ~clk;		// 产生时间方波信号.

	initial begin
		clk = 0;

		sel = 0;				// 测试样例 1.
		#100;
        
        imme = 32'd56;			// 测试样例 2.
		#100;

		imme = 32'd123;	
		sel = 1;				// 测试样例 3.
		#100;

		$finish;
	end

	initial begin 
		$monitor($time, , , "imme: %b, sel: %b | o_addr: %b;",
			     imme, sel, o_addr);
	end
      
endmodule
