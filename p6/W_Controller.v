`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:32:19 11/15/2023 
// Design Name: 
// Module Name:    W_Controller 
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
module W_Controller(
    input [31:0] Instr_W,
	 output MemtoReg,
	 output RegWrite,
	 output [1:0] T_new
    );
wire [5:0] opcode;
wire [5:0] funcode;
assign opcode=Instr_W[31:26];
assign funcode=Instr_W[5:0];
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
assign mfhi=(opcode==`Rorder&&funcode==`Mfhi);
assign mflo=(opcode==`Rorder&&funcode==`Mflo);
assign nop=(opcode==`Rorder&&funcode==`Nop);
assign MemtoReg=(lw||lh||lb)?1'b1:1'b0;
assign RegWrite=(jal||add||sub||ori||lw||lui||andd||orr||slt||sltu||addi||andi||mfhi||mflo||lh||lb)?1'b1:1'b0;
assign T_new=2'b00;
endmodule
