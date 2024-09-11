`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:27:23 11/15/2023 
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
    input [31:0] CP0Data_W_In,

    input [31:0] Instr_W_In,
	 input [31:0] PC_W_In,
	 input [4:0] WriteReg_W_In,
	 input [31:0] ALUOut_W_In,
	 input [31:0] DMOut_W_In,
	 output [31:0] PC_W_Out,
	 output [31:0] Result_W_Out,
	 output [4:0] WriteReg_W_Out,
	 output RegWrite_W_Out,
	 output [1:0] T_new_W_Out
    );
wire MemtoReg;
wire Mfc0Slt;
wire [31:0] Result_W_Out_tem;
W_Controller wcontroller1(Instr_W_In,MemtoReg,RegWrite_W_Out,T_new_W_Out,Mfc0Slt);
Mux2 #(32) mux2w1(ALUOut_W_In,DMOut_W_In,MemtoReg,Result_W_Out_tem);
Mux2 #(32) mux2w2(Result_W_Out_tem,CP0Data_W_In,Mfc0Slt,Result_W_Out);
assign PC_W_Out=PC_W_In;
assign WriteReg_W_Out=WriteReg_W_In;
endmodule
