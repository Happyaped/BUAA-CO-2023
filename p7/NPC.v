`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:46:38 11/15/2023 
// Design Name: 
// Module Name:    NPC 
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
module NPC(
    input [31:0] EPC_NPC_In,
	 input D_eret,
	 input Req,

    input [31:0] PCPlus4_NPC_In,
	 input [31:0] BeqOut_NPC_In,
	 input [31:0] JalOut_NPC_In,
	 input [31:0] JrOut_NPC_In,
	 input BeqSlt_NPC_In,
	 input JalSlt_NPC_In,
	 input JrSlt_NPC_In,
	 input [31:0] BneOut_NPC_In,
	 input BneSlt_NPC_In,
	 output [31:0] AddrOut_NPC_Out
    );
wire [31:0] AddrOut_NPC_tem1;
wire [31:0] AddrOut_NPC_tem2;
wire [31:0] AddrOut_NPC_tem3;
wire [31:0] AddrOut_NPC_tem4;
wire [31:0] AddrOut_NPC_tem5;
wire [31:0] EPC_NPC_In_tem;
assign EPC_NPC_In_tem=EPC_NPC_In+32'h00000004;
Mux2 #(32) mux2npc1(PCPlus4_NPC_In,BeqOut_NPC_In,BeqSlt_NPC_In,AddrOut_NPC_tem1);
Mux2 #(32) mux2npc2(AddrOut_NPC_tem1,JalOut_NPC_In,JalSlt_NPC_In,AddrOut_NPC_tem2);
Mux2 #(32) mux2npc3(AddrOut_NPC_tem2,JrOut_NPC_In,JrSlt_NPC_In,AddrOut_NPC_tem3);
Mux2 #(32) mux2npc4(AddrOut_NPC_tem3,BneOut_NPC_In,BneSlt_NPC_In,AddrOut_NPC_tem4);
Mux2 #(32) mux2npc5(AddrOut_NPC_tem4,EPC_NPC_In_tem,D_eret,AddrOut_NPC_tem5);
Mux2 #(32) mux2npc6(AddrOut_NPC_tem5,32'h00004180,Req,AddrOut_NPC_Out);

endmodule