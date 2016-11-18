`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:43:46 11/17/2016
// Design Name:   rtcp
// Module Name:   C:/Users/Catalina Espinoza/Documents/proy_3/proy3/tbrtc.v
// Project Name:  proy3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rtcp
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tbrtc;

	// Inputs
	reg [7:0] ADin;
	reg CLK;
	reg reset;
	reg write_strobe;
	reg [7:0] id_port;
	reg [7:0] out_port;

	// Outputs
	wire [7:0] ADout;
	wire ad;
	wire wr;
	wire rd;
	wire cs;
	wire [7:0] data;
	wire [7:0] am_pm;
	wire [7:0] bandera;
	wire Pup;

	// Instantiate the Unit Under Test (UUT)
	rtcp uut (
		.ADin(ADin), 
		.CLK(CLK), 
		.reset(reset), 
		.write_strobe(write_strobe), 
		.id_port(id_port), 
		.out_port(out_port), 
		.ADout(ADout), 
		.ad(ad), 
		.wr(wr), 
		.rd(rd), 
		.cs(cs), 
		.data(data), 
		.am_pm(am_pm), 
		.bandera(bandera), 
		.Pup(Pup)
	);
	localparam T=2;
	always
begin
	CLK<=1'b1;
	#(T/2);
	CLK<=1'b0;
	#(T/2);
end


initial
begin
	reset<=1'b1; 
	@(negedge CLK); 
	#(T);
	reset<=1'b0; 
end

initial
begin
	@(negedge reset);
	@(posedge CLK); 
	repeat(840000) @(posedge CLK);
	$stop;
end 
      

	/*initial begin
		// Initialize Inputs
		CLK = 0;
		reset = 1;
		id_port = 0;
		ADin = 0;
		write_strobe = 0;
		read_strobe = 0;
		#10 reset = 0;
		#20 id_port = 8'h10;
		ADin = 8'h01;
		#20 id_port = 8'h00;
		ADin = 8'h21;
		#20 id_port = 8'h01;
		ADin = 8'h01;
		
		
		
		#100000 $stop;
		end
endmodule
*/
initial begin
		// Initialize Inputs
		ADin = 0;
		id_port = 8'h01;
		write_strobe = 1'b1;
		out_port = 8'h01;
		

		// Wait 100 ns for global reset to finish
		#100;
		
        out_port = 8'h02;
		// Add stimulus here

	end
      
endmodule

