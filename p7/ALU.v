`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:44 11/15/2023 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input Store_Ov,
	 input Load_Ov,
	 input Cal_Ov,

    input [31:0] In1,
    input [31:0] In2,
    input [3:0] ALUControl,
    output [31:0] Output,
	 
	 output Store_Ov_Out,
	 output Load_Ov_Out,
	 output Cal_Ov_Out
    );
wire [32:0] ext_In1;
wire [32:0] ext_In2;
wire [32:0] ext_add;
wire [32:0] ext_sub;
assign ext_In1={In1[31],In1};
assign ext_In2={In2[31],In2};
assign ext_add=ext_In1+ext_In2;
assign ext_sub=ext_In1-ext_In2;	 
assign Output=(ALUControl==4'b0000)?In1+In2:
(ALUControl==4'b0001)?In1-In2:
(ALUControl==4'b0010)?In1|In2:
(ALUControl==4'b0011)?In1&In2:
(ALUControl==4'b0100)?$signed(In1)<$signed(In2):
(ALUControl==4'b0101)?In1<In2:
0;
assign Store_Ov_Out=(Store_Ov)&&(ALUControl==4'b0000&&ext_add[32]!=ext_add[31]);
assign Load_Ov_Out=(Load_Ov)&&(ALUControl==4'b0000&&ext_add[32]!=ext_add[31]);
assign Cal_Ov_Out=(Cal_Ov)&&((ALUControl==4'b0000&&ext_add[32]!=ext_add[31])||
(ALUControl==4'b0001&&ext_sub[32]!=ext_sub[31]));
endmodule

