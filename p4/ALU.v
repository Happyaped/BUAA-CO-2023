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
    input [1:0] ALUControl,
    output [31:0] Output
    );
assign Output=(ALUControl==2'b00)?In1+In2:
(ALUControl==2'b01)?In1-In2:
(ALUControl==2'b10)?In1|In2:
0;
endmodule

