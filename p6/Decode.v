`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:33:37 11/14/2023 
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
    input [31:0] Instr_D_In,
	 input [31:0] PC_D_In,
	 input [31:0] PC_D_In_W,
	 input [31:0] PCPlus4_D_In,
	 input clk,
	 input reset,
	 input [4:0] A3_D_In,
	 input [31:0] WD_D_In,
	 input RegWrite_D_In,
	 input [31:0] ALUOut_D_In,
	 input [31:0] PCPlus8_D_In,
	 input [1:0] Trans_D_In1,
	 input [1:0] Trans_D_In2,
	 output [31:0] Instr_D_Out,
	 output [31:0] PC_D_Out,
	 output [4:0] Rs_D_Out,
	 output [4:0] Rt_D_Out,
	 output [4:0] WriteReg_D_Out,
	 output [31:0] RD1_D_Out,
	 output [31:0] RD2_D_Out,
	 output [31:0] Beq_D_Out,
	 output [31:0] Jal_D_Out,
	 output [31:0] Jr_D_Out,
	 output BeqSlt,
	 output JalSlt,
	 output JrSlt,
	 output [1:0] rs_use,
	 output [1:0] rt_use,
	 output [31:0] signextendout,
	 output [31:0] zeroextendout,
	 output [31:0] Bne_D_Out,
	 output BneSlt,
	 output Stop_D
    );
wire [4:0] rs;
wire [4:0] rt;
wire [4:0] rd;
wire [15:0] imm;
wire [31:0] RD1Out_tem1;
wire [31:0] RD2Out_tem2;
wire BeqEqual;
wire [1:0] RegDst;
wire BeqBranch;
wire BneBranch;
wire [31:0] BeqOut_tem;
assign Instr_D_Out=Instr_D_In;
assign PC_D_Out=PC_D_In;
assign BeqSlt=BeqEqual&BeqBranch;
assign BneSlt=(BeqEqual==1'b0&&BneBranch==1'b1)?1'b1:1'b0;
assign rs=Instr_D_In[25:21];
assign rt=Instr_D_In[20:16];
assign rd=Instr_D_In[15:11];
assign imm=Instr_D_In[15:0];
assign Rs_D_Out=rs;
assign Rt_D_Out=rt;
D_Controller dcontroller1(Instr_D_In,RegDst,BeqBranch,JalSlt,JrSlt,BneBranch,Stop_D,rs_use,rt_use);
GRF grf1(rs,rt,A3_D_In,WD_D_In,clk,reset,RegWrite_D_In,PC_D_In_W,RD1Out_tem1,RD2Out_tem2);
Mux3 #(32) mux3d1(RD1Out_tem1,ALUOut_D_In,PCPlus8_D_In,Trans_D_In1,RD1_D_Out);
Mux3 #(32) mux3d2(RD2Out_tem2,ALUOut_D_In,PCPlus8_D_In,Trans_D_In2,RD2_D_Out);
CMP #(32) cmpd1(RD1_D_Out,RD2_D_Out,BeqEqual);
Mux3 #(5) mux3d3(rt,rd,5'b11111,RegDst,WriteReg_D_Out);
SignExtend signextend1(imm,signextendout);
ZeroExtend zeroextend1(imm,zeroextendout);
assign BeqOut_tem={signextendout[29:0],{2{1'b0}}};
assign Beq_D_Out=BeqOut_tem+PCPlus4_D_In;
assign Bne_D_Out=Beq_D_Out;
assign Jal_D_Out={PC_D_In[31:28],Instr_D_In[25:0],{2{1'b0}}};
assign Jr_D_Out=RD1_D_Out;
endmodule
