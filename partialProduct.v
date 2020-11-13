`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:56:42 11/06/2020 
// Design Name: 
// Module Name:    partialProduct 
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
module partialProduct(
    input [15:0] A,
    input B,
    output reg [15:0] C
);
	
	always@(A, B)
	begin
		if (B == 1'b0)
			C = {32{1'b0}};
		else
			C = A;
	end
	
endmodule
