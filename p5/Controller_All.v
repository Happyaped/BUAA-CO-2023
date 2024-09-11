`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:58:49 11/12/2023 
// Design Name: 
// Module Name:    Controller_All 
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
module Controller_All(
    input [4:0] RsD,
    input [4:0] RtD,
    input [4:0] RsE,
    input [4:0] RtE,
    input [4:0] WriteReg_E,
    input [4:0] WriteReg_M,
    input [4:0] WriteReg_W,
    input [1:0] rs_use,
	 input [1:0] rt_use,
    input [1:0] T_new_E,
    input [1:0] T_new_M,
    input [1:0] T_new_W,
	 input RegWriteE,
	 input RegWriteM,
	 input RegWriteW,
    output [1:0] ForwardAE,
    output [1:0] ForwardBE,
    output ForwardAD,
    output ForwardBD,
    output Stop
    );
wire stop_rs_E=(RsD==WriteReg_E)&(RsD!=5'b00000)&(rs_use<T_new_E)&(RegWriteE);
wire stop_rt_E=(RtD==WriteReg_E)&(RtD!=5'b00000)&(rt_use<T_new_E)&(RegWriteE);
wire stop_rs_M=(RsD==WriteReg_M)&(RsD!=5'b00000)&(rs_use<T_new_M)&(RegWriteM);
wire stop_rt_M=(RtD==WriteReg_M)&(RtD!=5'b00000)&(rt_use<T_new_M)&(RegWriteM);
assign Stop=stop_rs_E|stop_rt_E|stop_rs_M|stop_rt_M;
assign ForwardAD=(RsD==WriteReg_M&&RsD!=5'b00000&&RegWriteM==1'b1&&T_new_M==2'b00)?1'b1:1'b0;
assign ForwardBD=(RtD==WriteReg_M&&RtD!=5'b00000&&RegWriteM==1'b1&&T_new_M==2'b00)?1'b1:1'b0;
assign ForwardAE=(RsE==WriteReg_M&&RsE!=5'b00000&&RegWriteM==1'b1&&T_new_M==2'b00)?2'b10:
(RsE==WriteReg_W&&RsE!=5'b00000&&RegWriteW==1'b1&&T_new_W==2'b00)?2'b01:2'b00;
assign ForwardBE=(RtE==WriteReg_M&&RtE!=5'b00000&&RegWriteM==1'b1&&T_new_M==2'b00)?2'b10:
(RtE==WriteReg_W&&RtE!=5'b00000&&RegWriteW==1'b1&&T_new_W==2'b00)?2'b01:2'b00;
endmodule
