`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:34:30 12/01/2023 
// Design Name: 
// Module Name:    CP0 
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
module CP0(
    input [4:0] A1,
    input [4:0] A2,
    input [31:0] Din,
    input CP0Write,
    input [31:0] EPC_In,
    input [4:0] ExcCode_In,
    input isdelay_In,
    input [5:0] HWInt,
    input EXLClr,
	 input clk,
	 input reset,
	 output Req,
	 output [31:0] EPC_Out,
	 output [31:0] Data_Out,
	 output CP0IntResponse
    );
reg [31:0] SR;
reg [31:0] EPC;
reg [31:0] Cause;
wire IE;
wire EXL;
wire [5:0] IM;
wire [5:0] IP;
wire IntReq;
wire InsideReq;
wire specialmark;
assign specialmark=(HWInt[2]&IM[2])&IE&!EXL;
assign IE=SR[0];
assign EXL=SR[1];
assign IM=SR[15:10];
assign IP=Cause[15:10];
assign IntReq=|(HWInt[5:0]&IM[5:0])&IE&!EXL;
assign InsideReq=(EXL==1'b0&&ExcCode_In!=0)?1'b1:1'b0;
assign Req=IntReq|InsideReq;
assign Data_Out=(A1==12)?SR:
                (A1==13)?Cause:
					 (A1==14)?EPC:0;
assign EPC_Out=EPC;
assign CP0IntResponse=(specialmark==1'b1)?1'b1:1'b0;
initial begin
SR<=0;
EPC<=0;
Cause<=0;
end
always @(posedge clk)begin
if(reset==1'b1)begin
SR<=0;
EPC<=0;
Cause<=0;
  end
else begin
if(Req==1'b1)begin
SR[1]<=1'b1;
Cause[31]<=isdelay_In;
Cause[6:2]<=(IntReq==1'b1)?0:ExcCode_In;
EPC<=(isdelay_In==1'b1)?EPC_In-4:EPC_In;	 
    end	
else if(CP0Write==1'b1)begin
if(A2==12)begin
SR<=Din;
      end
else if(A2==13)begin
Cause<=Din;
      end	//delete read only
else if(A2==14)begin
EPC<=Din;
      end		
    end
if(EXLClr==1'b1)begin
SR[1]<=1'b0;
    end 
Cause[15:10]<=HWInt;
  end  
end


endmodule
