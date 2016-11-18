`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:04:32 05/30/2016 
// Design Name: 
// Module Name:    Audio 
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
module Audio(
    input clk, rst,
	 input cronofin,
	 output reg sonido
	 );
	 
	 localparam contador = 25'd24999999;
	 reg [24:0] cuenta;
	 reg [5:0] totalcuent;
	 reg estado, estado_sig;
	 
	 always @(posedge clk, posedge rst)
	 begin
		if (rst)
		begin
			cuenta <= 24'd0;
			totalcuent <= 6'd0;
			sonido <= 0;
			estado<=0;
			estado_sig<=1;
		end
		else
		begin
			if (cronofin) estado<=1; 
			else estado_sig<=0;
			if (estado)
			begin
				if (cuenta>=contador) begin 
				cuenta <= 24'd0; 
				sonido <= ~sonido; 
				totalcuent <= totalcuent + 6'd1; end
				else cuenta <= cuenta + 24'd1;
				if (totalcuent >= 6'd32) begin totalcuent <=6'd0; estado <=0; end
			end
			
			else sonido <= estado_sig;
		end
	end 

endmodule
