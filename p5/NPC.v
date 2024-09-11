`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:01:47 11/11/2023 
// Design Name: 
// Module Name:    NPC 
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
module NPC(
    input [31:0] PCPlus4_F,
    input [31:0] beqPC_F,
	 input [31:0] jalPC_F,
	 input [31:0] jrPC_F,
    input PCSrcD,
	 input JalSlt,
	 input JrSlt,
    output [31:0] NextPC
    );
wire [31:0] NextPCtem1;
wire [31:0] NextPCtem2;
Mux2 #(32) mux23(PCPlus4_F,beqPC_F,PCSrcD,NextPCtem1);
Mux2 #(32) mux29(NextPCtem1,jalPC_F,JalSlt,NextPCtem2);
Mux2 #(32) mux211(NextPCtem2,jrPC_F,JrSlt,NextPC);
endmodule
