`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:09:02 11/11/2023 
// Design Name: 
// Module Name:    pc 
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
module pc(
    input [31:0] In1,
    input clk,
    input reset,
	 input PC_WrEn,
    output [31:0] NumOut,
    output [31:0] AddrOut
    );
reg [31:0] pc;
wire [31:0] mark;
assign mark=In1-32'h00003000;
initial begin
pc<=0;
end
always @(posedge clk)begin
if(reset==1'b1)begin
pc<=0;
  end
else begin
if(PC_WrEn==1'b0)begin
pc<=mark;
    end
  end  
end
assign NumOut=pc;
assign AddrOut=pc+32'h00003000;
endmodule