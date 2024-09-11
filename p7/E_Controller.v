`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:49:04 11/15/2023 
// Design Name: 
// Module Name:    E_Controller 
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
module E_Controller(
    input [31:0] Instr_E,
	 output [3:0] ALUControll,
	 output ALUSrc,
	 output OriSlt,
	 output JalSlt,
	 output LuiSlt,
	 output RegWrite,
	 output MfhiSlt,
	 output MfloSlt,
	 output [1:0] T_new_E,
	 
	 output Store_Ov,
	 output Load_Ov,
	 output Cal_Ov,
	 output E_mtc0
    );
wire [5:0] opcode;
wire [5:0] funcode;
wire [4:0] c0code;
assign c0code=Instr_E[25:21];
assign opcode=Instr_E[31:26];
assign funcode=Instr_E[5:0];
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
assign eret=(Instr_E==`Eret);
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
assign ALUControll=(sub||beq||bne)?`Jian:
                  (ori||orr)?`Huo:
						(andd||andi)?`He:
						(slt)?`SltCs:
						(sltu)?`SltuCs:
						`Jia;
assign ALUSrc=(lw||sw||addi||lh||lb||sh||sb)?1'b1:1'b0;
assign OriSlt=(ori||andi)?1'b1:1'b0;
assign JalSlt=(jal)?1'b1:1'b0;
assign LuiSlt=(lui)?1'b1:1'b0;
assign MfhiSlt=(mfhi)?1'b1:1'b0;
assign MfloSlt=(mflo)?1'b1:1'b0;
assign RegWrite=(jal||add||sub||ori||lw||lui||andd||orr||slt||sltu||addi||andi||mfhi||mflo||lh||lb||mfc0)?1'b1:1'b0;
assign T_new_E=(lw||lh||lb||mfc0)?2'b10:
(add||sub||ori||lui||andd||orr||slt||sltu||addi||andi||mfhi||mflo)?2'b01:2'b00;	

assign Store_Ov=(sw||sh||sb)?1'b1:1'b0;
assign Load_Ov=(lw||lh||lb)?1'b1:1'b0;
assign Cal_Ov=(add||sub||addi)?1'b1:1'b0;	
assign E_mtc0=(mtc0)?1'b1:1'b0;				
endmodule
