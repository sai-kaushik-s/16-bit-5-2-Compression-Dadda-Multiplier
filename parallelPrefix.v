`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:18:33 11/06/2020 
// Design Name: 
// Module Name:    parallelPrefix 
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
module parallelPrefix(
    input [1:0] A,
    input [1:0] B,
    output reg [1:0] C
    );

	always@(A, B)
	begin
		if(A == 2'b00 || A == 2'b11)
			C = A;
		else
			C = B;
	end

endmodule
