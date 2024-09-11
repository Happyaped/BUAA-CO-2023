`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:00:22 11/11/2023 
// Design Name: 
// Module Name:    Writeback 
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
module Writeback(
    input [31:0] Instr_W,
	 input [31:0] PC_W,
	 input [31:0] ReadData_W,
	 input [31:0] ALUOut_W,
	 input [4:0] WriteReg_W,
	 output [4:0] WriteReg_W_Out,
	 output [31:0] Result_W,
	 output RegWriteW,
	 output [1:0] T_new_W,
	 output [31:0] PC_W_Out
    );
wire MemtoReg;
Controller_W controllerw1(Instr_W,MemtoReg,RegWriteW,T_new_W);
Mux2 #(32) mux27(ALUOut_W,ReadData_W,MemtoReg,Result_W);
assign WriteReg_W_Out=WriteReg_W;
assign PC_W_Out=PC_W;
endmodule
