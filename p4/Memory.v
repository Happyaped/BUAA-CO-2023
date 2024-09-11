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
	 input Trans_M_In1,
	 output [31:0] Instr_M_Out,
	 output [31:0] PC_M_Out,
	 output [4:0] WriteReg_M_Out,
	 output [31:0] ALUOut_M_Out,
	 output [31:0] DMOut_M_Out,
	 output [4:0] Rt_M_Out,
	 output RegWrite_M_Out,
	 output [1:0] T_new_M_Out
    );
wire MemWrite;
wire [31:0] DM_WD_In;
wire [11:0] DM_A_Num;
M_Controller mcontroller1(Instr_M_In,MemWrite,RegWrite_M_Out,T_new_M_Out);
Mux2 #(32) mux2m1(WriteData_M_In,Result_M_In,Trans_M_In1,DM_WD_In);
GetNum getnumm1(ALUOut_M_In,DM_A_Num);
DM dm1(DM_A_Num,DM_WD_In,MemWrite,reset,clk,PC_M_In,ALUOut_M_In,DMOut_M_Out);
assign Instr_M_Out=Instr_M_In;
assign PC_M_Out=PC_M_In;
assign WriteReg_M_Out=WriteReg_M_In;
assign ALUOut_M_Out=ALUOut_M_In;
assign Rt_M_Out=Instr_M_In[20:16];
endmodule
