`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:42:49 11/14/2023 
// Design Name: 
// Module Name:    D_Controller 
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
module D_Controller(
    input BeqSlt,
	 input BneSlt,

    input [31:0] Instr_D,
	 output [1:0] RegDst,
	 output Beq_Branch,
	 output JalSlt,
	 output JrSlt,
	 output Bne_Branch,
	 output Stop_D,
	 output [1:0] rs_use,
	 output [1:0] rt_use,
	 
	 output D_AdEL,
	 output D_eret,
	 output D_jump,
	 output Err_Syscall
    );
wire [5:0] opcode;
wire [5:0] funcode;
wire [4:0] c0code;
assign opcode=Instr_D[31:26];
assign funcode=Instr_D[5:0];
assign c0code=Instr_D[25:21];
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
wire lui;
wire jal;
wire jr;
wire andd;
wire orr;
wire slt;
wire sltu;
wire addi;
wire andi;
wire bne;
wire mult;
wire multu;
wire div;
wire divu;
wire mthi;
wire mtlo;
wire mfhi;
wire mflo;
wire nop;
wire syscall;
wire eret;
wire mfc0;
wire mtc0;
assign mtc0=(opcode==`Mtc0head&&c0code==`Mtc0tail);
assign mfc0=(opcode==`Mfc0head&&c0code==`Mfc0tail);
assign eret=(Instr_D==`Eret);
assign syscall=(opcode==`Rorder&&funcode==`Syscall);
assign add=(opcode==`Rorder&&funcode==`Add);
assign sub=(opcode==`Rorder&&funcode==`Sub);
assign ori=(opcode==`Ori);
assign beq=(opcode==`Beq);
assign bne=(opcode==`Bne);
assign lw=(opcode==`Lw);
assign sw=(opcode==`Sw);
assign lh=(opcode==`Lh);
assign lb=(opcode==`Lb);
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
assign mult=(opcode==`Rorder&&funcode==`Mult);
assign multu=(opcode==`Rorder&&funcode==`Multu);
assign div=(opcode==`Rorder&&funcode==`Div);
assign divu=(opcode==`Rorder&&funcode==`Divu);
assign mthi=(opcode==`Rorder&&funcode==`Mthi);
assign mtlo=(opcode==`Rorder&&funcode==`Mtlo);
assign mfhi=(opcode==`Rorder&&funcode==`Mfhi);
assign mflo=(opcode==`Rorder&&funcode==`Mflo);
assign nop=(opcode==`Rorder&&funcode==`Nop);
assign Beq_Branch=(beq)?1'b1:1'b0;
assign Bne_Branch=(bne)?1'b1:1'b0;
assign JalSlt=(jal)?1'b1:1'b0;
assign JrSlt=(jr)?1'b1:1'b0;
assign Stop_D=(mult||multu||div||divu||mfhi||mflo||mthi||mtlo)?1'b1:1'b0;
assign RegDst=(add||sub||andd||orr||slt||sltu||mfhi||mflo)?2'b01:
(jal)?2'b10:2'b00;
assign rs_use=(add||sub||ori||lw||sw||andd||orr||slt||sltu||addi||andi||mthi||mtlo||div||divu||mult||multu||lh||lb||sh||sb)?2'b01:
(beq||jr||bne)?2'b00:2'b11;
assign rt_use=(sw||sh||sb||mtc0)?2'b10:
(add||sub||andd||orr||slt||sltu||div||divu||mult||multu)?2'b01:
(beq||bne)?2'b00:2'b11;
assign D_AdEL=!(nop|andd|add|sub|orr|slt|sltu|lui|addi|andi|ori|lw|lh|lb|sw|sh|sb|mult|multu|
div|divu|mthi|mtlo|mfhi|mflo|beq|bne|jal|jr|mfc0|mtc0|eret|syscall);
assign D_eret=(eret)?1'b1:1'b0;
assign D_jump=(beq||bne||jal||jr)?1'b1:1'b0;
assign Err_Syscall=(syscall)?1'b1:1'b0;
endmodule
