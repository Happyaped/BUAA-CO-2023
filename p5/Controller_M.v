`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:36:50 11/11/2023 
// Design Name: 
// Module Name:    Controller_M 
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
`include "head.v"
module Controller_M(
    input [31:0] Instr_M,
	 output MemWrite,
	 output RegWrite,
	 output [1:0] T_new
    );
wire [5:0] opcode;
wire [5:0] funcode;
assign opcode=Instr_M[31:26];
assign funcode=Instr_M[5:0];
wire add;
wire sub;
wire lw;
wire sw;
wire ori;
wire beq;
wire lui;
wire jal;
wire jr;
wire nop;
assign add=(opcode==`Rorder&&funcode==`Add);
assign sub=(opcode==`Rorder&&funcode==`Sub);
assign ori=(opcode==`Ori);
assign beq=(opcode==`Beq);
assign lw=(opcode==`Lw);
assign sw=(opcode==`Sw);
assign lui=(opcode==`Lui);
assign jal=(opcode==`Jal);
assign jr=(opcode==`Rorder&&funcode==`Jr);
assign nop=(opcode==`Rorder&&funcode==`Nop);
assign MemWrite=(sw)?1'b1:1'b0;
assign RegWrite=(jal||add||sub||ori||lw||lui)?1'b1:1'b0;
assign T_new=(lw)?2'b01:2'b00;
endmodule
