`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:11:03 11/14/2023 
// Design Name: 
// Module Name:    GetNum 
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
module GetNum(
    input [31:0] In,
    output [11:0] Out
    );
wire [31:0]shift2;
assign shift2={{2{1'b0}},In[31:2]};
assign Out=shift2[11:0];
endmodule
