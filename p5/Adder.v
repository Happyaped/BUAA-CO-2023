`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:16:58 11/11/2023 
// Design Name: 
// Module Name:    Adder 
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
module Adder #(parameter WIDTH=8)
(
    input [WIDTH-1:0] In1,
    input [WIDTH-1:0] In2,
    output [WIDTH-1:0]Out
    );
assign Out=In1+In2;

endmodule
