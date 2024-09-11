`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:58:18 11/11/2023 
// Design Name: 
// Module Name:    D_register 
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
module D_register(
    input clk,
	 input reset,
    input [31:0] Instr_F,
	 input [31:0] PC_F,
	 input [31:0] PCPlus4_F,
	 input En_D,
	 output [31:0] Instr_D,
	 output [31:0] PC_D,
	 output [31:0] PCPlus4_D
    );
reg [31:0] regInstr_D;
reg [31:0] regPC_D;
reg [31:0] regPCPlus4_D;
initial begin
regInstr_D<=0;
regPC_D<=0;
regPCPlus4_D<=0;
end
always @(posedge clk)begin
if(reset==1'b1)begin
regInstr_D<=0;
regPC_D<=0;
regPCPlus4_D<=0;
end
else begin
if(En_D==1'b0)begin
regInstr_D<=Instr_F;
regPC_D<=PC_F;
regPCPlus4_D<=PCPlus4_F;
  end
end  
end
assign Instr_D=regInstr_D;
assign PC_D=regPC_D;
assign PCPlus4_D=regPCPlus4_D;
endmodule
