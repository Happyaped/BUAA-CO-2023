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
    input Req,

    input D_eret,
	 input D_jump,
	 input [31:0] EPC,
	 
    input [31:0] Addr_F_In,
	 input clk,
	 input reset,
	 input Stop_F,
	 output [31:0] PC_F_Out,
	 output [31:0] PCPlus4_F_Out,
	 
	 output [4:0] F_ExcCode_Out,
	 output F_isdelay_Out,
	 output F_AdEL_Out
    );
wire [31:0] PC_F_tem;
wire F_AdEL;
pc pc1(EPC,D_eret,Req,Addr_F_In,clk,reset,Stop_F,PC_F_tem);
assign PC_F_Out=(D_eret==1'b1)?EPC:PC_F_tem;
assign F_AdEL=((|PC_F_Out[1:0])|(PC_F_Out<32'h00003000)|(PC_F_Out>32'h00006ffc))&!D_eret;
assign PCPlus4_F_Out=PC_F_Out+32'h00000004;
assign F_AdEL_Out=F_AdEL;
assign F_isdelay_Out=(D_jump==1'b1)?1'b1:1'b0;
assign F_ExcCode_Out=(F_AdEL==1'b1)?4:0;
endmodule
