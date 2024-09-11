`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:59:30 11/11/2023 
// Design Name: 
// Module Name:    M_register 
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
module M_register(
    input clk,
	 input reset,
    input [31:0] Instr_E,
	 input [31:0] PC_E,
	 input [31:0] ALUOutE,
	 input [31:0] WriteDataE,
	 input [4:0] WriteRegE,
	 output [31:0] Instr_M,
	 output [31:0] PC_M,
	 output [31:0] ALUOutM,
	 output [31:0] WriteDataM,
	 output [4:0] WriteRegM 
    );
reg [31:0] regInstr_E;
reg [31:0] regPC_E;
reg [31:0] regALUOutE;
reg [31:0] regWriteDataE;
reg [4:0] regWriteRegE;
initial begin
regInstr_E<=0;
regPC_E<=0;
regALUOutE<=0;
regWriteDataE<=0;
regWriteRegE<=5'b00000;
end
assign Instr_M=regInstr_E;
assign PC_M=regPC_E;
assign ALUOutM=regALUOutE;
assign WriteDataM=regWriteDataE;
assign WriteRegM=regWriteRegE;
always @(posedge clk)begin
if(reset==1'b1)begin
regInstr_E<=0;
regPC_E<=0;
regALUOutE<=0;
regWriteDataE<=0;
regWriteRegE<=0;
end
else begin
regInstr_E<=Instr_E;
regPC_E<=PC_E;
regALUOutE<=ALUOutE;
regWriteDataE<=WriteDataE;
regWriteRegE<=WriteRegE;
  end
end


endmodule
