`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:01:19 11/11/2023 
// Design Name: 
// Module Name:    Controller_E 
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
module Controller_E(
    input [31:0] Instr,
    output ALUSrc,
    output OriSlt,
	 output RegWrite,
    output [1:0] ALUControl_E,
	 output [4:0] WriteReg_E,
	 output [1:0] T_new,
	 output LuiSlt,
	 output JalSlt
    );
wire [5:0] opcode;
wire [5:0] funcode;
wire [4:0] RtE;
wire [4:0] RdE;
wire RegDst;
assign RtE=Instr[20:16];
assign RdE=Instr[15:11];
assign opcode=Instr[31:26];
assign funcode=Instr[5:0];
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
assign RegDst=(add||sub)?1'b1:1'b0;
assign ALUSrc=(lw||sw)?1'b1:1'b0;
assign OriSlt=(ori)?1'b1:1'b0;
assign RegWrite=(jal||add||sub||ori||lw||lui)?1'b1:1'b0;
assign ALUControl_E=(sub||beq)?`Jian:
                  (ori)?`Huo:`Jia;
assign WriteReg_E=(jal)?5'b11111:
(RegDst)?RdE:RtE;
assign LuiSlt=(lui)?1'b1:1'b0;
assign JalSlt=(jal)?1'b1:1'b0;
assign T_new=(add||sub||ori||lui||jal)?2'b01:
(lw)?2'b10:2'b00;
endmodule
