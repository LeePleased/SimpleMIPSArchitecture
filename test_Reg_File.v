`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/10
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	test_Reg_File.v
 * FileType:	simulate
 * LastModify:	18/11/10
 */


module test_Reg_File;

	reg [4:0] reg_i, reg_j, reg_k;		// 声明输入管脚.
	reg [31:0] i_data;
	reg clk, w_enable;

	wire [31:0] o_data_j, o_data_k;		// 声明输出管脚.

	Reg_File uut (
		.reg_i(reg_i), .reg_j(reg_j), .reg_k(reg_k), 
		.clk(clk), .i_data(i_data), .w_enable(w_enable), 
		.o_data_j(o_data_j), .o_data_k(o_data_k)
	);

	always #40 clk = ~clk;				// 产生时钟方波信号.

	initial begin
		clk = 1;
		w_enable = 0;

		reg_i = 0;						// 测试样例 1.
		reg_j = 1;
		reg_k = 2;
		i_data = 32'd781;
		#100;

		w_enable = 1;					// 测试样例 2.
		reg_i = 2;
		#100;

		$finish;
	end
      
endmodule

