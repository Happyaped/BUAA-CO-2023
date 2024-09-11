`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:59:47 11/11/2023 
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
	 input [31:0] Instr_M,
	 input [31:0] PC_M,
	 input [31:0] ALUOutM,
	 input [31:0] WriteDataM,
	 input [4:0] WriteRegM,
	 output [31:0] Instr_M_Out,
	 output [31:0] PC_M_Out,
	 output [4:0] WriteRegM_Out,
	 output [31:0] ReadDataM,
	 output [31:0] ALUOutM_Out,
	 output RegWrite_M,
	 output [1:0] T_new_M
    );
wire [11:0] DMIn;
wire MemWriteM;
GetNum getnum2(ALUOutM,DMIn);
DM dm1(DMIn,WriteDataM,MemWriteM,reset,clk,PC_M,ALUOutM,ReadDataM);
assign Instr_M_Out=Instr_M;
assign PC_M_Out=PC_M;
assign WriteRegM_Out=WriteRegM;
assign ALUOutM_Out=ALUOutM;
Controller_M controllerm1(Instr_M,MemWriteM,RegWrite_M,T_new_M);
endmodule
