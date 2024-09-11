`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:43:37 11/11/2023 
// Design Name: 
// Module Name:    GRF 
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
module GRF(
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] WD,
    input clk,
    input reset,
    input RegWrite,
	 input [31:0] pcaddr,
    output [31:0] O1,
    output [31:0] O2
    );
reg [31:0] registers [31:0];
integer i;
assign O1=(A3==A1&&A1!=5'b00000&&RegWrite)?WD:registers[A1];
assign O2=(A3==A2&&A2!=5'b00000&&RegWrite)?WD:registers[A2];
initial begin
for(i=0;i<32;i=i+1)begin
registers[i]<=0;
end
end
always @(posedge clk)begin
if(reset==1'b1)begin
for(i=0;i<32;i=i+1)begin
registers[i]<=0;
    end
  end
else begin
if(RegWrite==1'b1)begin
if(A3!=5'b00000)begin
registers[A3]=WD;
    end
$display("%d@%h: $%d <= %h",$time,pcaddr,A3,WD);	 
	 end
  end  
end
endmodule