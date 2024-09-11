`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:03:25 11/11/2023 
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
module Mux2 #(parameter WIDTH=4)(
    input [WIDTH-1:0] In1,
	 input [WIDTH-1:0] In2,
	 input Slt,
	 output [WIDTH-1:0] Out
    );
assign Out=(Slt==1'b0)?In1:In2;

endmodule
