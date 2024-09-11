`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:23:12 11/11/2023 
// Design Name: 
// Module Name:    CMP 
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
module CMP #(parameter WIDTH=4)(
    input [WIDTH-1:0] In1,
    input [WIDTH-1:0] In2,
    output Out
    );
assign Out=(In1==In2)?1'b1:1'b0;

endmodule
