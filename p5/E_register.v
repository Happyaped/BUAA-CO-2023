`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:59:01 11/11/2023 
// Design Name: 
// Module Name:    E_register 
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
module E_register(
    input clk,
	 input clr,
	 input reset,
    input [31:0] Instr_D,
	 input [31:0] PC_D,
	 input [31:0] RD1_D,
	 input [31:0] RD2_D,
	 input [31:0] signextendout_D,
	 input [31:0] zeroextendout_D,
	 output [31:0] Instr_E,
	 output [31:0] PC_E,
	 output [31:0] RD1_E,
	 output [31:0] RD2_E,
	 output [31:0] signextendout_E,
	 output [31:0] zeroextendout_E
    );
reg [31:0] regInstr_D;
reg [31:0] regPC_D;
reg [31:0] regRD1_D;
reg [31:0] regRD2_D;
reg [31:0] regsignextendout_D;
reg [31:0] regzeroextendout_D;
initial begin
regInstr_D<=0;
regPC_D<=0;
regRD1_D<=0;
regRD2_D<=0;
regsignextendout_D<=0;
regzeroextendout_D<=0;
end
assign Instr_E=regInstr_D;
assign PC_E=regPC_D;
assign RD1_E=regRD1_D;
assign RD2_E=regRD2_D;
assign signextendout_E=regsignextendout_D;
assign zeroextendout_E=regzeroextendout_D;
always @(posedge clk)begin
if(clr==1'b1||reset==1'b1)begin
regInstr_D<=0;
regPC_D<=0;
regRD1_D<=0;
regRD2_D<=0;
regsignextendout_D<=0;
regzeroextendout_D<=0;
  end
else begin
regInstr_D<=Instr_D;
regPC_D<=PC_D;
regRD1_D<=RD1_D;
regRD2_D<=RD2_D;
regsignextendout_D<=signextendout_D;
regzeroextendout_D<=zeroextendout_D;
  end
end
endmodule
