`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/10
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	Reg_File.v
 * FileType:	source
 * LastModify:	18/11/10
 */


// 寄存器文件, 读寄存器文件是组合逻
// 辑, 写寄存器是时序逻辑, 下降沿有效.
module Reg_File (
		reg_i, reg_j, reg_k, clk, i_data, w_enable,
		o_data_j, o_data_k
    );

    parameter REGISTER_INDEX_SIZE = 5;
    parameter DATA_SIZE = 32;
    parameter TOTAL_REGISTER_NUM = 32;

    input wire [REGISTER_INDEX_SIZE-1:0] reg_i, reg_j, reg_k;	// 三个寄存器编号.
    input wire [DATA_SIZE-1:0] i_data;
    input wire clk, w_enable;									// 时钟信号, 写使能信号.

    output wire [DATA_SIZE-1:0] o_data_j, o_data_k;				// 两个读出数据信号.

    reg [DATA_SIZE-1:0] register [TOTAL_REGISTER_NUM-1:0];		// 全部寄存器文件.

    // 将寄存器全部初始化为 0.
    integer i;
    initial begin 
    	for (i = 0; i < TOTAL_REGISTER_NUM; i = i + 1) begin
    		register[i] = 0;
    	end
    end

    assign o_data_j = register[reg_j];
    assign o_data_k = register[reg_k];

    // 时钟下降沿更新寄存器文件.
    always @(negedge clk) begin
    	if (w_enable) begin 
    		register[reg_i] = i_data;
    	end
    end

endmodule
