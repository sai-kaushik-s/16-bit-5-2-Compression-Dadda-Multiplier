`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:49:59 11/06/2020 
// Design Name: 
// Module Name:    carrySaveAdder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module carrySaveAdder(
    input [31:0] A,
    input [31:0] B,
    input [31:0] Ci,
    output [31:0] S,
    output [31:0] Ca
    );

	genvar i;
	generate
		for(i = 0; i < 31; i = i + 1)
		begin: carry_save_adder
			fullAdder fa(A[i], B[i], Ci[i], S[i], Ca[i + 1]);
		end
	endgenerate
	assign Ca[0] = 1'b0;
	assign S[31] = 1'b0;

endmodule
