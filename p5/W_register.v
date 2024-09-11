`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:00:06 11/11/2023 
// Design Name: 
// Module Name:    W_register 
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
module W_register(
    input clk,
	 input reset,
    input [31:0] Instr_M,
	 input [31:0] PC_M,
	 input [4:0] WriteReg_M,
	 input [31:0] ReadData_M,
	 input [31:0] ALUOut_M,
	 output [31:0] Instr_W,
	 output [31:0] PC_W,
	 output [4:0] WriteReg_W,
	 output [31:0] ReadData_W,
	 output [31:0] ALUOut_W
    );
reg [31:0] regInstr_M;
reg [31:0] regPC_M;
reg [4:0] regWriteReg_M;
reg [31:0] regReadData_M;
reg [31:0] regALUOut_M;
initial begin
regInstr_M<=0;
regPC_M<=0;
regWriteReg_M<=5'b00000;
regReadData_M<=0;
regALUOut_M<=0;
end
assign Instr_W=regInstr_M;
assign PC_W=regPC_M;
assign WriteReg_W=regWriteReg_M;
assign ReadData_W=regReadData_M;
assign ALUOut_W=regALUOut_M;
always @(posedge clk)begin
if(reset==1'b1)begin
regInstr_M<=0;
regPC_M<=0;
regWriteReg_M<=0;
regReadData_M<=0;
regALUOut_M<=0;
end
else begin
regInstr_M<=Instr_M;
regPC_M<=PC_M;
regWriteReg_M<=WriteReg_M;
regReadData_M<=ReadData_M;
regALUOut_M<=ALUOut_M;
  end
end

endmodule
