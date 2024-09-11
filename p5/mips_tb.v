`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:24:32 11/12/2023
// Design Name:   mips
// Module Name:   C:/Users/17531/p5_beforeclass/mips_tb.v
// Project Name:  p5_beforeclass
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mips
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mips_tb;

	// Inputs
	reg clk;
	reg reset;

	// Instantiate the Unit Under Test (UUT)
	mips uut (
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		#0 clk = 0;
		reset = 0;
		// Wait 100 ns for global reset to finish
        
		// Add stimulus here

	end
      always #5 clk=~clk;
endmodule

