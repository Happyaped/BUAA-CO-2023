`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:49:14 11/15/2023 
// Design Name: 
// Module Name:    Execute 
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
module Execute(
   input [4:0] ExcCode_E_In,
	input isdelay_E_In,
	input Req,

   input clk,
	input reset,
   input [31:0] Instr_E_In,
	input [31:0] PC_E_In,
	input [4:0] WriteReg_E_In,
	input [31:0] RD1_E_In,
	input [31:0] RD2_E_In,
	input [31:0] signextendout,
	input [31:0] zeroextendout,
	input [31:0] ALUOut_E_In,
	input [31:0] Result_E_In,
	input [1:0] Trans_E_In1,
	input [1:0] Trans_E_In2,
	output [31:0] Instr_E_Out,
	output [31:0] PC_E_Out,
	output [4:0] WriteReg_E_Out,
	output [4:0] Rs_E_Out,
	output [4:0] Rt_E_Out,
	output RegWrite_E_Out,
	output [31:0] ALUOut_E_Out,
	output [31:0] WriteData_E_Out,
	output [1:0] T_new_E_Out,
	output [31:0] PCPlus8_E_Out,
	output Stop_MD,
	
	output [4:0] ExcCode_E_Out,
	output isdelay_E_Out,
	
	output E_mtc0
    );
wire [31:0] ALUInA;
wire [31:0] ALUInB_tem1;
wire [31:0] ALUInB;
wire [3:0] ALUControll;
wire [31:0] ALUOut_tem1;
wire [31:0] ALUOut_tem2;
wire [31:0] ALUOut_tem3;
wire [31:0] ALUOut_tem4;
wire [31:0] PCPlus8_E;
wire [31:0] LuiOut;
wire ALUSrc;
wire OriSlt;
wire JalSlt;
wire LuiSlt;
wire MfhiSlt;
wire MfloSlt;
wire [31:0] Hi_E;
wire [31:0] Lo_E;
wire Store_Ov;
wire Load_Ov;
wire Cal_Ov;
wire Store_Ov_Out;//代表了3中溢出的真实情况
wire Load_Ov_Out;
wire Cal_Ov_Out;

assign PCPlus8_E_Out=PC_E_In+32'h00000008;
assign PCPlus8_E=PC_E_In+32'h00000008;
assign LuiOut={Instr_E_In[15:0],{16{1'b0}}};
E_Controller econtroller1(Instr_E_In,ALUControll,ALUSrc,OriSlt,JalSlt,LuiSlt,RegWrite_E_Out,MfhiSlt,MfloSlt,T_new_E_Out,Store_Ov,Load_Ov,Cal_Ov,E_mtc0);
Mux3 #(32) mux3e1(RD1_E_In,Result_E_In,ALUOut_E_In,Trans_E_In1,ALUInA);
Mux3 #(32) mux3e2(RD2_E_In,Result_E_In,ALUOut_E_In,Trans_E_In2,WriteData_E_Out);
Mux2 #(32) mux2e1(WriteData_E_Out,signextendout,ALUSrc,ALUInB_tem1);
Mux2 #(32) mux2e2(ALUInB_tem1,zeroextendout,OriSlt,ALUInB);
ALU alu1(Store_Ov,Load_Ov,Cal_Ov,ALUInA,ALUInB,ALUControll,ALUOut_tem1,Store_Ov_Out,Load_Ov_Out,Cal_Ov_Out);
Mux2 #(32) mux2e3(ALUOut_tem1,PCPlus8_E,JalSlt,ALUOut_tem2);
Mux2 #(32) mux2e4(ALUOut_tem2,LuiOut,LuiSlt,ALUOut_tem3);
Mult_Div multdiv1(Req,clk,reset,Instr_E_In,ALUInA,WriteData_E_Out,Hi_E,Lo_E,Stop_MD);
Mux2 #(32) mux2e5(ALUOut_tem3,Hi_E,MfhiSlt,ALUOut_tem4);
Mux2 #(32) mux2e6(ALUOut_tem4,Lo_E,MfloSlt,ALUOut_E_Out);
assign Instr_E_Out=Instr_E_In;
assign PC_E_Out=PC_E_In;
assign WriteReg_E_Out=WriteReg_E_In;
assign Rs_E_Out=Instr_E_In[25:21];
assign Rt_E_Out=Instr_E_In[20:16];

assign ExcCode_E_Out=(ExcCode_E_In!=0)?ExcCode_E_In:
                     (Store_Ov_Out==1'b1)?5:
							(Load_Ov_Out)?4:
							(Cal_Ov_Out)?12:0;
assign isdelay_E_Out=isdelay_E_In;
endmodule
