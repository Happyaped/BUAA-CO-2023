`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:15:24 11/11/2023 
// Design Name: 
// Module Name:    DM 
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
module DM(
    input [11:0] AddrIn,
    input [31:0] DataIn,
    input MemWrite,
    input reset,
    input clk,
	 input [31:0] pcaddr,
	 input [31:0] DataAddr,
    output [31:0] Out
    );
reg [31:0] DataMemory [3071:0];
integer i;
initial begin
for(i=0;i<3072;i=i+1)begin
DataMemory[i]<=0;
end
end
always @(posedge clk)begin
if(reset==1'b1)begin
for(i=0;i<3072;i=i+1)begin
DataMemory[i]<=0;
  end
  end
else begin
if(MemWrite==1'b1)begin
DataMemory[AddrIn]<=DataIn;
$display("%d@%h: *%h <= %h",$time,pcaddr, DataAddr, DataIn);
    end
  end  
end
assign Out=DataMemory[AddrIn];
endmodule
