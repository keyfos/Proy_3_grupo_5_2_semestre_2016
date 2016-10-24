`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:24:05 10/24/2016 
// Design Name: 
// Module Name:    Control_VGA 
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
module Control_VGA(
	input wire clk_nexys, reset,
	input [2:0] direc_cursor,
	input [7:0] direc_progra,
	input crono_final, tiempo, formato, 
	input wire [7:0] hora_x, min_x, seg_x, dia_x, mes_x, year_x, hora_crono, min_crono, seg_crono, HCRONO_FIN, MCRONO_FIN, SCRONO_FIN,
	output wire [11:0] color_salida,
	output wire hsync, vsync
    );

	 wire ON_VID; 
	 wire [9:0] x_p, y_p;
	 wire PT;
	 wire [11:0] rgb_next;
	 reg [11:0] rgb_reg;
	 wire [11:0] colors;
	 wire medio_seg;
	 
	 contador_clk inst_contador_clk(
		.CLK_NX(clk_nexys),
		.reset(reset),
		.pixel_rate(PT),
	 	.clk_RING(medio_seg)
	 );
	
	sincronizacion inst_sincronizacion(
		 .reset(reset),
		 .CLK_pix_rate(PT),
		 .h_sync(hsync),
		 .v_sync(vsync),
		 .video_on(ON_VID),
		 .pixel_x(x_p),
		 .pixel_y(y_p)
	 );
	 
	 mux_colores inst_mux_colores(
		.video_on(ON_VID),
		.color(colors),
		.RGB(rgb_next)
	);
	 
	 PantallaVGA inst_PantallaVGA (
			.clk(clk_nexys), 
			.rst(reset), 
			.clk_alarm(medio_seg), 
			.clk_pantalla(PT),
			.pixel_x(x_p), 
			.pixel_y(y_p), 
			.Hora(hora_x),
			.min(min_x),
			.seg(seg_x),
			.dia(dia_x),
			.mes(mes_x),
			.year(year_x),
			.hcrono(hora_crono),
			.mcrono(min_crono),
			.scrono(seg_crono),
			.hcrono_fin(HCRONO_FIN),
			.mcrono_fin(MCRONO_FIN),
			.scrono_fin(SCRONO_FIN),
			.fin_crono(crono_final),
			.am_pm(tiempo),
			.hformato(formato),
			.dir_cursor(direc_cursor),
			.progra_dir(direc_progra),
			.color_out(colors));
					
	
	
	 
	  always @(posedge clk_nexys, posedge reset)
		 begin
			 if(reset)
				rgb_reg<=12'hfff;
			 else
			 begin
				if (PT)
					rgb_reg<=rgb_next;
			 end
		 end
		 assign color_salida=rgb_reg;
endmodule
