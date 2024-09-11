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
	output [31:0] PCPlus8_E_Out
    );
wire [31:0] ALUInA;
wire [31:0] ALUInB_tem1;
wire [31:0] ALUInB;
wire [1:0] ALUControll;
wire [31:0] ALUOut_tem1;
wire [31:0] ALUOut_tem2;
wire [31:0] PCPlus8_E;
wire [31:0] LuiOut;
wire ALUSrc;
wire OriSlt;
wire JalSlt;
wire LuiSlt;
assign PCPlus8_E_Out=PC_E_In+32'h00000008;
assign PCPlus8_E=PC_E_In+32'h00000008;
assign LuiOut={Instr_E_In[15:0],{16{1'b0}}};
E_Controller econtroller1(Instr_E_In,ALUControll,ALUSrc,OriSlt,JalSlt,LuiSlt,RegWrite_E_Out,T_new_E_Out);
Mux3 #(32) mux3e1(RD1_E_In,Result_E_In,ALUOut_E_In,Trans_E_In1,ALUInA);
Mux3 #(32) mux3e2(RD2_E_In,Result_E_In,ALUOut_E_In,Trans_E_In2,WriteData_E_Out);
Mux2 #(32) mux2e1(WriteData_E_Out,signextendout,ALUSrc,ALUInB_tem1);
Mux2 #(32) mux2e2(ALUInB_tem1,zeroextendout,OriSlt,ALUInB);
ALU alu1(ALUInA,ALUInB,ALUControll,ALUOut_tem1);
Mux2 #(32) mux2e3(ALUOut_tem1,PCPlus8_E,JalSlt,ALUOut_tem2);
Mux2 #(32) mux2e4(ALUOut_tem2,LuiOut,LuiSlt,ALUOut_E_Out);
assign Instr_E_Out=Instr_E_In;
assign PC_E_Out=PC_E_In;
assign WriteReg_E_Out=WriteReg_E_In;
assign Rs_E_Out=Instr_E_In[25:21];
assign Rt_E_Out=Instr_E_In[20:16];
endmodule
