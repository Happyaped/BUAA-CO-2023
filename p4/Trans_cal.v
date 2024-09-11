`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:54:31 11/15/2023 
// Design Name: 
// Module Name:    Trans_cal 
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
module Trans_cal(
    input [4:0] RsD_T,
	 input [4:0] RtD_T,
	 input [4:0] RsE_T,
	 input [4:0] RtE_T,
	 input [4:0] RtM_T,
	 input [4:0] WriteRegE_T,
	 input [4:0] WriteRegM_T,
	 input [4:0] WriteRegW_T,
	 input RegWriteE_T,
	 input RegWriteM_T,
	 input RegWriteW_T,
	 input [1:0] rs_T_use,
	 input [1:0] rt_T_use,
	 input [1:0] T_new_E,
	 input [1:0] T_new_M,
	 input [1:0] T_new_W,
	 output [1:0] T_D_Out1,
	 output [1:0] T_D_Out2,
	 output [1:0] T_E_Out1,
	 output [1:0] T_E_Out2,
	 output T_M_Out1,
	 output Stop_T_Out
    );
wire Stop_DE_rs;
wire Stop_DE_rt;
wire Stop_DM_rs;
wire Stop_DM_rt;

assign Stop_DE_rs=(RsD_T==WriteRegE_T&&RsD_T!=5'b00000&&RegWriteE_T&&rs_T_use<T_new_E)?1'b1:1'b0;
assign Stop_DE_rt=(RtD_T==WriteRegE_T&&RtD_T!=5'b00000&&RegWriteE_T&&rt_T_use<T_new_E)?1'b1:1'b0;
assign Stop_DM_rs=(RsD_T==WriteRegM_T&&RsD_T!=5'b00000&&RegWriteM_T&&rs_T_use<T_new_M)?1'b1:1'b0;
assign Stop_DM_rt=(RtD_T==WriteRegM_T&&RtD_T!=5'b00000&&RegWriteM_T&&rt_T_use<T_new_M)?1'b1:1'b0;
assign Stop_T_Out=Stop_DE_rs|Stop_DE_rt|Stop_DM_rs|Stop_DM_rt;

assign T_D_Out1=(RsD_T==WriteRegE_T&&RsD_T!=5'b00000&&RegWriteE_T&&T_new_E==2'b00)?2'b10:
                (RsD_T==WriteRegM_T&&RsD_T!=5'b00000&&RegWriteM_T&&T_new_M==2'b00)?2'b01:2'b00;
assign T_D_Out2=(RtD_T==WriteRegE_T&&RtD_T!=5'b00000&&RegWriteE_T&&T_new_E==2'b00)?2'b10:
                (RtD_T==WriteRegM_T&&RtD_T!=5'b00000&&RegWriteM_T&&T_new_M==2'b00)?2'b01:2'b00;
assign T_E_Out1=(RsE_T==WriteRegM_T&&RsE_T!=5'b00000&&RegWriteM_T&&T_new_M==2'b00)?2'b10:
                (RsE_T==WriteRegW_T&&RsE_T!=5'b00000&&RegWriteW_T&&T_new_W==2'b00)?2'b01:2'b00;
assign T_E_Out2=(RtE_T==WriteRegM_T&&RtE_T!=5'b00000&&RegWriteM_T&&T_new_M==2'b00)?2'b10:
                (RtE_T==WriteRegW_T&&RtE_T!=5'b00000&&RegWriteW_T&&T_new_W==2'b00)?2'b01:2'b00;
assign T_M_Out1=(RtM_T==WriteRegW_T&&RtM_T!=5'b00000&&RegWriteW_T&&T_new_W==2'b00)?1'b1:1'b0;
endmodule
