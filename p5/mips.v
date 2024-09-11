`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:57:41 11/11/2023 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,
	 input reset
    );
wire Stop;
wire [31:0] AddrIn;
wire [31:0] Instr_F;
wire [31:0] PC_F;
wire [31:0] PCPlus4_F;
wire [31:0] Instr_D;
wire [31:0] PC_D;
wire [31:0] PCPlus4_D;
wire [4:0] A3_D;
wire [31:0] WD_D;
wire [31:0] Addrprt;
wire [31:0] ALUOutM_Out;
wire RegWriteW;
wire ForwardAD;
wire ForwardBD;
wire [1:0] ForwardAE;
wire [1:0] ForwardBE;
wire [31:0] RD1_D;
wire [31:0] RD2_D;
wire [31:0] Instr_D_Out;
wire [31:0] PC_D_Out;
wire [31:0] signextendout;
wire [31:0] zeroextendout;
wire [31:0] beqPC_D;
wire [31:0] jalPC_D;
wire [31:0] jrPC_D;
wire [4:0] Rs_D;
wire [4:0] Rt_D;
wire [4:0] Rd_D;
wire PCSrc_D;
wire JalSlt_D;
wire JrSlt_D;
wire [1:0] rs_use;
wire [1:0] rt_use;
wire [31:0] Instr_E;
wire [31:0] PC_E;
wire [31:0] RD1_E;
wire [31:0] RD2_E;
wire [31:0] signextendout_E;
wire [31:0] zeroextendout_E;
wire [31:0] ResultW;
wire [31:0] Instr_E_Out;
wire [31:0] PC_E_Out;
wire [31:0] ALUOut_E;
wire [31:0] WriteData_E;
wire [4:0] WriteReg_E;
wire [4:0] Rs_E;
wire [4:0] Rt_E;
wire regWrite_E;
wire [1:0] T_new_E;
wire [31:0] Instr_M;
wire [31:0] PC_M;
wire [31:0] ALUOut_M;
wire [31:0] WriteData_M;
wire [4:0] WriteReg_M;
wire [31:0] Instr_M_Out;
wire [31:0] PC_M_Out;
wire [4:0] WriteReg_M_Out;
wire [31:0] ReadData_M;
wire regWrite_M;
wire [1:0] T_new_M;
wire [31:0] PC_W;
wire [31:0] Instr_W;
wire [4:0] WriteReg_W;
wire [31:0] ReadData_W;
wire [31:0] ALUOut_W;
wire [4:0] WriteReg_W_Out;
wire regWrite_W;
wire [1:0] T_new_W;
Fetch fetch1(clk,reset,Stop,AddrIn,Instr_F,PC_F,PCPlus4_F);
D_register dregister1(clk,reset,Instr_F,PC_F,PCPlus4_F,Stop,Instr_D,PC_D,PCPlus4_D);
Decode decode1(clk,reset,A3_D,WD_D,Addrprt,Instr_D,PC_D,PCPlus4_D,ALUOutM_Out,RegWriteW,ForwardAD,ForwardBD,RD1_D,RD2_D,Instr_D_Out,PC_D_Out,signextendout,zeroextendout,beqPC_D,jalPC_D,jrPC_D,Rs_D,Rt_D,Rd_D,PCSrc_D,JalSlt_D,JrSlt_D,rs_use,rt_use);
NPC npc1(PCPlus4_F,beqPC_D,jalPC_D,jrPC_D,PCSrc_D,JalSlt_D,JrSlt_D,AddrIn);
E_register eregister1(clk,Stop,reset,Instr_D_Out,PC_D_Out,RD1_D,RD2_D,signextendout,zeroextendout,Instr_E,PC_E,RD1_E,RD2_E,signextendout_E,zeroextendout_E);
Execute execute1(Instr_E,PC_E,RD1_E,RD2_E,ALUOutM_Out,ResultW,signextendout_E,zeroextendout_E,ForwardAE,ForwardBE,Instr_E_Out,PC_E_Out,ALUOut_E,WriteData_E,WriteReg_E,Rs_E,Rt_E,regWrite_E,T_new_E);
M_register mregister1(clk,reset,Instr_E_Out,PC_E_Out,ALUOut_E,WriteData_E,WriteReg_E,Instr_M,PC_M,ALUOut_M,WriteData_M,WriteReg_M);
Memory memory1(clk,reset,Instr_M,PC_M,ALUOut_M,WriteData_M,WriteReg_M,Instr_M_Out,PC_M_Out,WriteReg_M_Out,ReadData_M,ALUOutM_Out,regWrite_M,T_new_M);
W_register wregister1(clk,reset,Instr_M_Out,PC_M_Out,WriteReg_M_Out,ReadData_M,ALUOutM_Out,Instr_W,PC_W,WriteReg_W,ReadData_W,ALUOut_W);
Writeback writeback1(Instr_W,PC_W,ReadData_W,ALUOut_W,WriteReg_W,WriteReg_W_Out,ResultW,regWrite_W,T_new_W,Addrprt);
Controller_All controllerall1(Rs_D,Rt_D,Rs_E,Rt_E,WriteReg_E,WriteReg_M_Out,WriteReg_W_Out,rs_use,rt_use,T_new_E,T_new_M,T_new_W,regWrite_E,regWrite_M,regWrite_W,ForwardAE,ForwardBE,ForwardAD,ForwardBD,Stop);
assign WD_D=ResultW;
assign A3_D=WriteReg_W_Out;
assign RegWriteW=regWrite_W;
endmodule
