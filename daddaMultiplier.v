`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:55:34 11/06/2020 
// Design Name: 
// Module Name:    daddaMultiplier 
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
module daddaMultiplier(
    input [15:0] A,
    input [15:0] B,
    output [32:0] C
    );
	
	genvar i;
	
	wire [15:0] temp [15:0];
	wire [31:0] AB[15:0], temp1[15:0], w1[5:0], w2[1:0], w3[1:0];
	
	generate
		for (i = 0; i < 16; i = i + 1)
		begin: pp_loop
			partialProduct pp(A, B[i], temp[i]);
			assign temp1[i] = {{16{1'b0}}, temp[i]};
			assign AB[i] = temp1[i] << i;
		end
	endgenerate
	
	adder5_2comp a52c_1 (AB[0], AB[1], AB[2], AB[3], AB[4], w1[0], w1[1]);
	adder5_2comp a52c_2 (AB[5], AB[6], AB[7], AB[8], AB[9], w1[2], w1[3]);
	adder5_2comp a52c_3 (AB[10], AB[11], AB[12], AB[13], AB[14], w1[4], w1[5]);
	
	adder5_2comp a52c_4 (w1[0], w1[1], w1[2], w1[3], w1[4], w2[0], w2[1]);
	
	adder4_2comp a42c_1 (AB[15], w1[5], w2[0], w2[1], w3[0], w3[1]);
	
	recursiveDoubling rd_1 (w3[0], w3[1], C[31:0], C[32]);
	
endmodule
