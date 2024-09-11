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
	 output [1:0] ALUControll,
	 output ALUSrc,
	 output OriSlt,
	 output JalSlt,
	 output LuiSlt,
	 output RegWrite,
	 output [1:0] T_new_E
    );
wire [5:0] opcode;
wire [5:0] funcode;
assign opcode=Instr_E[31:26];
assign funcode=Instr_E[5:0];
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
assign ALUControll=(sub||beq)?`Jian:
                  (ori)?`Huo:`Jia;
assign ALUSrc=(lw||sw)?1'b1:1'b0;
assign OriSlt=(ori)?1'b1:1'b0;
assign JalSlt=(jal)?1'b1:1'b0;
assign LuiSlt=(lui)?1'b1:1'b0;
assign RegWrite=(jal||add||sub||ori||lw||lui)?1'b1:1'b0;
assign T_new_E=(lw)?2'b10:
(add||sub||ori||lui)?2'b01:2'b00;						
endmodule
