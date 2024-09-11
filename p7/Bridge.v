`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:25:08 12/02/2023 
// Design Name: 
// Module Name:    Bridge 
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
module Bridge(
    input [31:0] m_data_rdata_tem,//from outside
	 input [31:0] m_data_addr_tem,//from inside
	 input [31:0] m_data_wdata_tem,//from inside
	 input [3:0] m_data_byteen_tem,//from inside
	 input [31:0] TC1_Data_In,//from TC1
	 input [31:0] TC2_Data_In,//from TC2
	 
	 output [31:0] m_data_rdata,//to inside
	 output [31:0] m_data_addr,//to outside
	 output [31:0] m_data_wdata,//to outside
	 output [3:0] m_data_byteen,//to outside
	 output [31:2] TC1_Addr_Out,//to TC1
	 output TC1Write,//to TC1
	 output [31:0] TC1_WData_Out,//to TC1
	 output [31:2] TC2_Addr_Out,//to TC2
	 output TC2Write,//to TC2
	 output [31:0] TC2_WData_Out,//to TC2
	 output [31:0] m_int_addr,//to int
	 output [3:0] m_int_byteen//to int
    );

wire [3:0] mark;
assign mark=(m_data_addr_tem>=`DMStart&&m_data_addr_tem<=`DMEnd)?4'b0001://DM
            (m_data_addr_tem>=`TC1Start&&m_data_addr_tem<=`TC1End)?4'b0010://TC1
				(m_data_addr_tem>=`TC2Start&&m_data_addr_tem<=`TC2End)?4'b0011://TC2
				(m_data_addr_tem>=`StopperStart&&m_data_addr_tem<=`StopperEnd)?4'b0100:4'b0000;//Stopper
assign m_data_rdata=(mark==4'b0001)?m_data_rdata_tem:
                    (mark==4'b0010)?TC1_Data_In:
						  (mark==4'b0011)?TC2_Data_In:0;
assign m_data_addr=m_data_addr_tem;
assign m_data_wdata=m_data_wdata_tem;
assign m_data_byteen=(mark==4'b0001)?m_data_byteen_tem:0;
assign TC1_Addr_Out=m_data_addr_tem[31:2];
assign TC1Write=(mark==4'b0010&&m_data_byteen_tem==4'b1111)?1'b1:1'b0;
assign TC1_WData_Out=m_data_wdata_tem;
assign TC2_Addr_Out=m_data_addr_tem[31:2];
assign TC2Write=(mark==4'b0011&&m_data_byteen_tem==4'b1111)?1'b1:1'b0;
assign TC2_WData_Out=m_data_wdata_tem;
assign m_int_addr=(mark==4'b0100&&m_data_byteen_tem!=0)?32'h00007f20:0;
assign m_int_byteen=(mark==4'b0100&&m_data_byteen_tem!=0)?4'b1111:0;					  

endmodule
