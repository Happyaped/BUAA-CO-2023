`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:01:07 11/14/2023 
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
    input [31:0] Addr_F_In,
	 input clk,
	 input reset,
	 input Stop_F,
	 output [31:0] Instr_F_Out,
	 output [31:0] PC_F_Out,
	 output [31:0] PCPlus4_F_Out
    );
wire [31:0] NumOut;
wire [11:0] IMIn;
pc pc1(Addr_F_In,clk,reset,Stop_F,NumOut,PC_F_Out);
GetNum getnum_F1(NumOut,IMIn);
IM im1(IMIn,Instr_F_Out);
assign PCPlus4_F_Out=PC_F_Out+32'h00000004;
endmodule
