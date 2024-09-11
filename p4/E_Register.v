`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:13:40 11/14/2023 
// Design Name: 
// Module Name:    E_Register 
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
module E_Register(
    input clk,
	 input reset,
	 input clr_ER,
    input [31:0] Instr_ER_In,
	 input [31:0] PC_ER_In,
	 input [4:0] WriteReg_ER_In,
	 input [31:0] RD1_ER_In,
	 input [31:0] RD2_ER_In,
	 input [31:0] signextend_ER_In,
	 input [31:0] zeroextend_ER_In,
	 output [31:0] Instr_ER_Out,
	 output [31:0] PC_ER_Out,
	 output [4:0] WriteReg_ER_Out,
	 output [31:0] RD1_ER_Out,
	 output [31:0] RD2_ER_Out,
	 output [31:0] signextend_ER_Out,
	 output [31:0] zeroextend_ER_Out
    );
reg [31:0] regInstr_ER;
reg [31:0] regPC_ER;
reg [4:0] regWriteReg_ER;
reg [31:0] regRD1_ER;
reg [31:0] regRD2_ER;
reg [31:0] regsignextend_ER;
reg [31:0] regzeroextend_ER;
initial begin
regInstr_ER<=0;
regPC_ER<=0;
regWriteReg_ER<=0;
regRD1_ER<=0;
regRD2_ER<=0;
regsignextend_ER<=0;
regzeroextend_ER<=0;
end
always @(posedge clk)begin
if(reset==1'b1||clr_ER==1'b1)begin
regInstr_ER<=0;
regPC_ER<=0;
regWriteReg_ER<=0;
regRD1_ER<=0;
regRD2_ER<=0;
regsignextend_ER<=0;
regzeroextend_ER<=0;
  end
else begin
regInstr_ER<=Instr_ER_In;
regPC_ER<=PC_ER_In;
regWriteReg_ER<=WriteReg_ER_In;
regRD1_ER<=RD1_ER_In;
regRD2_ER<=RD2_ER_In;
regsignextend_ER<=signextend_ER_In;
regzeroextend_ER<=zeroextend_ER_In;
  end  
end
assign Instr_ER_Out=regInstr_ER;
assign PC_ER_Out=regPC_ER;
assign WriteReg_ER_Out=regWriteReg_ER;
assign RD1_ER_Out=regRD1_ER;
assign RD2_ER_Out=regRD2_ER;
assign signextend_ER_Out=regsignextend_ER;
assign zeroextend_ER_Out=regzeroextend_ER;
endmodule
