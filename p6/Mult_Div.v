`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:21:12 11/22/2023 
// Design Name: 
// Module Name:    Mult_Div 
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
`include "head.v"
module Mult_Div(
   input clk,
	input reset,
   input [31:0] Instr,
	input [31:0] In1,
	input [31:0] In2,
	output [31:0] Hi,
	output [31:0] Lo,
	output Stop_MD
    );
wire [5:0] opcode;
wire [5:0] funcode;
assign opcode=Instr[31:26];
assign funcode=Instr[5:0];
wire mult;
wire multu;
wire div;
wire divu;
wire mthi;
wire mtlo;
assign mult=(opcode==`Rorder&&funcode==`Mult);
assign multu=(opcode==`Rorder&&funcode==`Multu);
assign div=(opcode==`Rorder&&funcode==`Div);
assign divu=(opcode==`Rorder&&funcode==`Divu);
assign mthi=(opcode==`Rorder&&funcode==`Mthi);
assign mtlo=(opcode==`Rorder&&funcode==`Mtlo);
wire Start;
assign Start=(mult||multu||div||divu)?1'b1:1'b0;
integer i;
reg Busy;
reg [5:0]count;
reg [31:0] hi;
reg [31:0] lo;
reg [31:0] hi_tem;
reg [31:0] lo_tem;
initial begin
Busy<=0;
count<=0;
hi<=0;
lo<=0;
hi_tem<=0;
lo_tem<=0;
i<=0;
end
always @(posedge clk)begin
if(reset==1'b1)begin
Busy<=0;
count<=0;
hi<=0;
lo<=0;
hi_tem<=0;
lo_tem<=0;
i<=0;
  end
else if(mthi==1'b1)begin
hi<=In1;
  end
else if(mtlo==1'b1)begin
lo<=In1;
  end
else if(Start==1'b1)begin
i<=0;
if(mult==1'b1)begin
count<=5;
Busy<=1'b1;
{hi_tem,lo_tem}<=$signed(In1)*$signed(In2);
    end
else if(multu==1'b1)begin
count<=5;
Busy<=1'b1;
{hi_tem,lo_tem}<=In1*In2;
    end
else if(div==1'b1)begin
count<=10;
Busy<=1'b1;
hi_tem<=$signed(In1)%$signed(In2);
lo_tem<=$signed(In1)/$signed(In2);
    end
else if(divu==1'b1)begin
count<=10;
Busy<=1'b1;
hi_tem<=In1%In2;
lo_tem<=In1/In2;
    end	 
  end
else if(i<count&&Busy==1'b1)begin
i=i+1;
  end
else if(i==count&&Busy==1'b1)begin
hi<=hi_tem;
lo<=lo_tem;
Busy<=1'b0;
  end  
end
assign Hi=hi;
assign Lo=lo;
assign Stop_MD=Busy|Start;

endmodule
