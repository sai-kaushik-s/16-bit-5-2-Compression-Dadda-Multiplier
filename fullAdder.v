`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:37:36 11/06/2020 
// Design Name: 
// Module Name:    fullAdder 
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
module fullAdder(
    input A,
    input B,
    input Ci,
    output S,
    output Ca
);
	
	wire w1, w2, w3, w4, w5;
	
	xor xor0 (w1, A, B);
	xor xor1 (S, w1, Ci);
	
	and and0 (w2, A, B);
	and and1 (w3, B, Ci);
	and and3 (w4, Ci, A);
	
	or or0 (w5, w2, w3);
	or or1 (Ca, w4, w5);
	
endmodule
