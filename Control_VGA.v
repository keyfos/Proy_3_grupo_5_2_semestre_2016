`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:48:22 11/08/2016 
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
	input CLK, rst,
	output hsync, vsync,
	output [11:0] COLOUR_OUT
    );

	wire [7:0] HORA, MIN, SEG, DIA, MES, YEAR, HCRONO, MCRONO, SCRONO, HCRON_FIN, MCRONO_FIN, SCRONO_FIN;
	wire fin_crono, clk_alarm;
	wire am_pm, hformato;
	wire [2:0] dir_cursor;
	wire [7:0] progra_dir;
	
	MainActivity inst_Pantalla(
		.CLK(CLK),
		.rst(rst), 
		.Hora(HORA),
		.min(MIN),
		.seg(SEG),
		.dia(DIA),
		.mes(MES),
		.year(YEAR),
		.hcrono(HCRONO),
		.mcrono(MCRONO),
		.scrono(SCRONO),
		.hcrono_fin(HCRONO_FIN),
		.mcrono_fin(MCRONO_FIN),
		.scrono_fin(SCRONO_FIN),
		.fin_crono(fin_crono),
		.clk_alarm(clk_alarm),
		.am_pm(am_pm),
		.hformato(hformato),
		.dir_cursor(dir_cursor),
		.progra_dir(progra_dir),
		.COLOUR_OUT(COLOUR_OUT),
		.HS(hsync),
		.VS(vsync)	
	   );
	
	
endmodule
