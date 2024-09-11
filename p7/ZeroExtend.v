`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:33:54 11/14/2023 
// Design Name: 
// Module Name:    ZeroExtend 
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
module ZeroExtend(
    input [15:0] In,
    output [31:0] Out
    );
assign Out={{16{1'b0}},In};

endmodule

