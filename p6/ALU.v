`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:44 11/15/2023 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [31:0] In1,
    input [31:0] In2,
    input [3:0] ALUControl,
    output [31:0] Output
    );
assign Output=(ALUControl==4'b0000)?In1+In2:
(ALUControl==4'b0001)?In1-In2:
(ALUControl==4'b0010)?In1|In2:
(ALUControl==4'b0011)?In1&In2:
(ALUControl==4'b0100)?$signed(In1)<$signed(In2):
(ALUControl==4'b0101)?In1<In2:
0;
endmodule

