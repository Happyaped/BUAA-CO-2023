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
assign MemtoReg=(lw)?1'b1:1'b0;
assign RegWrite=(jal||add||sub||ori||lw||lui)?1'b1:1'b0;
assign T_new=2'b00;
endmodule
