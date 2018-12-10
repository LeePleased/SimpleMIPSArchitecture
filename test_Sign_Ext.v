`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/9
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	test_Sign_Extend.v
 * FileType:	simulate
 * LastModify:	18/11/10
 */


module test_Sign_Extend;

	reg [15:0] imme;
	wire [31:0] out;

	Sign_Ext uut (
		.imme(imme), .out(out)
	);

	initial begin
		imme = -16'd4;
		#100;
        
		imme = 16'd155;
		#100;

		$finish;
	end

	initial begin 
		$monitor($time, , , "imme: %d %b | out: %d %b",
				 imme, imme, out, out);
	end
      
endmodule

