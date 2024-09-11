`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:12:56 11/14/2023 
// Design Name: 
// Module Name:    IM 
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
module IM(
    input [11:0] In,
    output [31:0] Instr
    );
reg [31:0] InstrMemory [4095:0];
initial begin
$readmemh("code.txt",InstrMemory);  
end
assign Instr=InstrMemory[In];
endmodule
