`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/9
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	tet_P_C.v
 * FileType:	simulate
 * LastModify:	18/11/9
 */


module test_P_C;

	reg clk, rst, enable;			// 定义输入管脚.
	reg [15:0] i_pc;

	wire [15:0] o_pc;				// 定义输出管脚.

	P_C #(16) uut (
		.clk(clk), .rst(rst), .enable(enable), 
		.i_pc(i_pc), .o_pc(o_pc)
	);

	always #40 clk= ~clk;			// 模拟时钟信号.

	initial begin
		clk = 1'b0;
		rst = 1'b1;

		enable = 1'b1;				// 测试样例 1, 检查是否复位.
		i_pc = 16'hffff;
		#100;
        
        rst = 1'b0;					// 测试样例 2, 检查是否能输入输出.
        #100;

        enable = 1'b0;				// 测试样例 3, 检查是否使能屏蔽.
        i_pc = 16'hff33;
        #100;

        rst = 1'b1;					// 测试样例 4, 检查是否复位.
        #100;

        $finish;
	end

	initial begin 
		$monitor($time, , , "enable: %b, rst: %b, i_pc: %x, o_pc: %x.",
				 enable, rst, i_pc, o_pc);
	end
      
endmodule

