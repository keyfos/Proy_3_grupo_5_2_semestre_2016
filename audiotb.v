`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:17:18 11/17/2016
// Design Name:   Audio
// Module Name:   C:/Users/Catalina Espinoza/Documents/proy_3/proy3/audiotb.v
// Project Name:  proy3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Audio
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module audiotb;

	// Inputs
	reg clk;
	reg rst;
	reg cronofin;

	// Outputs
	wire sonido;

	// Instantiate the Unit Under Test (UUT)
	Audio uut (
		.clk(clk), 
		.rst(rst), 
		.cronofin(cronofin), 
		.sonido(sonido)
	);
localparam T=2;
	always
begin
	clk<=1'b1;
	#(T/2);
	clk<=1'b0;
	#(T/2);
end


initial
begin
	rst<=1'b1; 
	@(negedge clk); 
	#(T);
	rst<=1'b0; 
end

initial
begin
	@(negedge rst);
	@(posedge clk); 
	repeat(840000) @(posedge clk);
	$stop;
end 
	initial begin
		// Initialize Inputs
	
		cronofin = 1;

		// Wait 100 ns for global reset to finish
	
		// Add stimulus here

	end
      
endmodule

