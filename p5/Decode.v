`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:58:36 11/11/2023 
// Design Name: 
// Module Name:    Decode 
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
module Decode(
    input clk,
	 input reset,
	 input [4:0] A3_D,
	 input [31:0] WD_D,
	 input [31:0] Addr_prt,
	 input [31:0] Instr_D,
	 input [31:0] PC_D,
	 input [31:0] PCPlus4_D,
	 input [31:0] ALUOutM,
	 input RegWriteW,
	 input ForwardAD,
	 input ForwardBD,
	 output [31:0] RD1_D,
	 output [31:0] RD2_D,
	 output [31:0] Instr_D_Out,
	 output [31:0] PC_D_Out,
	 output [31:0] signextend_Out,
	 output [31:0] zeroextend_Out,
	 output [31:0] beqPC_D,
	 output [31:0] jalPC_D,
	 output [31:0] jrPC_D,
	 output [4:0] Rs_D,
	 output [4:0] Rt_D,
	 output [4:0] Rd_D,
	 output PCSrcD,
	 output JalSlt_D,
	 output JrSlt_D,
	 output [1:0]Rs_use,
	 output [1:0] Rt_use
    );
wire [15:0] Imm_D;
wire EqualD;
wire [31:0] Equal_In_1;
wire [31:0] Equal_In_2;
wire Branch_D;
wire [31:0] RD1_D_tem;
wire [31:0] RD2_D_tem;
wire [31:0] beqPC_D_tem;
assign Rs_D=Instr_D[25:21];
assign Rt_D=Instr_D[20:16];
assign Rd_D=Instr_D[15:11];
assign Instr_D_Out=Instr_D;
assign PC_D_Out=PC_D;
assign Imm_D=Instr_D[15:0];
SignExtend signextend1(Imm_D,signextend_Out);
ZeroExtend zeroextend1(Imm_D,zeroextend_Out);
GRF grf1(Rs_D,Rt_D,A3_D,WD_D,clk,reset,RegWriteW,Addr_prt,RD1_D_tem,RD2_D_tem);
Mux2 #(32) mux21(RD1_D_tem,ALUOutM,ForwardAD,Equal_In_1);
Mux2 #(32) mux22(RD2_D_tem,ALUOutM,ForwardBD,Equal_In_2);
assign RD1_D=Equal_In_1;
assign RD2_D=Equal_In_2;
CMP #(32) cmp1(Equal_In_1,Equal_In_2,EqualD);
Controller_D controllerd1(Instr_D,Branch_D,JalSlt_D,JrSlt_D,Rs_use,Rt_use);
assign PCSrcD=Branch_D&EqualD;
assign beqPC_D_tem={signextend_Out[29:0],{2{1'b0}}};
assign beqPC_D=beqPC_D_tem+PCPlus4_D;
assign jalPC_D={PC_D[31:28],Instr_D[25:0],{2{1'b0}}};
assign jrPC_D=RD1_D;
endmodule
