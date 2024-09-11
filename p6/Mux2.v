`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:16:35 11/15/2023 
// Design Name: 
// Module Name:    Mux2 
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
module Mux2 #(parameter WIDTH=8)
(
    input [WIDTH-1:0] In0,
    input [WIDTH-1:0] In1,
    input Slt,
    output [WIDTH-1:0]Out
    );
assign Out=(Slt==0)?In0:In1;

endmodule