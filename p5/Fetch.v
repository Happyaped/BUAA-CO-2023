`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:57:56 11/11/2023 
// Design Name: 
// Module Name:    Fetch 
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
module Fetch(
    input clk,
	 input reset,
	 input PC_WrEn,
    input [31:0] Nextpc,
	 output [31:0] Instr_F,
	 output [31:0] PC_F,
	 output [31:0] PCPlus4_F
    );
wire [31:0] Numout;
wire [11:0] IM_in;
pc pc1(Nextpc,clk,reset,PC_WrEn,Numout,PC_F);
GetNum getnum1(Numout,IM_in);
IM im1(IM_in,Instr_F);
Adder #(32) adder1(PC_F,32'h00000004,PCPlus4_F);
endmodule
