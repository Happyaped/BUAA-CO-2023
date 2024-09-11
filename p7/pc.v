`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:06:32 11/14/2023 
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
    input [31:0] EPC,
    input D_eret,
    input Req,
    input [31:0] In1,
    input clk,
    input reset,
	 input stop,
    output [31:0] AddrOut
    );
reg [31:0] pc;
initial begin
pc<=0;
end
wire [31:0] mark;
assign mark=In1-32'h00003000;
always @(posedge clk)begin
if(reset==1'b1)begin
pc<=0;
  end
else begin
if(Req==1'b1)begin
pc<=32'h00001180;
     end
else if(stop==1'b0)begin
pc<=mark;
    end
  end  
end
assign AddrOut=pc+32'h00003000;
endmodule
