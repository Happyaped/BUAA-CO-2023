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
module Memory(
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
	 output [31:0] DM_WD_Out
    );

wire [31:0] DM_WD_In;
wire ShSlt;
wire SbSlt;
wire LhSlt;
wire LbSlt;
M_Controller mcontroller1(Instr_M_In,ALUOut_M_In[0],ALUOut_M_In[1],MemWrite_M_Out,RegWrite_M_Out,ShSlt,SbSlt,LhSlt,LbSlt,T_new_M_Out);
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
endmodule
