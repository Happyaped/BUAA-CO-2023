`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:04:54 11/15/2023 
// Design Name: 
// Module Name:    Memory 
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
`include "head.v"
module Memory(
    input [4:0] ExcCode_M_In,
	 input isdelay_M_In,
	 input [5:0] HWInt,

    input clk,
	 input reset,
    input [31:0] Instr_M_In,
	 input [31:0] PC_M_In,
	 input [4:0] WriteReg_M_In,
	 input [31:0] ALUOut_M_In,
	 input [31:0] WriteData_M_In,
	 input [31:0] Result_M_In,
	 input [31:0] DMOut_M_In,
	 input Trans_M_In1,
	 output [31:0] Instr_M_Out,
	 output [31:0] PC_M_Out,
	 output [4:0] WriteReg_M_Out,
	 output [31:0] ALUOut_M_Out,
	 output [31:0] DMOut_M_Out,
	 output [4:0] Rt_M_Out,
	 output RegWrite_M_Out,
	 output [1:0] T_new_M_Out,
	 output [3:0] MemWrite_M_Out,
	 output [31:0] DM_WD_Out,
	 
	 output Req,
	 output [31:0] EPC_M_Out,
	 output [31:0] CP0DataOut_M_Out,
	 output CP0IntResponse,
	 
	 output M_mtc0
    );

wire [31:0] DM_WD_In;
wire ShSlt;
wire SbSlt;
wire LhSlt;
wire LbSlt;

wire [1:0] BEOp;
wire Store;
wire Erroffline;
wire Erroutofrange;
wire Errtimer;
wire M_Store_AdEL;
wire [1:0] DEOp;
wire Load;
wire Erroffline_L;
wire Erroutofrange_L;
wire Errtimer_L;
wire M_Load_AdEL;

wire [4:0] CP0_ExcCode;
wire [4:0] rd;
wire CP0Write;
wire EXLClr;
assign rd=Instr_M_In[15:11];

M_Controller mcontroller1(Req,PC_M_In,Instr_M_In,ALUOut_M_In[0],ALUOut_M_In[1],MemWrite_M_Out,RegWrite_M_Out,ShSlt,SbSlt,LhSlt,LbSlt,T_new_M_Out,BEOp,Store,DEOp,Load,CP0Write,EXLClr,M_mtc0);
Mux2 #(32) mux2m1(WriteData_M_In,Result_M_In,Trans_M_In1,DM_WD_In);
assign DM_WD_Out=(ShSlt)?{DM_WD_In[15:0],DM_WD_In[15:0]}:
(SbSlt)?{DM_WD_In[7:0],DM_WD_In[7:0],DM_WD_In[7:0],DM_WD_In[7:0]}:DM_WD_In;

assign DMOut_M_Out=(LhSlt&&ALUOut_M_In[1]==1'b0)?{{16{DMOut_M_In[15]}},DMOut_M_In[15:0]}:
(LhSlt&&ALUOut_M_In[1]==1'b1)?{{16{DMOut_M_In[31]}},DMOut_M_In[31:16]}:
(LbSlt&&ALUOut_M_In[1:0]==2'b00)?{{24{DMOut_M_In[7]}},DMOut_M_In[7:0]}:
(LbSlt&&ALUOut_M_In[1:0]==2'b01)?{{24{DMOut_M_In[15]}},DMOut_M_In[15:8]}:
(LbSlt&&ALUOut_M_In[1:0]==2'b10)?{{24{DMOut_M_In[23]}},DMOut_M_In[23:16]}:
(LbSlt&&ALUOut_M_In[1:0]==2'b11)?{{24{DMOut_M_In[31]}},DMOut_M_In[31:24]}:DMOut_M_In;
assign Instr_M_Out=Instr_M_In;
assign PC_M_Out=PC_M_In;
assign WriteReg_M_Out=WriteReg_M_In;
assign ALUOut_M_Out=ALUOut_M_In;
assign Rt_M_Out=Instr_M_In[20:16];

assign Erroffline=((BEOp==2'b01)&&(|ALUOut_M_In[1:0]))||
                  ((BEOp==2'b10)&&(ALUOut_M_In[0]));
assign Erroutofrange=!(((ALUOut_M_In>=`DMStart)&&(ALUOut_M_In<=`DMEnd))||
                       ((ALUOut_M_In>=`TC1Start)&&(ALUOut_M_In<=`TC1End))||
							  ((ALUOut_M_In>=`TC2Start)&&(ALUOut_M_In<=`TC2End))||
							  ((ALUOut_M_In>=`StopperStart)&&(ALUOut_M_In<=`StopperEnd)));
assign Errtimer=(ALUOut_M_In>=32'h00007f08&&ALUOut_M_In<=32'h00007f0b)||
                (ALUOut_M_In>=32'h00007f18&&ALUOut_M_In<=32'h00007f1b)||
					 ((BEOp==2'b11||BEOp==2'b10)&&ALUOut_M_In>=`TC1Start&&ALUOut_M_In<=`TC1End)||
					 ((BEOp==2'b11||BEOp==2'b10)&&ALUOut_M_In>=`TC2Start&&ALUOut_M_In<=`TC2End);
assign M_Store_AdEL=Store&&(Errtimer||Erroutofrange||Erroffline);
assign Erroffline_L=((DEOp==2'b01)&&(|ALUOut_M_In[1:0]))||
                  ((DEOp==2'b10)&&(ALUOut_M_In[0]));
assign Erroutofrange_L=!(((ALUOut_M_In>=`DMStart)&&(ALUOut_M_In<=`DMEnd))||
                       ((ALUOut_M_In>=`TC1Start)&&(ALUOut_M_In<=`TC1End))||
							  ((ALUOut_M_In>=`TC2Start)&&(ALUOut_M_In<=`TC2End))||
							  ((ALUOut_M_In>=`StopperStart)&&(ALUOut_M_In<=`StopperEnd)));
assign Errtimer_L=((DEOp==2'b11||DEOp==2'b10)&&ALUOut_M_In>=`TC1Start&&ALUOut_M_In<=`TC1End)||
					 ((DEOp==2'b11||DEOp==2'b10)&&ALUOut_M_In>=`TC2Start&&ALUOut_M_In<=`TC2End);
assign M_Load_AdEL=Load&&(Erroffline_L||Erroutofrange_L||Errtimer_L);
assign CP0_ExcCode=(ExcCode_M_In!=0)?ExcCode_M_In:
                   (M_Store_AdEL==1'b1)?5:
						 (M_Load_AdEL==1'b1)?4:0;
CP0 cp0(rd,rd,DM_WD_In,CP0Write,PC_M_In,CP0_ExcCode,isdelay_M_In,HWInt,EXLClr,clk,reset,Req,EPC_M_Out,CP0DataOut_M_Out,CP0IntResponse);
endmodule
