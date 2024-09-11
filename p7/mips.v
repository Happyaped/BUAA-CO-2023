`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:55:06 12/02/2023 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,                    // 时钟信号
    input reset,                  // 同步复位信号
    input interrupt,              // 外部中断信号
    output [31:0] macroscopic_pc, // 宏观 PC

    output [31:0] i_inst_addr,    // IM 读取地址（取指 PC）
    input  [31:0] i_inst_rdata,   // IM 读取数据

    output [31:0] m_data_addr,    // DM 读写地址
    input  [31:0] m_data_rdata,   // DM 读取数据
    output [31:0] m_data_wdata,   // DM 待写入数据
    output [3 :0] m_data_byteen,  // DM 字节使能信号

    output [31:0] m_int_addr,     // 中断发生器待写入地址
    output [3 :0] m_int_byteen,   // 中断发生器字节使能信号

    output [31:0] m_inst_addr,    // M 级 PC

    output w_grf_we,              // GRF 写使能信号
    output [4 :0] w_grf_addr,     // GRF 待写入寄存器编号
    output [31:0] w_grf_wdata,    // GRF 待写入数据

    output [31:0] w_inst_addr     // W 级 PC
    );

wire [29:0] TC1Addr;
wire TC1Write_In;
wire [31:0] TC1Din;
wire [31:0] TC1Data_Out;
wire TC1IRQ;
wire [31:0] m_data_rdata_B_In;
wire [31:0] m_data_addr_B_In;
wire [31:0] m_data_wdata_B_In;
wire [3:0] m_data_byteen_B_In;
wire [31:0] TC1_B_In;
wire [31:0] TC2_B_In;
wire [31:0] m_data_rdata_B_Out;
wire [31:0] m_data_addr_B_Out;
wire [31:0] m_data_wdata_B_Out;
wire [3:0] m_data_byteen_B_Out;
wire [29:0] TC1Addr_B_Out;
wire TC1Write_B_Out;
wire [31:0] TC1WData_B_Out;
wire [29:0] TC2Addr_B_Out;
wire TC2Write_B_Out;
wire [31:0] TC2WData_B_Out;
wire [31:0] m_int_addr_B_Out;
wire [3:0] m_int_byteen_B_Out;
wire [29:0] TC2Addr;
wire TC2Write_In;
wire [31:0] TC2Din;
wire [31:0] TC2Data_Out;
wire TC2IRQ;
wire Stopper_C_In;
wire TC1_C_In;
wire TC2_C_In;
wire [31:0] i_inst_rdata_C_In;
wire [31:0] m_data_rdata_C_In;
wire [31:0] i_inst_addr_C_Out;
wire [31:0] m_data_addr_C_Out;
wire [31:0] m_data_wdata_C_Out;
wire [3:0] m_data_byteen_C_Out;
wire [31:0] m_inst_addr_C_Out;
wire w_grf_we_C_Out;
wire [4:0] w_grf_addr_C_Out;
wire [31:0] w_grf_wdata_C_Out;
wire [31:0] w_inst_addr_C_Out;
wire [31:0] M_PC_Out;
TC tc1(clk,reset,
TC1Addr,TC1Write_In,
TC1Din,TC1Data_Out,
TC1IRQ
);
assign TC1Addr=TC1Addr_B_Out;
assign TC1Write_In=TC1Write_B_Out;
assign TC1Din=TC1WData_B_Out;


TC tc2(clk,reset,
TC2Addr,TC2Write_In,
TC2Din,TC2Data_Out,
TC2IRQ
);
assign TC2Addr=TC2Addr_B_Out;
assign TC2Write_In=TC2Write_B_Out;
assign TC2Din=TC2WData_B_Out;


Bridge bridge(m_data_rdata_B_In,m_data_addr_B_In,
m_data_wdata_B_In,m_data_byteen_B_In,
TC1_B_In,TC2_B_In,
m_data_rdata_B_Out,m_data_addr_B_Out,
m_data_wdata_B_Out,m_data_byteen_B_Out,
TC1Addr_B_Out,TC1Write_B_Out,
TC1WData_B_Out,TC2Addr_B_Out,
TC2Write_B_Out,TC2WData_B_Out,
m_int_addr_B_Out,m_int_byteen_B_Out
);
assign m_data_rdata_B_In=m_data_rdata;
assign m_data_addr_B_In=m_data_addr_C_Out;
assign m_data_wdata_B_In=m_data_wdata_C_Out;
assign m_data_byteen_B_In=m_data_byteen_C_Out;
assign TC1_B_In=TC1Data_Out;
assign TC2_B_In=TC2Data_Out;



CPU cpu(Stopper_C_In,TC1_C_In,
TC2_C_In,clk,
reset,i_inst_rdata_C_In,
m_data_rdata_C_In,i_inst_addr_C_Out,
m_data_addr_C_Out,m_data_wdata_C_Out,
m_data_byteen_C_Out,m_inst_addr_C_Out,
w_grf_we_C_Out,w_grf_addr_C_Out,
w_grf_wdata_C_Out,w_inst_addr_C_Out,
M_PC_Out
);
assign Stopper_C_In=interrupt;
assign TC1_C_In=TC1IRQ;
assign TC2_C_In=TC2IRQ;
assign i_inst_rdata_C_In=i_inst_rdata;
assign m_data_rdata_C_In=m_data_rdata_B_Out;

assign macroscopic_pc=M_PC_Out;
assign i_inst_addr=i_inst_addr_C_Out;
assign m_data_addr=m_data_addr_B_Out;
assign m_data_wdata=m_data_wdata_B_Out;
assign m_data_byteen=m_data_byteen_B_Out;
assign m_int_addr=m_int_addr_B_Out;
assign m_int_byteen=m_int_byteen_B_Out;
assign m_inst_addr=m_inst_addr_C_Out;
assign w_grf_we=w_grf_we_C_Out;
assign w_grf_addr=w_grf_addr_C_Out;
assign w_grf_wdata=w_grf_wdata_C_Out;
assign w_inst_addr=w_inst_addr_C_Out;

endmodule
