`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:28:46 10/17/2016 
// Design Name: 
// Module Name:    PantallaVGA 
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
module PantallaVGA(
	input clk, rst,
	input clk_alarm, clk_pantalla,
	input [9:0] pixel_x, pixel_y,
	input [7:0] Hora, min, seg, dia, mes, year, hcrono, mcrono, scrono, hcrono_fin, mcrono_fin, scrono_fin,
	input fin_crono,
	input [11:0] color,
	input am_pm, hformato,
	input [3:0] dir_cursor,
	input [7:0] progra_dir,
	//input downcounter,
	//output [9:0] addressh,
	//output [8:0] addressv,
	//output refresh,
	output reg [11:0] color_out
	//output reg hs,
	//output reg vs,
    );
//-----------paramétros locales de las imagenes--------------//
localparam imaghora_mul= 12'd3895;
localparam imaghorax= 7'd95;
localparam imaghoray= 6'd41;
localparam horax= 7'd85;
localparam horay= 6'd48;

localparam imagcrono_mul= 14'd13680;
localparam imagcronox= 8'd171;
localparam imagcronoy= 7'd80;
localparam cronox= 8'd194;
localparam cronoy= 8'd192;

localparam imagfecha_mul= 14'd9982;
localparam imagfechax= 8'd161;
localparam imagfechay= 6'd62;
localparam fechax= 9'd434;
localparam fechay= 6'd50;

localparam imaginst_mul= 16'd43180; //instrucciones
localparam imaginstx= 8'd254;
localparam imaginsty= 8'd170;
localparam instx= 5'd30;
localparam insty= 9'd330;

localparam imagteclas_mul= 11'd1204;
localparam imagteclasx= 6'd43;
localparam imagteclasy= 5'd28;
localparam teclasx= 10'd522;
localparam teclasy= 9'd410;

//----------------indices y registros de las imagenes--------------//
wire [11:0] state_hora;
wire [13:0] state_crono;
wire [12:0] state_fecha;
wire [14:0] state_inst;
wire [10:0] state_teclas;

reg [11:0] color_hora [0:imaghora_mul-1];
reg [11:0] color_crono [0:imagcrono_mul-1];
reg [11:0] color_fecha [0:imagfecha_mul-1];
reg [11:0] color_inst [0:imaginst_mul-1];
reg [11:0] color_teclas [0:imagteclas_mul-1];


//--------------señales de la mem rom------------------------------//
reg [11:0] color_rom;
reg [6:0] m, a_p, uni_format, dec_format, alarm_a, alarm_b;


//----------------señales para la font rom--------------------------//
wire [11:0] dir_memo;
wire [15:0] palabra;
wire fuente_bit;

wire hora, formato_hora;
wire fecha, formato_fecha;
wire crono, crono_fin, alarma;

//------------------direcciones en x y y---------------------//
reg [3:0] dir_bit;
wire [3:0] db_hora, db_format_hora;
wire [3:0] db_fecha, db_format_fecha;
wire [3:0] db_crono, db_crono_fin, db_alarma;
reg [4:0] dir_fila;
wire [4:0] df_hora, df_format_hora;
wire [4:0] df_fecha, df_format_fecha;
wire [4:0] df_crono, df_crono_fin, df_alarma;

//------------señales de caracteres para mostrar----------------//
reg [6:0] caracter;
reg [6:0] caracter_hora, caracter_format_hora;
reg [6:0] caracter_fecha, caracter_format_fecha;
reg [6:0] caracter_crono, caracter_crono_fin, caracter_alarma;

//------------señales para alarma------------------------------//
 reg [23:0] contador;
 reg estado;
 reg estado_sig;
 reg clk_parpadeo, bandera;
 reg [5:0] totalcont;
 localparam cuenta= 24'd16666666;



//---------------instancia de memoria---------------------------------------------//
memoria_font instancia_memoria_font (.clk(clk), .addr(dir_memo), .data(palabra));	
//---------------------------------------------------------------------------------//

//-------lectura de .list de las imagenes--------------//
initial begin
$readmemh ("hora.list", color_hora);
$readmemh ("cronometro.list", color_crono);
$readmemh ("fecha.list", color_fecha);
$readmemh ("instrucciones.list", color_inst);
$readmemh ("teclas.list", color_teclas);
end

assign state_hora =((pixel_x-horax)*imaghoray)+pixel_y-horay;
assign state_crono =((pixel_x-cronox)*imagcronoy)+pixel_y-cronoy;
assign state_fecha =((pixel_x-fechax)*imagfechay)+pixel_y-fechay;
assign state_inst= ((pixel_x-instx)*imaginsty)+pixel_y-insty;
assign state_teclas= ((pixel_x-teclasx)*imagteclasy)+pixel_y-teclasy;

//-------------------alarma--------------------------------//
 always @(posedge clk, posedge rst)
 begin
	if (rst)
	begin
		contador <= 24'd0;
		totalcont <= 6'd0;
		clk_parpadeo <= 0;
		estado<=0;
		estado_sig<=1;
		bandera <= 0;
	end
	else
	begin
		if (fin_crono) estado<=1; 
		else estado_sig<=0;
		if (estado)
		begin
			bandera <=1;
			if (contador>=cuenta) begin 
			contador <= 24'd0; 
			clk_parpadeo <= ~clk_parpadeo; 
			totalcont <= totalcont + 6'd1;end
			else contador <= contador + 24'd1;
			if (totalcont >= 6'd50) begin totalcont <=6'd0; estado <=0; bandera <= 0; end
		end
		
		else begin clk_parpadeo <= estado_sig; bandera <= 0; end
	end
end 
//-----------------------------------------------------------------------------------------


always@(posedge clk_pantalla)
begin
	if (pixel_x>=horax && pixel_x<horax+imaghorax && pixel_y>=horay && pixel_y<horay+imaghoray)
		color_out<= color_hora[{state_hora}];
	else if (pixel_x>=cronox && pixel_x<cronox+imagcronox && pixel_y>=cronoy && pixel_y<cronoy+imagcronoy)
		color_out<= color_crono[{state_crono}];
	else if (pixel_x>=fechax && pixel_x<fechax+imagfechax && pixel_y>=fechay && pixel_y<fechay+imagfechay)
		color_out<=color_fecha[{state_fecha}];
	else if (pixel_x>=instx && pixel_x<instx+imaginstx && pixel_y>=insty && pixel_y<insty+imaginsty)
		color_out<= color_inst[{state_inst}];
	else if (pixel_x>=teclasx && pixel_x<teclasx+imagteclasx && pixel_y>=teclasy && pixel_y<horay+imaghoray)
		color_out<= color_teclas[{state_teclas}];
	else color_out<=color_rom;
end

assign hora=(80<=pixel_x)&&(pixel_x<256) && (96<=pixel_y)&&(pixel_y<128);
assign db_hora = pixel_x[3:0];
assign df_hora = pixel_y[4:0];
always@*
begin
	if (hformato)
		begin
			m=7'h63;
			if (am_pm) a_p=7'h64;
			else a_p=7'h61;
		end
	else
		begin
			m=7'h00;
			a_p=7'h00;
		end
	case (pixel_x[7:4])
		4'h5: caracter_hora = {3'b011,Hora[7:4]};
		4'h6: caracter_hora = {3'b011,Hora[3:0]};
		4'h7: caracter_hora = 7'h3a;
		4'h8: caracter_hora = {3'b011,min[7:4]};
		4'h9: caracter_hora = {3'b011,min[3:0]};
		4'ha: caracter_hora = 7'h3a;
		4'hb: caracter_hora = {3'b011,seg[7:4]};
		4'hc: caracter_hora = {3'b011,seg[3:0]};
		4'he: caracter_hora = a_p;
		4'hf: caracter_hora = m;
		default: caracter_hora = 7'h00;
	endcase
end

 assign formato_hora = (112<=pixel_x)&&(pixel_x<160) && (128<=pixel_y)&&(pixel_y<160);
 assign db_format_hora = pixel_x[3:0];
 assign df_format_hora = pixel_y[4:0];
 always @*
 begin
	if (hformato)					//formato 12h
	begin
		uni_format = {3'b011,4'd1};
		dec_format = {3'b011,4'd2};
	end
	else								//formato 24h
	begin
		uni_format = {3'b011,4'd2};
		dec_format = {3'b011,4'd4};
	end
	case (pixel_x[7:4])
		4'h7: caracter_format_hora = uni_format;
		4'h8: caracter_format_hora = dec_format;
		4'h9: caracter_format_hora = 7'h62;
		default: caracter_format_hora = 7'h00;
	endcase
end

 assign fecha = (432<=pixel_x)&&(pixel_x<560) && (96<=pixel_y)&&(pixel_y<128);
 assign db_fecha = pixel_x[3:0];
 assign df_fecha = pixel_y[4:0]; 
 always @*
 begin
	case (pixel_x[7:4])
		4'hb: caracter_fecha = {3'b011,dia[7:4]};
		4'hc: caracter_fecha = {3'b011,dia[3:0]};
		4'hd: caracter_fecha = 7'h3d;
		4'he: caracter_fecha = {3'b011,mes[7:4]};
		4'hf: caracter_fecha = {3'b011,mes[3:0]};
		4'h0: caracter_fecha = 7'h3d;
		4'h1: caracter_fecha = {3'b011,year[7:4]};
		4'h2: caracter_fecha = {3'b011,year[3:0]};
		default: caracter_fecha = 7'h00;
	endcase
 end

 assign formato_fecha = (432<=pixel_x)&&(pixel_x<560) && (128<=pixel_y)&&(pixel_y<160);
 assign db_format_fecha = pixel_x[3:0];
 assign df_format_fecha = pixel_y[4:0]; 
 always @*
 begin
	case (pixel_x[7:4])
		4'hb: caracter_format_fecha = 7'h65;
		4'hc: caracter_format_fecha = 7'h65;
		4'hd: caracter_format_fecha = 7'h3d;
		4'he: caracter_format_fecha = 7'h63;
		4'hf: caracter_format_fecha = 7'h63;
		4'h0: caracter_format_fecha = 7'h3d;
		4'h1: caracter_format_fecha = 7'h61;
		4'h2: caracter_format_fecha = 7'h61;
		default: caracter_format_fecha = 7'h00;
	endcase
 end
 
 assign crono = (128<=pixel_x)&&(pixel_x<256) && (246<=pixel_y)&&(pixel_y<278);
 assign db_crono = pixel_x[3:0];
 assign df_crono = pixel_y[4:0] + 5'b01010; 
 always @*
 begin
	case (pixel_x[6:4])
		3'h0: caracter_crono = {3'b011,hcrono[7:4]};		//decenas
		3'h1: caracter_crono = {3'b011,hcrono[3:0]};		//unidades
		3'h2: caracter_crono = 7'h3a;
		3'h3: caracter_crono = {3'b011,mcrono[7:4]};
		3'h4: caracter_crono = {3'b011,mcrono[3:0]};
		3'h5: caracter_crono = 7'h3a;
		3'h6: caracter_crono = {3'b011,scrono[7:4]};
		3'h7: caracter_crono = {3'b011,scrono[3:0]};
	endcase
 end

 assign crono_fin = (384<=pixel_x)&&(pixel_x<512) && (246<=pixel_y)&&(pixel_y<278);
 assign db_crono_fin = pixel_x[3:0];
 assign df_crono_fin = pixel_y[4:0] + 5'b01010; 
 always @*
 begin
	case (pixel_x[6:4])
		3'h0: caracter_crono_fin = {3'b011,hcrono_fin[7:4]};
		3'h1: caracter_crono_fin = {3'b011,hcrono_fin[3:0]};
		3'h2: caracter_crono_fin = 7'h3a;
		3'h3: caracter_crono_fin = {3'b011,mcrono_fin[7:4]};
		3'h4: caracter_crono_fin = {3'b011,mcrono_fin[3:0]};
		3'h5: caracter_crono_fin = 7'h3a;
		3'h6: caracter_crono_fin = {3'b011,scrono_fin[7:4]};
		3'h7: caracter_crono_fin = {3'b011,scrono_fin[3:0]};
	endcase
 end
 
 assign alarma = (304<=pixel_x)&&(pixel_x<336) && (246<=pixel_y)&&(pixel_y<278);
 assign db_alarma = pixel_x[3:0];
 assign df_alarma = pixel_y[4:0] + 5'b01010;
 always @*
 begin
	case (bandera)
		1'd0: begin alarm_a = 7'h00; alarm_b = 7'h00; end
		1'd1: begin alarm_a = 7'h3b; alarm_b = 7'h3c; end
		default begin alarm_a = 7'h00; alarm_b = 7'h00; end
	endcase
	case (pixel_x[4])
		1'b0: caracter_alarma = alarm_b;
		1'b1: caracter_alarma = alarm_a;
	endcase
 end
 
 //---------------------------Asignacion de colores de fondo y caracteres---------------------------//
always@*
 begin
	color_rom = 12'hfff;					//color de fondo de la vga
	if (hora)
		begin caracter = caracter_hora; dir_fila = df_hora; dir_bit=db_hora;
			if (progra_dir==8'h05)														//programacion de hora
			begin
				if (~clk_alarm)
				begin
					if ((dir_cursor==1 && pixel_x[7:4]==4'h5) || (dir_cursor==2 && pixel_x[7:4]==4'h6) ||
						 (dir_cursor==3 && pixel_x[7:4]==4'h8) || (dir_cursor==4 && pixel_x[7:4]==4'h9) ||
						 (dir_cursor==5 && pixel_x[7:4]==4'hb) || (dir_cursor==6 && pixel_x[7:4]==4'hc)) color_rom = 12'hfff;
					else if (fuente_bit) color_rom = 12'h55;
				end
				else if (clk_alarm && fuente_bit) color_rom = 12'h000;
			end
			else if (fuente_bit && progra_dir!=8'h05) color_rom = 12'h000;
		end
		
	else if (formato_hora)
		begin caracter = caracter_format_hora; dir_fila = df_format_hora; dir_bit=db_format_hora;
			if (fuente_bit) color_rom = 12'h000;
		end
		
	else if (fecha)
		begin caracter = caracter_fecha; dir_fila = df_fecha; dir_bit=db_fecha;
			if (progra_dir==8'h06)														//se esta programando fecha
			begin
				if (~clk_alarm)
				begin
					if ((dir_cursor==1 && pixel_x[7:4]==4'hb) || (dir_cursor==2 && pixel_x[7:4]==4'hc) ||
						 (dir_cursor==3 && pixel_x[7:4]==4'he) || (dir_cursor==4 && pixel_x[7:4]==4'hf) ||
						 (dir_cursor==5 && pixel_x[7:4]==4'h1) || (dir_cursor==6 && pixel_x[7:4]==4'h2)) color_rom = 12'hfff;
					else if (fuente_bit) color_rom = 12'h55;
				end
				else if (clk_alarm && fuente_bit) color_rom = 12'h000;
			end
			else if (fuente_bit && progra_dir!=8'h06) color_rom = 12'h000;
		end
		
	else if (formato_fecha)
		begin caracter = caracter_format_fecha; dir_fila = df_format_fecha; dir_bit=db_format_fecha;
			if (fuente_bit) color_rom = 12'h000;
		end
		
	else if (crono)
		begin  caracter = caracter_crono; dir_fila = df_crono; dir_bit=db_crono;
			if (progra_dir==8'h04)														// programacion de cronometro
			begin
				if (~clk_alarm)
				begin
					if ((dir_cursor==1 && pixel_x[6:4]==3'h0) || (dir_cursor==2 && pixel_x[6:4]==3'h1) ||
						 (dir_cursor==3 && pixel_x[6:4]==3'h3) || (dir_cursor==4 && pixel_x[6:4]==3'h4) ||
						 (dir_cursor==5 && pixel_x[6:4]==3'h6) || (dir_cursor==6 && pixel_x[6:4]==3'h7)) color_rom = 12'hfff;
					else if (fuente_bit) color_rom = 12'h000;
				end
				else if (clk_alarm && fuente_bit) color_rom = 12'h000;
			end
			else if (fuente_bit && progra_dir!=8'h04) color_rom = 12'h000;
		end
		
	else if (crono_fin)
		begin caracter = caracter_crono_fin; dir_fila = df_crono_fin; dir_bit=db_crono_fin;
			if (fuente_bit) color_rom = 12'h000;
		end
		
	else if (alarma)																									
		begin caracter = caracter_alarma; dir_fila = df_alarma; dir_bit=db_alarma;
			if (~clk_parpadeo) color_rom = 12'hfff;
			else if (fuente_bit) color_rom = 12'he00;
		end
	else 
		begin caracter = 7'h00; dir_fila = 5'h00; dir_bit=4'h0;
		end
 end
 
 assign dir_memo={caracter,dir_fila};
 assign fuente_bit=palabra[~dir_bit];
 
endmodule
