`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:27:36 10/23/2016 
// Design Name: 
// Module Name:    codigo_teclas 
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
module codigo_teclas(
	input clk, rst,
	input stop,
    input wire [7:0] key_code,
    output [7:0] key_out,
	output reg [7:0] ascii_code,
	output reg interrupt
	
   );
   
   reg [7:0] key_reg;
   reg [7:0] key_next;

always @*
   case(key_code)
	
		 8'h05: ascii_code = 8'h20; //F1
		 8'h06: ascii_code = 8'h21; //F2
		 8'h04: ascii_code = 8'h22; //F3
		 8'h0c: ascii_code = 8'h23; //F4
		 8'h03: ascii_code = 8'h25; //F5
		 8'h0b: ascii_code = 8'h26; //F6
		 8'h83: ascii_code = 8'h27; //F7
		 8'h0a: ascii_code = 8'h28; //F8
		 
		 8'h75: ascii_code = 8'h10; //flecha arriba
 		 8'h74: ascii_code = 8'h11; //flecha derecha
		 8'h6b: ascii_code = 8'h12; //flecha izquierda 
		 8'h72: ascii_code = 8'h13; //flecha abajo
		 
	
       8'h45: ascii_code = 8'h30;   // 0
       8'h16: ascii_code = 8'h31;   // 1
       8'h1e: ascii_code = 8'h32;   // 2
       8'h26: ascii_code = 8'h33;   // 3
       8'h25: ascii_code = 8'h34;   // 4
       8'h2e: ascii_code = 8'h35;   // 5
       8'h36: ascii_code = 8'h36;   // 6
       8'h3d: ascii_code = 8'h37;   // 7
       8'h3e: ascii_code = 8'h38;   // 8
       8'h46: ascii_code = 8'h39;   // 9
		
       8'h1c: ascii_code = 8'h41;   // A
       8'h32: ascii_code = 8'h42;   // B
       8'h21: ascii_code = 8'h43;   // C
       8'h23: ascii_code = 8'h44;   // D
       8'h24: ascii_code = 8'h45;   // E
       8'h2b: ascii_code = 8'h46;   // F
       8'h34: ascii_code = 8'h47;   // G
       8'h33: ascii_code = 8'h48;   // H
       8'h43: ascii_code = 8'h49;   // I
       8'h3b: ascii_code = 8'h4a;   // J
       8'h42: ascii_code = 8'h4b;   // K
       8'h4b: ascii_code = 8'h4c;   // L
       8'h3a: ascii_code = 8'h4d;   // M
       8'h31: ascii_code = 8'h4e;   // N
       8'h44: ascii_code = 8'h4f;   // O
       8'h4d: ascii_code = 8'h50;   // P
       8'h15: ascii_code = 8'h51;   // Q
       8'h2d: ascii_code = 8'h52;   // R
       8'h1b: ascii_code = 8'h53;   // S
       8'h2c: ascii_code = 8'h54;   // T
       8'h3c: ascii_code = 8'h55;   // U
       8'h2a: ascii_code = 8'h56;   // V
       8'h1d: ascii_code = 8'h57;   // W
       8'h22: ascii_code = 8'h58;   // X
       8'h35: ascii_code = 8'h59;   // Y
       8'h1a: ascii_code = 8'h5a;   // Z

       8'h0e: ascii_code = 8'h60;   // `
       8'h4e: ascii_code = 8'h2d;   // -
       8'h55: ascii_code = 8'h3d;   // =
       8'h54: ascii_code = 8'h5b;   // [
       8'h5b: ascii_code = 8'h5d;   // ]
       8'h5d: ascii_code = 8'h5c;   // \
       8'h4c: ascii_code = 8'h3b;   // ;
       8'h52: ascii_code = 8'h27;   // '
       8'h41: ascii_code = 8'h2c;   // ,
       8'h49: ascii_code = 8'h2e;   // .
       8'h4a: ascii_code = 8'h2f;   // /

       //8'h29: ascii_code = 8'h20;   // (space)
       8'h5a: ascii_code = 8'h0d;   // (enter, cr)
       8'h66: ascii_code = 8'h08;   // (backspace)
       default: ascii_code = 8'h2a; // *
    endcase
	
	always @(posedge clk)
	begin 
		if (rst)
			key_reg<=8'h00;
		else 
			key_reg<= key_code;
	end
	always @(posedge clk)
	begin
		if (rst)
			key_next<=8'h00;
		else key_next<= key_reg;
	end
	always @(posedge clk)
	begin
		if (stop)
			interrupt<=1'b0;
		else if ((key_reg != key_next) && ascii_code) 
			interrupt<=1'b1;
	end
	
	assign key_out = key_reg;
endmodule
