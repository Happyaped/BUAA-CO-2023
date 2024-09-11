`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:59:13 11/11/2023 
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
    input [31:0] Instr_E,
	 input [31:0] PC_E,
	 input [31:0] RD1_E,
	 input [31:0] RD2_E,
	 input [31:0] ALUOutM,
	 input [31:0] ResultW,
	 input [31:0] signextendout_E,
	 input [31:0] zeroextendout_E,
	 input [1:0] ForwardAE,
	 input [1:0] ForwardBE,
	 output [31:0] Instr_E_Out,
	 output [31:0] PC_E_Out,
	 output [31:0] ALUOutE,
	 output [31:0] WriteDataE,
	 output [4:0] WriteReg_E,
	 output [4:0] RsE,
	 output [4:0] RtE,
	 output RegWrite_E,
	 output [1:0] T_new_E
    );
wire [31:0] SrcAE;
wire [31:0] SrcBE_tem;
wire [31:0] SrcBE; 
wire ALUSrc;
wire OriSlt;
wire JalSlt;
wire LuiSlt;
wire [1:0] ALUControl_E;
wire [4:0] RdE;
wire [31:0] SrcBE_tem1;
wire [31:0] ALUOutEtem1;
wire [31:0] ALUOutEtem2;
wire [31:0] LuiOut;
wire [31:0] JalOut;
assign LuiOut={Instr_E[15:0],{16{1'b0}}};
assign JalOut=PC_E+32'h00000008;
assign RsE=Instr_E[25:21];
assign RtE=Instr_E[20:16];
assign RdE=Instr_E[15:11];
assign Instr_E_Out=Instr_E;
assign PC_E_Out=PC_E;
Mux3 #(32) mux31(RD1_E,ResultW,ALUOutM,ForwardAE,SrcAE);
Mux3 #(32) mux32(RD2_E,ResultW,ALUOutM,ForwardBE,SrcBE_tem);
Controller_E controller_e1(Instr_E,ALUSrc,OriSlt,RegWrite_E,ALUControl_E,WriteReg_E,T_new_E,LuiSlt,JalSlt);
Mux2 #(32) mux25(SrcBE_tem,signextendout_E,ALUSrc,SrcBE_tem1);
Mux2 #(32) mux26(SrcBE_tem1,zeroextendout_E,OriSlt,SrcBE);
ALU alu1(SrcAE,SrcBE,ALUControl_E,ALUOutEtem1);
Mux2 #(32) mux212(ALUOutEtem1,LuiOut,LuiSlt,ALUOutEtem2);
Mux2 #(32) mux213(ALUOutEtem2,JalOut,JalSlt,ALUOutE);

assign WriteDataE=SrcBE_tem;
endmodule
