`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:07:49 09/18/2016 
// Design Name: 
// Module Name:    contador_clk 
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
module contador_clk(
   input CLK_NX,
	 input reset,
	 output reg pixel_rate,
	 output reg clk_RING
	 );
	 
	 reg [0:0]cont;
	 reg [23:0] divisor;
	
	 //Para generar a partir de 100 MHz los 25 MHz que se utilizan en pantalla 640x480
	 //Adem�s genera el clock para el parpadeo a 4Hz
	 
	 always @(posedge CLK_NX, posedge reset)
	 begin
		if (reset)
		begin
			pixel_rate=0;
			cont=0;
			divisor=24'h0000;
			clk_RING=0;
			
			
		end
		
		else
		begin
			if(cont==1'd1)
			begin
				cont=1'd0;
				pixel_rate=~pixel_rate;
			end
			else cont=cont+1'd1;
			
			if(divisor==24'd12499999)
			begin
				divisor=24'd0;
				clk_RING=~clk_RING;
			end
			else divisor=divisor+24'd1;
			
			
		end
	 end

endmodule
