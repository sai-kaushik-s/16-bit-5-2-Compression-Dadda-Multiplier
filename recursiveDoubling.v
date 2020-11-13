`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:19:27 11/06/2020 
// Design Name: 
// Module Name:    recursiveDoubling 
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
module recursiveDoubling(
    input [31:0] A,
    input [31:0] B,
    output [31:0] S,
	output C
    );

	wire [63:0] kgp;
	wire [63:0] temp1;
	wire [63:0] temp2;
	wire [63:0] temp3;
	wire [63:0] temp4;
	wire [63:0] temp5;
	
	wire[31:0] cin;
	
	genvar i;	
	for(i = 0; i < 32; i = i + 1)
	begin
		assign kgp[2 * i] = A[i];
		assign kgp[2 * i + 1] = B[i];
	end
	
	parallelPrefix PP0(kgp[1:0], 2'b00, temp1[1:0]);
	parallelPrefix PP1[31:1] (kgp[63:2], temp1[61:0], temp1[63:2]);
	
	parallelPrefix PP2[1:0] (temp1[3:0], 2'b00, temp2[3:0]);
	parallelPrefix PP3[31:2] (temp1[63:4], temp2[61:2], temp2[63:4]);
	
	parallelPrefix PP4[3:0] (temp2[7:0], 2'b00, temp3[7:0]);
	parallelPrefix PP5[31:4] (temp2[63:8], temp3[61:6], temp3[63:8]);
	
	parallelPrefix PP6[7:0] (temp3[15:0], 2'b00, temp4[15:0]);
	parallelPrefix PP7[31:8] (temp3[63:16], temp4[61:14], temp4[63:16]);

	parallelPrefix PP8[15:0] (temp4[31:0], 2'b00, temp5[31:0]);
	parallelPrefix PP9[31:16] (temp4[63:32], temp5[61:30], temp5[63:32]);
	
	generate
		for(i = 0; i < 32; i = i + 1)
		begin
			assign cin[i] = temp5[2 * i + 1];
		end
	endgenerate
	
	assign S[0] = A[0] ^ B[0];
	
	generate
		for(i = 1; i < 32; i = i + 1)
		begin
			assign S[i] = A[i] ^ B[i] ^ cin[i - 1];
		end
	endgenerate
	
	assign C = cin[31];

endmodule
