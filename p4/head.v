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
`define Sw 6'b101011
`define Beq 6'b000100
`define Lui 6'b001111
`define Jal 6'b000011
`define Jr 6'b001000
`define Jia 2'b00
`define Jian 2'b01
`define Huo 2'b10