`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:49:53 11/14/2023 
// Design Name: 
// Module Name:    head 
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
`define Rorder 6'b000000
`define Add 6'b100000
`define Sub 6'b100010
`define Nop 6'b000000
`define Ori 6'b001101
`define Lw 6'b100011
`define Lh 6'b100001
`define Lb 6'b100000
`define Sw 6'b101011
`define Sh 6'b101001
`define Sb 6'b101000
`define Beq 6'b000100
`define Lui 6'b001111
`define Jal 6'b000011
`define Jr 6'b001000
`define And 6'b100100
`define Or 6'b100101
`define Slt 6'b101010
`define Sltu 6'b101011
`define Addi 6'b001000
`define Andi 6'b001100
`define Bne 6'b000101
`define Mult 6'b011000
`define Multu 6'b011001
`define Div 6'b011010
`define Divu 6'b011011
`define Mthi 6'b010001
`define Mtlo 6'b010011
`define Mfhi 6'b010000
`define Mflo 6'b010010
`define Syscall 6'b001100
`define Eret 32'b01000010000000000000000000011000
`define Mfc0head 6'b010000
`define Mfc0tail 5'b00000
`define Mtc0head 6'b010000
`define Mtc0tail 5'b00100

`define Jia 4'b0000
`define Jian 4'b0001
`define Huo 4'b0010
`define He 4'b0011
`define SltCs 4'b0100
`define SltuCs 4'b0101

`define DMStart 32'h00000000
`define DMEnd 32'h00002fff
`define TC1Start 32'h00007f00
`define TC1End 32'h00007f0b
`define TC2Start 32'h00007f10
`define TC2End 32'h00007f1b
`define StopperStart 32'h00007f20
`define StopperEnd 32'h00007f23