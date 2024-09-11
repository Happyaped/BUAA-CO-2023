`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:36 11/11/2023 
// Design Name: 
// Module Name:    Mux3 
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
module Mux3 #(parameter WIDTH=4)(
    input [WIDTH-1:0] In1,
    input [WIDTH-1:0] In2,
	 input [WIDTH-1:0] In3,
    input [1:0] Slt,
    output [WIDTH-1:0] Out
    );
assign Out=(Slt==2'b00)?In1:
(Slt==2'b01)?In2:In3;

endmodule
