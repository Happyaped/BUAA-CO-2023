`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:15:02 11/15/2023 
// Design Name: 
// Module Name:    M_Register 
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
module M_Register(
   input [4:0] ExcCode_MR_In,
	input isdelay_MR_In,
	input Req,
  
   input clk,
	input reset,
   input [31:0] Instr_WR_In,
	input [31:0] PC_WR_In,
	input [4:0] WriteReg_WR_In,
	input [31:0] ALUOut_WR_In,
	input [31:0] WriteData_WR_In,
	output [31:0] Instr_WR_Out,
	output [31:0] PC_WR_Out,
	output [4:0] WriteReg_WR_Out,
   output [31:0] ALUOut_WR_Out,
   output [31:0] WriteData_WR_Out,

   output [4:0] ExcCode_MR_Out,
   output isdelay_MR_Out	
    );
reg [31:0] regInstr_WR;
reg [31:0] regPC_WR;
reg [4:0] regWriteReg_WR;
reg [31:0] regALUOut_WR;
reg [31:0] regWriteData_WR;
reg [4:0] regExcCode_MR;
reg regisdelay_MR;
initial begin
regInstr_WR<=0;
regPC_WR<=0;
regWriteReg_WR<=0;
regALUOut_WR<=0;
regWriteData_WR<=0;
regExcCode_MR<=0;
regisdelay_MR<=0;
end
always @(posedge clk)begin
if(reset==1'b1)begin
regInstr_WR<=0;
regPC_WR<=0;
regWriteReg_WR<=0;
regALUOut_WR<=0;
regWriteData_WR<=0;
regExcCode_MR<=0;
regisdelay_MR<=0;
  end
else if(Req==1'b1)begin
regInstr_WR<=0;
regPC_WR<=32'h00004180;
regWriteReg_WR<=0;
regALUOut_WR<=0;
regWriteData_WR<=0;
regExcCode_MR<=0;
regisdelay_MR<=0;
  end
else begin
regInstr_WR<=Instr_WR_In;
regPC_WR<=PC_WR_In;
regWriteReg_WR<=WriteReg_WR_In;
regALUOut_WR<=ALUOut_WR_In;
regWriteData_WR<=WriteData_WR_In;
regExcCode_MR<=ExcCode_MR_In;
regisdelay_MR<=isdelay_MR_In;
  end  
end
assign Instr_WR_Out=regInstr_WR;
assign PC_WR_Out=regPC_WR;
assign WriteReg_WR_Out=regWriteReg_WR;
assign ALUOut_WR_Out=regALUOut_WR;
assign WriteData_WR_Out=regWriteData_WR;
assign ExcCode_MR_Out=regExcCode_MR;
assign isdelay_MR_Out=regisdelay_MR;
endmodule
