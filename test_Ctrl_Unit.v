`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/10
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	test_Ctrl_Unit.v
 * FileType:	simulate
 * LastModify:	18/11/10
 */


module test_Ctrl_Unit;

	reg [5:0] i_code;		// 定义输入信号.
	reg zero;

	wire pc_sel, ext_sel, reg_i_w_enable, reg_k_sel;
	wire reg_i_sel, alu_k_sel, ram_w_enable;
	wire [1:0] func_sel;

	Ctrl_Unit uut (
		.i_code(i_code), .zero(zero), .pc_sel(pc_sel), 
		.ext_sel(ext_sel), .reg_i_w_enable(reg_i_w_enable), 
		.reg_k_sel(reg_k_sel), .reg_i_sel(reg_i_sel), 
		.alu_k_sel(alu_k_sel), .ram_w_enable(ram_w_enable),
		.func_sel(func_sel)
	);

	initial begin
		zero = 0;				// 测试指令类 ALU.
		i_code = 6'b000001;
		#40;

		i_code = 6'b000010;		// 测试指令类 LW.
		#40;

		i_code = 6'b000011;		// 测试指令类 SW.
		#40;

		i_code = 6'b000100;		// 测试指令类 BEQ.
		#40;

		zero = 1;
		#40;

		i_code = 6'b000101;		// 测试指令类 JUMP.
		#40;

		i_code = 6'd0;
		#40;

		$finish;
	end

	initial begin 
		$monitor($time, , , "i_code: %b, zero: %b | pc_sel: %b, ext_sel: %b, reg_i_w_enable: %b, reg_k_sel: %b, reg_i_sel: %b, alu_k_sel: %b, ram_w_enable: %b, func_sel: %b;", 
			     i_code, zero, pc_sel, ext_sel, reg_i_w_enable, reg_k_sel, reg_i_sel, alu_k_sel, ram_w_enable, func_sel);
	end
      
endmodule

