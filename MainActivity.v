`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:14:37 11/07/2016 
// Design Name: 
// Module Name:    MainActivity 
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
module MainActivity(
   input CLK, rst,	
   input [7:0] Hora, min, seg, dia, mes, year, hcrono, mcrono, scrono, hcrono_fin, mcrono_fin, scrono_fin,
	input fin_crono,
	input clk_alarm,
	input am_pm, hformato,
	input [2:0] dir_cursor,
	input [7:0] progra_dir,	  //clock signal
   output [11:0] COLOUR_OUT,//bit patters for colour that goes to VGA port
   output HS,					//Horizontal Synch signal that goes into VGA port
   output VS					//Vertical Synch signal that goes into VGA port
	);
	
	reg DOWNCOUNTER = 0;		//need a downcounter to 25MHz
	parameter imaghora_mul = 16'd17056;	//MULTIPLICACION HORA
	parameter imaghorax = 8'd208;	//PIXELES EN X DE HORA
	parameter imaghoray = 8'd82;	//PIXELES EN Y DE HORA
//---------------------------------------------------------------------	
	parameter imagcrono_mul = 15'd16685;	//MULTIPLICACION CRONO
	parameter imagcronox = 8'd235;	//PIXELES EN X DE CRONO
	parameter imagcronoy = 7'd71;	//PIXELES EN Y DE CRONO
//---------------------------------------------------------------------
   parameter imagfecha_mul =  14'd13536;	//MULTIPLICACION FECHA
	parameter imagfechax = 8'd188;	//PIXELES EN X DE FECHA
	parameter imagfechay = 7'd72;	//PIXELES EN Y DE FECHA	
//--------------------------------------------------------------------
   parameter imaginst_mul = 15'd25020;	//overall there are 6960 pixels
	parameter imaginstx = 8'd180;	//Imagen has 80 pixels in X direction
	parameter imaginsty = 8'd139;	//Imagen has 87 pixels in Y direction
//---------------------------------------------------------------------
	parameter imagteclas_mul = 14'd8664;	//overall there are 6960 pixels
	parameter imagteclasx = 7'd114;	//Imagen has 80 pixels in X direction
	parameter imagteclasy = 7'd76;	//Imagen has 87 pixels in Y direction
//--------------------------------------------------------------------	
	
	
	
	//Downcounter to 25MHz		
	always @(posedge SCLKclk)begin     
		DOWNCOUNTER <= ~DOWNCOUNTER;	//Slow down the counter to 25MHz
	end
	
	reg [11:0] COLOUR_IN;
	reg [11:0] color_hora [0:imaghora_mul-1];
	reg [11:0] color_crono [0:imagcrono_mul-1];
	reg [11:0] color_fecha [0:imagfecha_mul-1];
	reg [11:0] color_inst [0:imaginst_mul-1];
	reg [11:0] color_teclas [0:imagteclas_mul-1];
	wire [19:0] state_hora,state_crono,state_fecha,state_inst,state_teclas;
	wire TrigRefresh;			//Trigger gives a pulse when displayed refreshed
	wire [9:0] ADDRH;			//wire for getting Horizontal pixel value
	wire [8:0] ADDRV;			//wire for getting vertical pixel value
	
	
	divisor50m divisor (
    .clknexys(CLK), 
    .rst(reset), 
    .SCLKclk(SCLKclk)
    );
	
	
	
	//VGA Interface gets values of ADDRH & ADDRV and by puting COLOUR_IN, gets valid output COLOUR_OUT
	//Also gets a trigger, when the screen is refreshed
	VGAInterface VGA(
				.CLK(SCLKclk),
			   .COLOUR_IN (COLOUR_IN),
				.COLOUR_OUT(COLOUR_OUT),
				.HS(HS),
				.VS(VS),
				.REFRESH(TrigRefresh),
				.ADDRH(ADDRH),
				.ADDRV(ADDRV),
				.DOWNCOUNTER(DOWNCOUNTER)
				);
	reg signed [7:0] horax= 7'd35;
	reg signed [6:0] horay= 6'd16;

//-------------------------------
	reg signed [8:0]cronox = 8'd194;
	reg signed [8:0]cronoy = 8'd185;
//-------------------------------
	reg signed [9:0]fechax = 9'd400;
	reg signed [6:0]fechay = 6'd25;
//-------------------------------
	reg signed [5:0]instx = 5'd30;
	reg signed [9:0]insty = 9'd320;
//-------------------------------
	reg signed [10:0]teclasx = 10'd522; //x5
	reg signed [9:0]teclasy = 9'd400; //y5
//-------------------------------

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
	memoria_font instancia_memoria_font (.clk(CLK), .addr(dir_memo), .data(palabra));	
	//---------------------------------------------------------------------------------//

	initial
	$readmemh ("HORA_FIN.list", color_hora);
	initial
	$readmemh ("CRONO_FIN.list",color_crono);
	initial
	$readmemh ("FECHA_FIN.list",color_fecha);
	initial
	$readmemh ("INSTRUCCIONES_FIN_1.list",color_inst);
	initial
	$readmemh ("TECLAS2.list",color_teclas);
	
	
	assign state_hora = ((ADDRH-horax)*imaghoray)+ADDRV-horay;
	assign state_crono = ((ADDRH-cronox)*imagcronoy)+ADDRV-cronoy;
	assign state_fecha = ((ADDRH-fechax)*imagfechay)+ADDRV-fechay;
	assign state_inst = ((ADDRH-instx)*imaginsty)+ADDRV-insty;
	assign state_teclas = ((ADDRH-teclasx)*imagteclasy)+ADDRV-teclasy;
	
	always @(posedge CLK) begin
		if (ADDRH>=horax && ADDRH<horax+imaghorax
			&& ADDRV>=horay && ADDRV<horay+imaghoray)
				COLOUR_IN <= color_hora[{state_hora}];
		else if (ADDRH>=cronox && ADDRH<cronox+imagcronox
			&& ADDRV>=cronoy && ADDRV<cronoy+imagcronoy)
				COLOUR_IN <= color_crono[{state_crono}];
		else if (ADDRH>=fechax && ADDRH<fechax+imagfechax
			&& ADDRV>=fechay && ADDRV<fechay+imagfechay)
				COLOUR_IN <= color_fecha[{state_fecha}];
		else if (ADDRH>=instx && ADDRH<instx+imaginstx
			&& ADDRV>=insty && ADDRV<insty+imaginsty)
				COLOUR_IN <= color_inst[{state_inst}];
		else if (ADDRH>=teclasx && ADDRH<teclasx+imagteclasx
			&& ADDRV>=teclasy && ADDRV<teclasy+imaginsty)
				COLOUR_IN <= color_teclas[{state_teclas}];
			else
				COLOUR_IN <= color_rom;
	end	

	//-------------------alarma--------------------------------//
	 always @(posedge CLK, posedge rst)
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
assign hora=(80<=ADDRH)&&(ADDRH<256) && (96<=ADDRV)&&(ADDRV<128);
	assign db_hora = ADDRH[3:0];
	assign df_hora = ADDRV[4:0];
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
		case (ADDRH[7:4])
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

	 assign formato_hora = (112<=ADDRH)&&(ADDRH<160) && (128<=ADDRV)&&(ADDRV<160);
	 assign db_format_hora = ADDRH[3:0];
	 assign df_format_hora = ADDRV[4:0];
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
		case (ADDRH[7:4])
			4'h7: caracter_format_hora = uni_format;
			4'h8: caracter_format_hora = dec_format;
			4'h9: caracter_format_hora = 7'h62;
			default: caracter_format_hora = 7'h00;
		endcase
	end

	 assign fecha = (432<=ADDRH)&&(ADDRH<560) && (96<=ADDRV)&&(ADDRV<128);
	 assign db_fecha = ADDRH[3:0];
	 assign df_fecha = ADDRV[4:0]; 
	 always @*
	 begin
		case (ADDRH[7:4])
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

	/* assign formato_fecha = (432<=ADDRH)&&(ADDRH<560) && (128<=ADDRV)&&(ADDRV<160);
	 assign db_format_fecha = ADDRH[3:0];
	 assign df_format_fecha = ADDRV[4:0]; 
	 always @*
	 begin
		case (ADDRH[7:4])
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
	 end*/
	 
	 assign crono = (128<=ADDRH)&&(ADDRH<256) && (265<=ADDRV)&&(ADDRV<297);
	 assign db_crono = ADDRH[3:0];
	 assign df_crono = ADDRV[4:0] + 5'b01010; 
	 always @*
	 begin
		case (ADDRH[6:4])
			3'h0: caracter_crono = {3'b011,hcrono[7:4]};		//decenas
			3'h1: caracter_crono = {3'b011,hcrono[3:0]};		//unidades
			3'h2: caracter_crono = 7'h3a;
			3'h3: caracter_crono = {3'b011,mcrono[7:4]};
			3'h4: caracter_crono = {3'b011,mcrono[3:0]};
			3'h5: caracter_crono = 7'h3a;
			3'h6: caracter_crono = {3'b011,scrono[7:4]};
			3'h7: caracter_crono = {3'b011,scrono[3:0]};
			//default: caracter_crono = 7'h00;
		endcase
	 end

	 assign crono_fin = (384<=ADDRH)&&(ADDRH<512) && (265<=ADDRV)&&(ADDRV<297);
	 assign db_crono_fin = ADDRH[3:0];
	 assign df_crono_fin = ADDRV[4:0] + 5'b01010; 
	 always @*
	 begin
		case (ADDRH[6:4])
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
	 
	 assign alarma = (304<=ADDRH)&&(ADDRH<336) && (246<=ADDRV)&&(ADDRV<278);
	 assign db_alarma = ADDRH[3:0];
	 assign df_alarma = ADDRV[4:0] + 5'b01010;
	 always @*
	 begin
		case (bandera)
			1'd0: begin alarm_a = 7'h00; alarm_b = 7'h00; end
			1'd1: begin alarm_a = 7'h3b; alarm_b = 7'h3c; end
			//1'd1: begin assign state_teclas = ((ADDRH-teclasx)*imagteclasy)+ADDRV-teclasy;
			default begin alarm_a = 7'h00; alarm_b = 7'h00; end
		endcase
		case (ADDRH[4])
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
						if ((dir_cursor==1 && ADDRH[7:4]==4'h5) || (dir_cursor==2 && ADDRH[7:4]==4'h6) ||
							 (dir_cursor==3 && ADDRH[7:4]==4'h8) || (dir_cursor==4 && ADDRH[7:4]==4'h9) ||
							 (dir_cursor==5 && ADDRH[7:4]==4'hb) || (dir_cursor==6 && ADDRH[7:4]==4'hc)) color_rom = 12'hfff;
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
						if ((dir_cursor==1 && ADDRH[7:4]==4'hb) || (dir_cursor==2 && ADDRH[7:4]==4'hc) ||
							 (dir_cursor==3 && ADDRH[7:4]==4'he) || (dir_cursor==4 && ADDRH[7:4]==4'hf) ||
							 (dir_cursor==5 && ADDRH[7:4]==4'h1) || (dir_cursor==6 && ADDRH[7:4]==4'h2)) color_rom = 12'hfff;
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
						if ((dir_cursor==1 && ADDRH[6:4]==3'h0) || (dir_cursor==2 && ADDRH[6:4]==3'h1) ||
							 (dir_cursor==3 && ADDRH[6:4]==3'h3) || (dir_cursor==4 && ADDRH[6:4]==3'h4) ||
							 (dir_cursor==5 && ADDRH[6:4]==3'h6) || (dir_cursor==6 && ADDRH[6:4]==3'h7)) color_rom = 12'hfff;
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
