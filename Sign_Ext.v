`timescale 1ns / 1ps

/*
 * Author:		李扬名.
 * StartTime:	18/11/9
 * Software:	Xilins-ISE
 * Editor:		Sublime
 * FileName:	Sign_Extend.v
 * FileType:	source
 * LastModify:	18/11/10
 */


// imme 的符号位拓展.
module Sign_Ext(
		imme, out
    );

	parameter IMME_SIZE = 16;
	parameter DATA_SIZE = 32;

	input wire [IMME_SIZE-1:0] imme;
	output wire [DATA_SIZE-1:0] out;

	assign out = {{(DATA_SIZE-IMME_SIZE){imme[IMME_SIZE-1]}}, imme};

endmodule
