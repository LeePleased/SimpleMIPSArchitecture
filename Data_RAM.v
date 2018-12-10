`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/9
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	Data_RAM.v
 * FileType:	source
 * LastModify:	18/11/9
 */


// 数据内存, 下降沿更新.
module Data_RAM(
		i_addr, i_data, o_data, clk, w_enable
    );  

	parameter ADDRESS_SIZE = 32;
	parameter DATA_SIZE = 32;
	parameter TOTAL_RAM_SIZE = 256;

	input wire [ADDRESS_SIZE-1:0] i_addr;		// 输入地址信号.
	input wire [DATA_SIZE-1:0] i_data;			// 输入数据信号.
	input wire clk, w_enable;					// 时钟, 写使能信号.

	output wire [DATA_SIZE-1:0] o_data;			// 输出数据信号.

	reg [DATA_SIZE-1:0] memory [TOTAL_RAM_SIZE-1:0];
	integer i;
	initial begin 
		for (i = 0; i < TOTAL_RAM_SIZE; i = i + 1) begin 
			memory[i] = 0;
		end

		$readmemb("data_ram.txt", memory);
	end

	// 下降沿更新数据内存存储器.
	always @(negedge clk) begin
		if (w_enable) begin 
			memory[i_addr] = i_data;
		end
	end

	assign o_data = memory[i_addr];

endmodule
