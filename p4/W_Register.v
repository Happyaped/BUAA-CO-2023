`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:12:07 11/15/2023 
// Design Name: 
// Module Name:    W_Register 
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
module W_Register(
    input clk,
	 input reset,
    input [31:0] Instr_WR_In,
	 input [31:0] PC_WR_In,
	 input [4:0] WriteReg_WR_In,
	 input [31:0] ALUOut_WR_In,
	 input [31:0] DMOut_WR_In,
	 output [31:0] Instr_WR_Out,
	 output [31:0] PC_WR_Out,
	 output [4:0] WriteReg_WR_Out,
	 output [31:0] ALUOut_WR_Out,
	 output [31:0] DMOut_WR_Out
    );
reg [31:0] regInstr_WR;
reg [31:0] regPC_WR;
reg [4:0] regWriteReg_WR;
reg [31:0] regALUOut_WR;
reg [31:0] regDMOut_WR;
initial begin
regInstr_WR<=0;
regPC_WR<=0;
regWriteReg_WR<=0;
regALUOut_WR<=0;
regDMOut_WR<=0;
end
always @(posedge clk)begin
if(reset==1'b1)begin
regInstr_WR<=0;
regPC_WR<=0;
regWriteReg_WR<=0;
regALUOut_WR<=0;
regDMOut_WR<=0;
  end
else begin
regInstr_WR<=Instr_WR_In;
regPC_WR<=PC_WR_In;
regWriteReg_WR<=WriteReg_WR_In;
regALUOut_WR<=ALUOut_WR_In;
regDMOut_WR<=DMOut_WR_In;
  end  
end

assign Instr_WR_Out=regInstr_WR;
assign PC_WR_Out=regPC_WR;
assign WriteReg_WR_Out=regWriteReg_WR;
assign ALUOut_WR_Out=regALUOut_WR;
assign DMOut_WR_Out=regDMOut_WR;
endmodule
