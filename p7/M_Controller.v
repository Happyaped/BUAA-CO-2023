`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:18:22 11/15/2023 
// Design Name: 
// Module Name:    M_Controller 
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
module M_Controller(
   input Req,

   input [31:0] PC_M,
   input [31:0] Instr_M,
	input I0,
	input I1,
	output [3:0] MemWrite,
	output RegWrite,
	output ShSlt,
	output SbSlt,
	output LhSlt,
	output LbSlt,
	output [1:0] T_new,
	output [1:0] BEOp,
	output Store,
	output [1:0] DEOp,
	output Load,
	output CP0Write,
	output EXLClr,
	
	output M_mtc0
    );
wire [5:0] opcode;
wire [5:0] funcode;
wire [4:0] c0code;
assign c0code=Instr_M[25:21];
assign opcode=Instr_M[31:26];
assign funcode=Instr_M[5:0];
wire add;
wire sub;
wire lw;
wire lh;
wire lb;
wire sw;
wire sh;
wire sb;
wire ori;
wire beq;
wire bne;
wire lui;
wire jal;
wire jr;
wire andd;
wire orr;
wire slt;
wire sltu;
wire addi;
wire andi;
wire mfhi;
wire mflo;
wire nop;
wire syscall;
wire eret;
wire mfc0;
wire mtc0;
assign mtc0=(opcode==`Mtc0head&&c0code==`Mtc0tail);
assign mfc0=(opcode==`Mfc0head&&c0code==`Mfc0tail);
assign eret=(Instr_M==`Eret);
assign syscall=(opcode==`Rorder&&funcode==`Syscall);
assign add=(opcode==`Rorder&&funcode==`Add);
assign sub=(opcode==`Rorder&&funcode==`Sub);
assign ori=(opcode==`Ori);
assign beq=(opcode==`Beq);
assign bne=(opcode==`Bne);
assign lw=(opcode==`Lw);
assign lh=(opcode==`Lh);
assign lb=(opcode==`Lb);
assign sw=(opcode==`Sw);
assign sh=(opcode==`Sh);
assign sb=(opcode==`Sb);
assign lui=(opcode==`Lui);
assign jal=(opcode==`Jal);
assign jr=(opcode==`Rorder&&funcode==`Jr);
assign andd=(opcode==`Rorder&&funcode==`And);
assign orr=(opcode==`Rorder&&funcode==`Or);
assign slt=(opcode==`Rorder&&funcode==`Slt);
assign sltu=(opcode==`Rorder&&funcode==`Sltu);
assign addi=(opcode==`Addi);
assign andi=(opcode==`Andi);
assign mfhi=(opcode==`Rorder&&funcode==`Mfhi);
assign mflo=(opcode==`Rorder&&funcode==`Mflo);
assign nop=(opcode==`Rorder&&funcode==`Nop);
assign MemWrite=(Req==1'b1)?4'b0000:
(sw)?4'b1111:
(sh&&I1==1'b0)?4'b0011:
(sh&&I1==1'b1)?4'b1100:
(sb&&I1==1'b0&&I0==1'b0)?4'b0001:
(sb&&I1==1'b0&&I0==1'b1)?4'b0010:
(sb&&I1==1'b1&&I0==1'b0)?4'b0100:
(sb&&I1==1'b1&&I0==1'b1)?4'b1000:4'b0000;
assign RegWrite=(jal||add||sub||ori||lw||lui||andd||orr||slt||sltu||addi||andi||mfhi||mflo||lh||lb||mfc0)?1'b1:1'b0;
assign ShSlt=(sh)?1'b1:1'b0;
assign SbSlt=(sb)?1'b1:1'b0;
assign LhSlt=(lh)?1'b1:1'b0;
assign LbSlt=(lb)?1'b1:1'b0;
assign T_new=(lw||lh||lb||mfc0)?2'b01:2'b00;

assign BEOp=(sw)?2'b01:
            (sh)?2'b10:
				(sb)?2'b11:2'b00;
assign Store=(sw||sh||sb)?1'b1:1'b0;
assign DEOp=(lw)?2'b01:
            (lh)?2'b10:
				(lb)?2'b11:2'b00;
assign Load=(lw||lh||lb)?1'b1:1'b0;
assign CP0Write=(mtc0)?1'b1:1'b0;
assign EXLClr=(eret)?1'b1:1'b0;
assign M_mtc0=(mtc0)?1'b1:1'b0;
endmodule
