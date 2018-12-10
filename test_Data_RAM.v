`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/9
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	test_Data_RAM.v
 * FileType:	simulate
 * LastModify:	18/11/9
 */


module test_Data_RAM;

	reg [31:0] i_addr, i_data;		// 定义输入管脚.
	reg clk, w_enable;

	wire [31:0] o_data;				// 定义输出管脚.

	Data_RAM uut (
		.i_addr(i_addr), .i_data(i_data), .o_data(o_data), 
		.clk(clk), .w_enable(w_enable)
	);

	always #40 clk = ~clk;

	initial begin
		clk = 0;

		i_addr = 32'd0;				// 测试样例 1, 检查是否能读.
		w_enable = 1'b0;
		#100;

		i_addr = 32'd1;				// 测试样例 2, 检查是否能读.
		w_enable = 1'b0;
		#100;

		i_addr = 32'd2;				// 测试样例 3, 检查是否能读.
		w_enable = 1'b0;
		#100;

		i_addr = 32'd53;			// 测试样例 2, 检查是否能写.
		i_data = 32'd127;
		w_enable = 1'b1;	
		#100;		

		$finish;
	end
      
endmodule

