`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:44:30 11/15/2023 
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
wire [31:0] Addr_F_In;
wire Stop_F;
wire [31:0] Instr_F_Out;
wire [31:0] PC_F_Out;
wire [31:0] PCPlus4_F_Out;
wire [31:0] Instr_DR_In;
wire [31:0] PC_DR_In;
wire [31:0] PCPlus4_DR_In;
wire Stop_DR;
wire [31:0] Instr_DR_Out;
wire [31:0] PC_DR_Out;
wire [31:0] PCPlus4_DR_Out;
wire [31:0] Instr_D_In;
wire [31:0] PC_D_In;
wire [31:0] PC_D_In_W;
wire [31:0] PCPlus4_D_In;
wire [4:0] A3_D_In;
wire [31:0] WD_D_In;
wire RegWrite_D_In;
wire [31:0] ALUOut_D_In;
wire [31:0] PCPlus8_D_In;
wire [1:0] Trans_D_In1;
wire [1:0] Trans_D_In2;
wire [31:0] Instr_D_Out;
wire [31:0] PC_D_Out;
wire [4:0] Rs_D_Out;
wire [4:0] Rt_D_Out;
wire [4:0] WriteReg_D_Out;
wire [31:0] RD1_D_Out;
wire [31:0] RD2_D_Out;
wire [31:0] BeqOut;
wire [31:0] JalOut;
wire [31:0] JrOut;
wire BeqSlt;
wire JalSlt;
wire JrSlt;
wire [1:0] rs_use;
wire [1:0] rt_use;
wire [31:0] signextendout_D_Out;
wire [31:0] zeroextendout_D_Out;
wire clr_ER;
wire [31:0] Instr_ER_In;
wire [31:0] PC_ER_In;
wire [4:0] WriteReg_ER_In;
wire [31:0] RD1_ER_In;
wire [31:0] RD2_ER_In;
wire [31:0] signextendout_ER_In;
wire [31:0] zeroextendout_ER_In;
wire [31:0] Instr_ER_Out;
wire [31:0] PC_ER_Out;
wire [4:0] WriteReg_ER_Out;
wire [31:0] RD1_ER_Out;
wire [31:0] RD2_ER_Out;
wire [31:0] signextendout_ER_Out;
wire [31:0] zeroextendout_ER_Out;
wire [31:0] Instr_E_In;
wire [31:0] PC_E_In;
wire [4:0] WriteReg_E_In;
wire [31:0] RD1_E_In;
wire [31:0] RD2_E_In;
wire [31:0] signextendout_E_In;
wire [31:0] zeroextendout_E_In;
wire [31:0] ALUOut_E_In;
wire [31:0] Result_E_In;
wire [1:0] Trans_E_In1;
wire [1:0] Trans_E_In2;
wire [31:0] Instr_E_Out;
wire [31:0] PC_E_Out;
wire [4:0] WriteReg_E_Out;
wire [4:0] Rs_E_Out;
wire [4:0] Rt_E_Out;
wire RegWrite_E_Out;
wire [31:0] ALUOut_E_Out;
wire [31:0] WriteData_E_Out;
wire [1:0] T_new_E_Out;
wire [31:0] PCPlus8_E_Out;
wire [31:0] Instr_MR_In;
wire [31:0] PC_MR_In;
wire [4:0] WriteReg_MR_In;
wire [31:0] ALUOut_MR_In;
wire [31:0] WriteData_MR_In;
wire [31:0] Instr_MR_Out;
wire [31:0] PC_MR_Out;
wire [4:0] WriteReg_MR_Out;
wire [31:0] ALUOut_MR_Out;
wire [31:0] WriteData_MR_Out;
wire [31:0] Instr_M_In;
wire [31:0] PC_M_In;
wire [4:0] WriteReg_M_In;
wire [31:0] ALUOut_M_In;
wire [31:0] WriteData_M_In;
wire [31:0] Result_M_In;
wire Trans_M_In1;
wire [31:0] Instr_M_Out;
wire [31:0] PC_M_Out;
wire [4:0] WriteReg_M_Out;
wire [31:0] ALUOut_M_Out;
wire [31:0] DMOut_M_Out;
wire [4:0] Rt_M_Out;
wire RegWrite_M_Out;
wire [1:0] T_new_M_Out;
wire [31:0] Instr_WR_In;
wire [31:0] PC_WR_In;
wire [4:0] WriteReg_WR_In;
wire [31:0] ALUOut_WR_In;
wire [31:0] DMOut_WR_In;
wire [31:0] Instr_WR_Out;
wire [31:0] PC_WR_Out;
wire [4:0] WriteReg_WR_Out;
wire [31:0] ALUOut_WR_Out;
wire [31:0] DMOut_WR_Out;
wire [31:0] Instr_W_In;
wire [31:0] PC_W_In;
wire [4:0] WriteReg_W_In;
wire [31:0] ALUOut_W_In;
wire [31:0] DMOut_W_In;
wire [31:0] PC_W_Out;
wire [31:0] Result_W_Out;
wire [4:0] WriteReg_W_Out;
wire RegWrite_W_Out;
wire [1:0] T_new_W_Out;
wire [31:0] PCPlus4_N_In;
wire [31:0] BeqOut_N_In;
wire [31:0] JalOut_N_In;
wire [31:0] JrOut_N_In;
wire BeqSlt_N;
wire JalSlt_N;
wire JrSlt_N;
wire [31:0] NPC_Out;
wire [4:0] RsD_T;
wire [4:0] RtD_T;
wire [4:0] RsE_T;
wire [4:0] RtE_T;
wire [4:0] RtM_T;
wire [4:0] WriteRegE_T;
wire [4:0] WriteRegM_T;
wire [4:0] WriteRegW_T;
wire RegWriteE_T;
wire RegWriteM_T;
wire RegWriteW_T;
wire [1:0] rs_use_T;
wire [1:0] rt_use_T;
wire [1:0] T_newE_T;
wire [1:0] T_newM_T;
wire [1:0] T_newW_T;
wire [1:0] T_D_Out1;
wire [1:0] T_D_Out2;
wire [1:0] T_E_Out1;
wire [1:0] T_E_Out2;
wire T_M_Out1;
wire T_Stop_Out;

Fetch fetch(Addr_F_In,clk,
reset,Stop_F,
Instr_F_Out,PC_F_Out,
PCPlus4_F_Out
);

assign Addr_F_In=NPC_Out;
assign Stop_F=T_Stop_Out;

D_Register dregister(Instr_DR_In,PC_DR_In,
PCPlus4_DR_In,clk,
reset,Stop_DR,Instr_DR_Out,
PC_DR_Out,PCPlus4_DR_Out
);

assign Instr_DR_In=Instr_F_Out;
assign PC_DR_In=PC_F_Out;
assign PCPlus4_DR_In=PCPlus4_F_Out;
assign Stop_DR=T_Stop_Out;

Decode decode(Instr_D_In,PC_D_In,
PC_D_In_W,PCPlus4_D_In,
clk,reset,
A3_D_In,WD_D_In,
RegWrite_D_In,ALUOut_D_In,
PCPlus8_D_In,Trans_D_In1,
Trans_D_In2,Instr_D_Out,
PC_D_Out,Rs_D_Out,
Rt_D_Out,WriteReg_D_Out,
RD1_D_Out,RD2_D_Out,
BeqOut,JalOut,
JrOut,BeqSlt,
JalSlt,JrSlt,
rs_use,rt_use,
signextendout_D_Out,zeroextendout_D_Out
);

assign Instr_D_In=Instr_DR_Out;
assign PC_D_In=PC_DR_Out;
assign PC_D_In_W=PC_W_Out;
assign PCPlus4_D_In=PCPlus4_DR_Out;
assign A3_D_In=WriteReg_W_Out;
assign WD_D_In=Result_W_Out;
assign RegWrite_D_In=RegWrite_W_Out;
assign ALUOut_D_In=ALUOut_M_Out;
assign PCPlus8_D_In=PCPlus8_E_Out;
assign Trans_D_In1=T_D_Out1;
assign Trans_D_In2=T_D_Out2;

E_Register eregister(clk,reset,
clr_ER,Instr_ER_In,
PC_ER_In,WriteReg_ER_In,
RD1_ER_In,RD2_ER_In,
signextendout_ER_In,zeroextendout_ER_In,
Instr_ER_Out,PC_ER_Out,
WriteReg_ER_Out,RD1_ER_Out,
RD2_ER_Out,signextendout_ER_Out,
zeroextendout_ER_Out
);

assign clr_ER=T_Stop_Out;
assign Instr_ER_In=Instr_D_Out;
assign PC_ER_In=PC_D_Out;
assign WriteReg_ER_In=WriteReg_D_Out;
assign RD1_ER_In=RD1_D_Out;
assign RD2_ER_In=RD2_D_Out;
assign signextendout_ER_In=signextendout_D_Out;
assign zeroextendout_ER_In=zeroextendout_D_Out;

Execute execute(Instr_E_In,PC_E_In,
WriteReg_E_In,RD1_E_In,
RD2_E_In,signextendout_E_In,
zeroextendout_E_In,ALUOut_E_In,
Result_E_In,Trans_E_In1,
Trans_E_In2,Instr_E_Out,
PC_E_Out,WriteReg_E_Out,
Rs_E_Out,Rt_E_Out,
RegWrite_E_Out,ALUOut_E_Out,
WriteData_E_Out,T_new_E_Out,
PCPlus8_E_Out
);

assign Instr_E_In=Instr_ER_Out;
assign PC_E_In=PC_ER_Out;
assign WriteReg_E_In=WriteReg_ER_Out;
assign RD1_E_In=RD1_ER_Out;
assign RD2_E_In=RD2_ER_Out;
assign signextendout_E_In=signextendout_ER_Out;
assign zeroextendout_E_In=zeroextendout_ER_Out;
assign ALUOut_E_In=ALUOut_M_Out;
assign Result_E_In=Result_W_Out;
assign Trans_E_In1=T_E_Out1;
assign Trans_E_In2=T_E_Out2;

M_Register mregister(clk,reset,
Instr_MR_In,PC_MR_In,
WriteReg_MR_In,ALUOut_MR_In,
WriteData_MR_In,Instr_MR_Out,
PC_MR_Out,WriteReg_MR_Out,
ALUOut_MR_Out,WriteData_MR_Out
);

assign Instr_MR_In=Instr_E_Out;
assign PC_MR_In=PC_E_Out;
assign WriteReg_MR_In=WriteReg_E_Out;
assign ALUOut_MR_In=ALUOut_E_Out;
assign WriteData_MR_In=WriteData_E_Out;

Memory memory(clk,reset,
Instr_M_In,PC_M_In,
WriteReg_M_In,ALUOut_M_In,
WriteData_M_In,Result_M_In,
Trans_M_In1,Instr_M_Out,
PC_M_Out,WriteReg_M_Out,
ALUOut_M_Out,DMOut_M_Out,
Rt_M_Out,RegWrite_M_Out,
T_new_M_Out
);

assign Instr_M_In=Instr_MR_Out;
assign PC_M_In=PC_MR_Out;
assign WriteReg_M_In=WriteReg_MR_Out;
assign ALUOut_M_In=ALUOut_MR_Out;
assign WriteData_M_In=WriteData_MR_Out;
assign Result_M_In=Result_W_Out;
assign Trans_M_In1=T_M_Out1;

W_Register wregister(clk,reset,
Instr_WR_In,PC_WR_In,
WriteReg_WR_In,ALUOut_WR_In,
DMOut_WR_In,Instr_WR_Out,
PC_WR_Out,WriteReg_WR_Out,
ALUOut_WR_Out,DMOut_WR_Out
);

assign Instr_WR_In=Instr_M_Out;
assign PC_WR_In=PC_M_Out;
assign WriteReg_WR_In=WriteReg_M_Out;
assign ALUOut_WR_In=ALUOut_M_Out;
assign DMOut_WR_In=DMOut_M_Out;

Writeback writeback(Instr_W_In,PC_W_In,
WriteReg_W_In,ALUOut_W_In,
DMOut_W_In,PC_W_Out,
Result_W_Out,WriteReg_W_Out,
RegWrite_W_Out,T_new_W_Out
);

assign Instr_W_In=Instr_WR_Out;
assign PC_W_In=PC_WR_Out;
assign WriteReg_W_In=WriteReg_WR_Out;
assign ALUOut_W_In=ALUOut_WR_Out;
assign DMOut_W_In=DMOut_WR_Out;

NPC npc(PCPlus4_N_In,BeqOut_N_In,
JalOut_N_In,JrOut_N_In,
BeqSlt_N,JalSlt_N,
JrSlt_N,NPC_Out
);

assign PCPlus4_N_In=PCPlus4_F_Out;
assign BeqOut_N_In=BeqOut;
assign JalOut_N_In=JalOut;
assign JrOut_N_In=JrOut;
assign BeqSlt_N=BeqSlt;
assign JalSlt_N=JalSlt;
assign JrSlt_N=JrSlt;

Trans_cal transcal(RsD_T,RtD_T,
RsE_T,RtE_T,
RtM_T,WriteRegE_T,
WriteRegM_T,WriteRegW_T,
RegWriteE_T,RegWriteM_T,
RegWriteW_T,rs_use_T,
rt_use_T,T_newE_T,
T_newM_T,T_newW_T,
T_D_Out1,T_D_Out2,
T_E_Out1,T_E_Out2,
T_M_Out1,T_Stop_Out
);

assign RsD_T=Rs_D_Out;
assign RtD_T=Rt_D_Out;
assign RsE_T=Rs_E_Out;
assign RtE_T=Rt_E_Out;
assign RtM_T=Rt_M_Out;
assign WriteRegE_T=WriteReg_E_Out;
assign WriteRegM_T=WriteReg_M_Out;
assign WriteRegW_T=WriteReg_W_Out;
assign RegWriteE_T=RegWrite_E_Out;
assign RegWriteM_T=RegWrite_M_Out;
assign RegWriteW_T=RegWrite_W_Out;
assign rs_use_T=rs_use;
assign rt_use_T=rt_use;
assign T_newE_T=T_new_E_Out;
assign T_newM_T=T_new_M_Out;
assign T_newW_T=T_new_W_Out;

endmodule
