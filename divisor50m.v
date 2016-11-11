`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:55:48 10/22/2016 
// Design Name: 
// Module Name:    divisor50m 
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
module divisor50m(
    clknexys,
	 rst,
	 SCLKclk
    );
input wire clknexys, rst;
	output reg SCLKclk;///,pclk
reg cuenta_sclk;  /////El numero de bits se determina: logbase2(redondeado((clknexys/clkdeseado))-1)
always @(posedge clknexys)   
	begin
	if(rst)
		begin
		cuenta_sclk<=1'd0;   /////El numero de bits se determina: logbase2(redondeado((clknexys/clkdeseado))-1)
		SCLKclk <=1'd0;  //El numero de bits se determina: logbase2(redondeado((clknexys/clkdeseado))-1)
		end
	else
				begin	
			if(cuenta_sclk == 1'd0)// numero lo determina dividiendo el clock dela nexys y el clock que usted quiere, -1, dividido entre 2
						     		 ///Tiene qoue ser un numero entero por lo que lo redondea hacia arriba
					begin 
						cuenta_sclk<= 2'd00;  /////El numero de bits se determina: logbase2(redondeado((clknexys/clkdeseado))-1)+1
						SCLKclk <= ~SCLKclk;
					end
	 		else
				cuenta_sclk <= cuenta_sclk + 1'b1;
		end
	end

endmodule


