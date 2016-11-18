`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:53:20 11/17/2016
// Design Name:   Control_VGA
// Module Name:   C:/Users/Catalina Espinoza/Documents/proy_3/proy3/tbvga.v
// Project Name:  proy3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control_VGA
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tbvga;

	// Inputs
	reg CLK_NEXYS;
	reg Reset;
	reg [7:0] dato;
	reg [7:0] id_port;
	reg write_strobe;

	// Outputs
	wire [7:0] color_salida;
	wire hsync;
	wire vsync;
	wire sonido;

	// Instantiate the Unit Under Test (UUT)
	Control_VGA uut (
		.CLK_NEXYS(CLK_NEXYS), 
		.Reset(Reset), 
		.dato(dato), 
		.id_port(id_port), 
		.write_strobe(write_strobe), 
		.color_salida(color_salida), 
		.hsync(hsync), 
		.vsync(vsync), 
		.sonido(sonido)
	);
localparam T=2;
	always
begin
	CLK_NEXYS<=1'b1;
	#(T/2);
	CLK_NEXYS<=1'b0;
	#(T/2);
end


initial
begin
	Reset<=1'b1; 
	@(negedge CLK_NEXYS); 
	#(T);
	Reset<=1'b0; 
end

initial
begin
	@(negedge Reset);
	@(posedge CLK_NEXYS); 
	repeat(840000) @(posedge CLK_NEXYS);
	$stop;
end 
      
	initial begin
		// Initialize Inputs
		
		dato = 8'h02;
		id_port = 8'h05;
		write_strobe = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

