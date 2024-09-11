`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:23:44 11/14/2023 
// Design Name: 
// Module Name:    D_Register 
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
module D_Register(
    input [31:0] Instr_DR_In,
	 input [31:0] PC_DR_In,
	 input [31:0] PCPlus4_DR_In,
	 input clk,
	 input reset,
	 input Stop_DR,
	 output [31:0] Instr_DR_Out,
	 output [31:0] PC_DR_Out,
	 output [31:0] PCPlus4_DR_Out
    );
reg [31:0] regInstr_DR;
reg [31:0] regPC_DR;
reg [31:0] regPCPlus4_DR;
initial begin
regInstr_DR<=0;
regPC_DR<=0;
regPCPlus4_DR<=0;
end
always @(posedge clk)begin
if(reset==1'b1)begin
regInstr_DR<=0;
regPC_DR<=0;
regPCPlus4_DR<=0;
  end
else begin
if(Stop_DR==1'b0)begin
regInstr_DR<=Instr_DR_In;
regPC_DR<=PC_DR_In;
regPCPlus4_DR<=PCPlus4_DR_In;
    end
  end  
end
assign Instr_DR_Out=regInstr_DR;
assign PC_DR_Out=regPC_DR;
assign PCPlus4_DR_Out=regPCPlus4_DR;
endmodule
