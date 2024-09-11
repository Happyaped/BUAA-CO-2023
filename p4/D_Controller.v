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
    input [31:0] Instr_D,
	 output [1:0] RegDst,
	 output Beq_Branch,
	 output JalSlt,
	 output JrSlt,
	 output [1:0] rs_use,
	 output [1:0] rt_use
    );
wire [5:0] opcode;
wire [5:0] funcode;
assign opcode=Instr_D[31:26];
assign funcode=Instr_D[5:0];
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
assign Beq_Branch=(beq)?1'b1:1'b0;
assign JalSlt=(jal)?1'b1:1'b0;
assign JrSlt=(jr)?1'b1:1'b0;
assign RegDst=(add||sub)?2'b01:
(jal)?2'b10:2'b00;
assign rs_use=(lui||nop||jal)?2'b11:
(add||sub||ori||lw||sw)?2'b01:2'b00;
assign rt_use=(ori||lw||lui||nop||jal||jr)?2'b11:
(sw)?2'b10:
(add||sub)?2'b01:2'b00;
endmodule
