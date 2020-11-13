`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:52:40 11/06/2020 
// Design Name: 
// Module Name:    adder5_2comp 
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
module adder5_2comp(
    input [31:0] A1,
    input [31:0] A2,
    input [31:0] A3,
    input [31:0] A4,
    input [31:0] A5,
    output [31:0] S1,
    output [31:0] S2
    );
	
	wire[31:0] w1, w2, w3, w4;
	
	carrySaveAdder csa1 (A1, A2, A3, w1, w2);
	carrySaveAdder csa2 (A4, A5, w1, w3, w4);
	carrySaveAdder csa3 (w2, w3, w4, S1, S2);

endmodule
