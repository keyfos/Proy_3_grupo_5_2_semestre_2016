`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:57:02 10/23/2016 
// Design Name: 
// Module Name:    memoria_font 
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
module memoria_font(
   input wire clk,
    input wire [11:0] addr,
    output reg [15:0] data
	 );
	 
	 reg [11:0] addr_reg;
	 
	 always @(posedge clk) 
      addr_reg <= addr;	
	 
	 always @*
		case (addr_reg)
		//code x00 y x01
         12'h000: data = 16'b0000000000000000; // 
         12'h001: data = 16'b0000000000000000; // 
         12'h002: data = 16'b0000000000000000; // 
         12'h003: data = 16'b0000000000000000; // 
         12'h004: data = 16'b0000000000000000; // 
         12'h005: data = 16'b0000000000000000; // 
         12'h006: data = 16'b0000000000000000; // 
         12'h007: data = 16'b0000000000000000; // 
         12'h008: data = 16'b0000000000000000; // 
         12'h009: data = 16'b0000000000000000; // 
         12'h00a: data = 16'b0000000000000000; // 
         12'h00b: data = 16'b0000000000000000; // 
         12'h00c: data = 16'b0000000000000000; // 
         12'h00d: data = 16'b0000000000000000; // 
         12'h00e: data = 16'b0000000000000000; // 
         12'h00f: data = 16'b0000000000000000; //
			12'h010: data = 16'b0000000000000000; // 
         12'h011: data = 16'b0000000000000000; // 
         12'h012: data = 16'b0000000000000000; // 
         12'h013: data = 16'b0000000000000000; // 
         12'h014: data = 16'b0000000000000000; // 
         12'h015: data = 16'b0000000000000000; // 
         12'h016: data = 16'b0000000000000000; // 
         12'h017: data = 16'b0000000000000000; // 
         12'h018: data = 16'b0000000000000000; // 
         12'h019: data = 16'b0000000000000000; // 
         12'h01a: data = 16'b0000000000000000; // 
         12'h01b: data = 16'b0000000000000000; // 
         12'h01c: data = 16'b0000000000000000; // 
         12'h01d: data = 16'b0000000000000000; // 
         12'h01e: data = 16'b0000000000000000; // 
         12'h01f: data = 16'b0000000000000000; //
			
		//code x60 y x61      NUMERO 0
         12'h600: data = 16'b0000000000000000; // 
         12'h601: data = 16'b0000000000000000; // 
         12'h602: data = 16'b0000000000000000; // 
         12'h603: data = 16'b0000000000000000; // 
         12'h604: data = 16'b0000000000000000; // 
         12'h605: data = 16'b0001111111100000; //    ********
         12'h606: data = 16'b0011111111110000; //   **********
         12'h607: data = 16'b0111100001111000; //  ****    ****
         12'h608: data = 16'b1111000000111100; // ****      ****
         12'h609: data = 16'b1111000000111100; // ****      ****
         12'h60a: data = 16'b1111000000111100; // ****      ****
         12'h60b: data = 16'b1111000001111100; // ****     *****
         12'h60c: data = 16'b1111000011111100; // ****    ******
         12'h60d: data = 16'b1111000111111100; // ****   *******
         12'h60e: data = 16'b1111001111111100; // ****  ********
         12'h60f: data = 16'b1111011111111100; // **** *********
			12'h610: data = 16'b1111111110111100; // ********* ****
         12'h611: data = 16'b1111111100111100; // ********  ****
         12'h612: data = 16'b1111111000111100; // *******   ****
         12'h613: data = 16'b1111110000111100; // ******    ****
         12'h614: data = 16'b1111100000111100; // *****     ****
         12'h615: data = 16'b1111000000111100; // ****      ****
         12'h616: data = 16'b1111000000111100; // ****      ****
         12'h617: data = 16'b1111000000111100; // ****      ****
         12'h618: data = 16'b0111100001111000; //  ****    ****
         12'h619: data = 16'b0011111111110000; //   **********
         12'h61a: data = 16'b0001111111100000; //    ********
         12'h61b: data = 16'b0000000000000000; // 
         12'h61c: data = 16'b0000000000000000; // 
         12'h61d: data = 16'b0000000000000000; // 
         12'h61e: data = 16'b0000000000000000; // 
         12'h61f: data = 16'b0000000000000000; //
			
		//code x62 y x63      NUMERO 1
         12'h620: data = 16'b0000000000000000; // 
         12'h621: data = 16'b0000000000000000; // 
         12'h622: data = 16'b0000000000000000; // 
         12'h623: data = 16'b0000000000000000; // 
         12'h624: data = 16'b0000000000000000; // 
         12'h625: data = 16'b0000000001000000; //          *
         12'h626: data = 16'b0000000011000000; //         **
         12'h627: data = 16'b0000000111000000; //        ***
         12'h628: data = 16'b0000001111000000; //       ****
         12'h629: data = 16'b0000011111000000; //      *****
         12'h62a: data = 16'b0000111111000000; //     ******
         12'h62b: data = 16'b0001111111000000; //    *******
         12'h62c: data = 16'b0011111111000000; //   ********    
         12'h62d: data = 16'b0000001111000000; //       ****    
         12'h62e: data = 16'b0000001111000000; //       ****    
         12'h62f: data = 16'b0000001111000000; //       ****    
			12'h630: data = 16'b0000001111000000; //       ****    
         12'h631: data = 16'b0000001111000000; //       ****    
         12'h632: data = 16'b0000001111000000; //       ****    
         12'h633: data = 16'b0000001111000000; //       ****    
         12'h634: data = 16'b0000001111000000; //       ****    
         12'h635: data = 16'b0000001111000000; //       ****    
         12'h636: data = 16'b0000001111000000; //       ****    
         12'h637: data = 16'b0000001111000000; //       ****    
         12'h638: data = 16'b0000001111000000; //       ****    
         12'h639: data = 16'b0011111111111100; //   ************
         12'h63a: data = 16'b0011111111111100; //   ************
         12'h63b: data = 16'b0000000000000000; // 
         12'h63c: data = 16'b0000000000000000; // 
         12'h63d: data = 16'b0000000000000000; // 
         12'h63e: data = 16'b0000000000000000; // 
         12'h63f: data = 16'b0000000000000000; //
		
		//code x64 y x65      NUMERO 2
         12'h640: data = 16'b0000000000000000; // 
         12'h641: data = 16'b0000000000000000; // 
         12'h642: data = 16'b0000000000000000; // 
         12'h643: data = 16'b0000000000000000; // 
         12'h644: data = 16'b0000000000000000; // 
         12'h645: data = 16'b0000111111110000; //     ********
         12'h646: data = 16'b0001111111111000; //    **********
         12'h647: data = 16'b0011110001111100; //   ****   *****
         12'h648: data = 16'b0111100000111100; //  ****     ****
         12'h649: data = 16'b1111000000111100; // ****      ****
         12'h64a: data = 16'b1111000000111100; // ****      ****
         12'h64b: data = 16'b0000000000111100; //           ****
         12'h64c: data = 16'b0000000000111100; //           ****
         12'h64d: data = 16'b0000000001111000; //          ****
         12'h64e: data = 16'b0000000011110000; //         ****    
         12'h64f: data = 16'b0000000111100000; //        ****    
			12'h650: data = 16'b0000001111000000; //       ****    
         12'h651: data = 16'b0000011110000000; //      ****    
         12'h652: data = 16'b0000111100000000; //     ****    
         12'h653: data = 16'b0001111000000000; //    ****    
         12'h654: data = 16'b0011110000000000; //   ****    
         12'h655: data = 16'b0111100000000000; //  ****    
         12'h656: data = 16'b1111000000000000; // ****          
         12'h657: data = 16'b1111000000111100; // ****      ****
         12'h658: data = 16'b1111000000111100; // ****      ****    
         12'h659: data = 16'b1111111111111100; // **************
         12'h65a: data = 16'b1111111111111100; // **************
         12'h65b: data = 16'b0000000000000000; // 
         12'h65c: data = 16'b0000000000000000; // 
         12'h65d: data = 16'b0000000000000000; // 
         12'h65e: data = 16'b0000000000000000; // 
         12'h65f: data = 16'b0000000000000000; //
			
		//code x66 y x67      NUMERO 3
         12'h660: data = 16'b0000000000000000; // 
         12'h661: data = 16'b0000000000000000; // 
         12'h662: data = 16'b0000000000000000; // 
         12'h663: data = 16'b0000000000000000; // 
         12'h664: data = 16'b0000000000000000; // 
         12'h665: data = 16'b0001111111100000; //    ********
         12'h666: data = 16'b0011111111110000; //   **********
         12'h667: data = 16'b0111100001111000; //  ****    ****
         12'h668: data = 16'b1111000000111100; // ****      ****
         12'h669: data = 16'b0000000000111100; //           ****
         12'h66a: data = 16'b0000000000111100; //           ****
         12'h66b: data = 16'b0000000000111100; //           ****
         12'h66c: data = 16'b0000000000111100; //           ****
         12'h66d: data = 16'b0000000001111000; //          ****
         12'h66e: data = 16'b0000000011110000; //         ****    
         12'h66f: data = 16'b0000001111100000; //       *****    
			12'h670: data = 16'b0000000011110000; //         ****    
         12'h671: data = 16'b0000000001111000; //          ****    
         12'h672: data = 16'b0000000000111100; //           ****    
         12'h673: data = 16'b0000000000111100; //           ****    
         12'h674: data = 16'b0000000000111100; //           ****    
         12'h675: data = 16'b0000000000111100; //           ****    
         12'h676: data = 16'b0000000000111100; //           ****          
         12'h677: data = 16'b1111000000111100; // ****      ****
         12'h678: data = 16'b0111100001111000; //  ****    ****    
         12'h679: data = 16'b0011111111110000; //   **********
         12'h67a: data = 16'b0001111111100000; //    ********
         12'h67b: data = 16'b0000000000000000; // 
         12'h67c: data = 16'b0000000000000000; // 
         12'h67d: data = 16'b0000000000000000; // 
         12'h67e: data = 16'b0000000000000000; // 
         12'h67f: data = 16'b0000000000000000; //
			
		//code x68 y x69      NUMERO 4
         12'h680: data = 16'b0000000000000000; // 
         12'h681: data = 16'b0000000000000000; // 
         12'h682: data = 16'b0000000000000000; // 
         12'h683: data = 16'b0000000000000000; // 
         12'h684: data = 16'b0000000000000000; // 
         12'h685: data = 16'b0000000000010000; //            *
         12'h686: data = 16'b0000000000110000; //           **
         12'h687: data = 16'b0000000001110000; //          ***
         12'h688: data = 16'b0000000011110000; //         ****
         12'h689: data = 16'b0000000111110000; //        *****
         12'h68a: data = 16'b0000001111110000; //       ******
         12'h68b: data = 16'b0000011111110000; //      *******
         12'h68c: data = 16'b0000111011110000; //     *** ****    
         12'h68d: data = 16'b0001110011110000; //    ***  ****  
         12'h68e: data = 16'b0011100011110000; //   ***   **** 
         12'h68f: data = 16'b0111000011110000; //  ***    ****    
			12'h690: data = 16'b1111111111111100; // **************    
         12'h691: data = 16'b1111111111111100; // **************    
         12'h692: data = 16'b0000000011110000; //         ****    
         12'h693: data = 16'b0000000011110000; //         ****    
         12'h694: data = 16'b0000000011110000; //         ****    
         12'h695: data = 16'b0000000011110000; //         ****    
         12'h696: data = 16'b0000000011110000; //         ****    
         12'h697: data = 16'b0000000011110000; //         ****    
         12'h698: data = 16'b0000000011110000; //         ****    
         12'h699: data = 16'b0000000011110000; //         ****
         12'h69a: data = 16'b0000000111111000; //        ******
         12'h69b: data = 16'b0000000000000000; // 
         12'h69c: data = 16'b0000000000000000; // 
         12'h69d: data = 16'b0000000000000000; // 
         12'h69e: data = 16'b0000000000000000; // 
         12'h69f: data = 16'b0000000000000000; //
			
		//code x6a y x6b      NUMERO 5
         12'h6a0: data = 16'b0000000000000000; // 
         12'h6a1: data = 16'b0000000000000000; // 
         12'h6a2: data = 16'b0000000000000000; // 
         12'h6a3: data = 16'b0000000000000000; // 
         12'h6a4: data = 16'b0000000000000000; // 
         12'h6a5: data = 16'b1111111111111100; // **************
         12'h6a6: data = 16'b1111111111111100; // **************
         12'h6a7: data = 16'b1111000000000000; // ****  
         12'h6a8: data = 16'b1111000000000000; // ****      
         12'h6a9: data = 16'b1111000000000000; // ****      
         12'h6aa: data = 16'b1111000000000000; // ****      
         12'h6ab: data = 16'b1111000000000000; // ****    
         12'h6ac: data = 16'b1111000000000000; // ****   
         12'h6ad: data = 16'b1111111111100000; // **********
         12'h6ae: data = 16'b1111111111110000; // ************
         12'h6af: data = 16'b0000000001111000; //          ****
			12'h6b0: data = 16'b0000000000111100; //           ****
         12'h6b1: data = 16'b0000000000111100; //           ****
         12'h6b2: data = 16'b0000000000111100; //           ****
         12'h6b3: data = 16'b0000000000111100; //           ****
         12'h6b4: data = 16'b0000000000111100; //           ****
         12'h6b5: data = 16'b0000000000111100; //           ****
         12'h6b6: data = 16'b0000000000111100; //           ****
         12'h6b7: data = 16'b1111000000111100; // ****      ****
         12'h6b8: data = 16'b0111100001111000; //  ****    ****
         12'h6b9: data = 16'b0011111111110000; //   **********
         12'h6ba: data = 16'b0001111111100000; //    ********
         12'h6bb: data = 16'b0000000000000000; // 
         12'h6bc: data = 16'b0000000000000000; // 
         12'h6bd: data = 16'b0000000000000000; // 
         12'h6be: data = 16'b0000000000000000; // 
         12'h6bf: data = 16'b0000000000000000; //
			
		//code x6c y x6d      NUMERO 6
         12'h6c0: data = 16'b0000000000000000; // 
         12'h6c1: data = 16'b0000000000000000; // 
         12'h6c2: data = 16'b0000000000000000; // 
         12'h6c3: data = 16'b0000000000000000; // 
         12'h6c4: data = 16'b0000000000000000; // 
         12'h6c5: data = 16'b0000011110000000; //      *****
         12'h6c6: data = 16'b0000111100000000; //     ****
         12'h6c7: data = 16'b0001111000000000; //    ****  
         12'h6c8: data = 16'b0011110000000000; //   ****      
         12'h6c9: data = 16'b0111100000000000; //  ****      
         12'h6ca: data = 16'b1111000000000000; // ****      
         12'h6cb: data = 16'b1111000000000000; // ****    
         12'h6cc: data = 16'b1111000000000000; // ****   
         12'h6cd: data = 16'b1111000000000000; // ****
         12'h6ce: data = 16'b1111111111110000; // ************
         12'h6cf: data = 16'b1111111111111000; // *************
			12'h6d0: data = 16'b1111100001111100; // *****    *****
         12'h6d1: data = 16'b1111000000111100; // ****      ****
         12'h6d2: data = 16'b1111000000111100; // ****      ****
         12'h6d3: data = 16'b1111000000111100; // ****      ****
         12'h6d4: data = 16'b1111000000111100; // ****      ****
         12'h6d5: data = 16'b1111000000111100; // ****      ****
         12'h6d6: data = 16'b1111000000111100; // ****      ****
         12'h6d7: data = 16'b1111000000111100; // ****      ****
         12'h6d8: data = 16'b0111100001111000; //  ****    ****
         12'h6d9: data = 16'b0011111111110000; //   **********
         12'h6da: data = 16'b0001111111100000; //    ********
         12'h6db: data = 16'b0000000000000000; // 
         12'h6dc: data = 16'b0000000000000000; // 
         12'h6dd: data = 16'b0000000000000000; // 
         12'h6de: data = 16'b0000000000000000; // 
         12'h6df: data = 16'b0000000000000000; //
			
		//code x6e y x6f      NUMERO 7
         12'h6e0: data = 16'b0000000000000000; // 
         12'h6e1: data = 16'b0000000000000000; // 
         12'h6e2: data = 16'b0000000000000000; // 
         12'h6e3: data = 16'b0000000000000000; // 
         12'h6e4: data = 16'b0000000000000000; // 
         12'h6e5: data = 16'b1111111111111100; // **************
         12'h6e6: data = 16'b1111111111111100; // **************
         12'h6e7: data = 16'b1111000000111100; // ****      ****
         12'h6e8: data = 16'b0000000000111100; //           ****      
         12'h6e9: data = 16'b0000000000111100; //           ****      
         12'h6ea: data = 16'b0000000000111100; //           ****      
         12'h6eb: data = 16'b0000000000111100; //           ****    
         12'h6ec: data = 16'b0000000000111100; //           ****   
         12'h6ed: data = 16'b0000000001111000; //          ****
         12'h6ee: data = 16'b0000000011110000; //         ****
         12'h6ef: data = 16'b0000000111100000; //        ****
			12'h6f0: data = 16'b0000001111000000; //       ****
         12'h6f1: data = 16'b0000011110000000; //      ****
         12'h6f2: data = 16'b0000011110000000; //      ****
         12'h6f3: data = 16'b0000011110000000; //      ****
         12'h6f4: data = 16'b0000011110000000; //      ****
         12'h6f5: data = 16'b0000011110000000; //      ****
         12'h6f6: data = 16'b0000011110000000; //      ****
         12'h6f7: data = 16'b0000011110000000; //      ****
         12'h6f8: data = 16'b0000011110000000; //      ****
         12'h6f9: data = 16'b0000011110000000; //      ****
         12'h6fa: data = 16'b0000011110000000; //      ****
         12'h6fb: data = 16'b0000000000000000; // 
         12'h6fc: data = 16'b0000000000000000; // 
         12'h6fd: data = 16'b0000000000000000; // 
         12'h6fe: data = 16'b0000000000000000; // 
         12'h6ff: data = 16'b0000000000000000; //
			
		//code x70 y x71      NUMERO 8
         12'h700: data = 16'b0000000000000000; // 
         12'h701: data = 16'b0000000000000000; // 
         12'h702: data = 16'b0000000000000000; // 
         12'h703: data = 16'b0000000000000000; // 
         12'h704: data = 16'b0000000000000000; // 
         12'h705: data = 16'b0001111111100000; //    ********
         12'h706: data = 16'b0011111111110000; //   **********
         12'h707: data = 16'b0111100001111000; //  ****    ****  
         12'h708: data = 16'b1111000000111100; // ****      ****      
         12'h709: data = 16'b1111000000111100; // ****      ****      
         12'h70a: data = 16'b1111000000111100; // ****      ****
         12'h70b: data = 16'b1111000000111100; // ****      ****
         12'h70c: data = 16'b1111000000111100; // ****      ****
         12'h70d: data = 16'b1111000000111100; // ****      ****
         12'h70e: data = 16'b0111100001111000; //  ****    ****
         12'h70f: data = 16'b0011111111110000; //   **********
			12'h710: data = 16'b0011111111110000; //   **********
         12'h711: data = 16'b0111100000111100; //  ****    ****
         12'h712: data = 16'b1111000000111100; // ****      ****
         12'h713: data = 16'b1111000000111100; // ****      ****
         12'h714: data = 16'b1111000000111100; // ****      ****
         12'h715: data = 16'b1111000000111100; // ****      ****
         12'h716: data = 16'b1111000000111100; // ****      ****
         12'h717: data = 16'b1111000000111100; // ****      ****
         12'h718: data = 16'b0111100001111000; //  ****    ****
         12'h719: data = 16'b0011111111110000; //   **********
         12'h71a: data = 16'b0001111111100000; //    ********
         12'h71b: data = 16'b0000000000000000; // 
         12'h71c: data = 16'b0000000000000000; // 
         12'h71d: data = 16'b0000000000000000; // 
         12'h71e: data = 16'b0000000000000000; // 
         12'h71f: data = 16'b0000000000000000; //
			
		//code x72 y x73      NUMERO 9
         12'h720: data = 16'b0000000000000000; // 
         12'h721: data = 16'b0000000000000000; // 
         12'h722: data = 16'b0000000000000000; // 
         12'h723: data = 16'b0000000000000000; // 
         12'h724: data = 16'b0000000000000000; // 
         12'h725: data = 16'b0001111111100000; //    ********
         12'h726: data = 16'b0011111111110000; //   **********
         12'h727: data = 16'b0111100001111000; //  ****    ****          
         12'h728: data = 16'b1111000000111100; // ****      ****       
         12'h729: data = 16'b1111000000111100; // ****      ****      
         12'h72a: data = 16'b1111000000111100; // ****      ****     
         12'h72b: data = 16'b1111000000111100; // ****      ****       
         12'h72c: data = 16'b1111000000111100; // ****      ****       
         12'h72d: data = 16'b1111000000111100; // ****      ****
         12'h72e: data = 16'b0111100000111100; //  ****     ****
         12'h72f: data = 16'b0011111111111100; //   ************
			12'h730: data = 16'b0001111111111100; //    ***********
         12'h731: data = 16'b0000000000111100; //           ****
         12'h732: data = 16'b0000000000111100; //           ****
         12'h733: data = 16'b0000000000111100; //           ****       
         12'h734: data = 16'b0000000000111100; //           ****       
         12'h735: data = 16'b0000000000111100; //           ****     
         12'h736: data = 16'b0000000000111100; //           ****      
         12'h737: data = 16'b0000000000111100; //           ****       
         12'h738: data = 16'b0111100001111000; //  ****    ****            
         12'h739: data = 16'b0011111111110000; //   **********
         12'h73a: data = 16'b0001111111100000; //    ********
         12'h73b: data = 16'b0000000000000000; // 
         12'h73c: data = 16'b0000000000000000; // 
         12'h73d: data = 16'b0000000000000000; // 
         12'h73e: data = 16'b0000000000000000; // 
         12'h73f: data = 16'b0000000000000000; //
			
		//code x74 y x75
         12'h740: data = 16'b0000000000000000; // 
         12'h741: data = 16'b0000000000000000; // 
         12'h742: data = 16'b0000000000000000; // 
         12'h743: data = 16'b0000000000000000; // 
         12'h744: data = 16'b0000000000000000; // 
         12'h745: data = 16'b0000000000000000; // 
         12'h746: data = 16'b0000000000000000; // 
         12'h747: data = 16'b0000000000000000; // 
         12'h748: data = 16'b0000001110000000; //        ***
         12'h749: data = 16'b0000011111000000; //       *****
         12'h74a: data = 16'b0000011111000000; //       ***** 
         12'h74b: data = 16'b0000011111000000; //       ***** 
         12'h74c: data = 16'b0000001110000000; //        ***
         12'h74d: data = 16'b0000000000000000; // 
         12'h74e: data = 16'b0000000000000000; // 
         12'h74f: data = 16'b0000000000000000; //
			12'h750: data = 16'b0000000000000000; // 
         12'h751: data = 16'b0000000000000000; // 
         12'h752: data = 16'b0000000000000000; // 
         12'h753: data = 16'b0000001110000000; //        *** 
         12'h754: data = 16'b0000011111000000; //       ***** 
         12'h755: data = 16'b0000011111000000; //       ***** 
         12'h756: data = 16'b0000011111000000; //       ***** 
         12'h757: data = 16'b0000001110000000; //        *** 
         12'h758: data = 16'b0000000000000000; // 
         12'h759: data = 16'b0000000000000000; // 
         12'h75a: data = 16'b0000000000000000; // 
         12'h75b: data = 16'b0000000000000000; // 
         12'h75c: data = 16'b0000000000000000; // 
         12'h75d: data = 16'b0000000000000000; // 
         12'h75e: data = 16'b0000000000000000; // 
         12'h75f: data = 16'b0000000000000000; //
		
		//code x76 y x77			RIN PARTE 1
         12'h760: data = 16'b0000000000000000; // 
         12'h761: data = 16'b0000000000000000; // 
         12'h762: data = 16'b0000000000000000; // 
         12'h763: data = 16'b0000000000000011; // 
         12'h764: data = 16'b0000010000000011; // 
         12'h765: data = 16'b0000111000000011; // 
         12'h766: data = 16'b0001111100000011; // 
         12'h767: data = 16'b0000111110000011; // 
         12'h768: data = 16'b0000011111000011; // 
         12'h769: data = 16'b0000001111100000; // 
         12'h76a: data = 16'b0000000111000000; // 
         12'h76b: data = 16'b0000000010000111; // 
         12'h76c: data = 16'b0000000000001111; // 
         12'h76d: data = 16'b0000000000011111; // 
         12'h76e: data = 16'b0000000000111111; // 
         12'h76f: data = 16'b0011111100111111; //
			12'h770: data = 16'b0011111100111111; // 
         12'h771: data = 16'b0011111100111111; // 
         12'h772: data = 16'b0000000000111111; // 
         12'h773: data = 16'b0000000000011111; // 
         12'h774: data = 16'b0000000000001111; // 
         12'h775: data = 16'b0000000010000111; // 
         12'h776: data = 16'b0000000111000000; // 
         12'h777: data = 16'b0000001111100000; // 
         12'h778: data = 16'b0000011111000011; // 
         12'h779: data = 16'b0000111110000011; // 
         12'h77a: data = 16'b0001111100000011; // 
         12'h77b: data = 16'b0000111000000011; // 
         12'h77c: data = 16'b0000010000000011; // 
         12'h77d: data = 16'b0000000000000011; // 
         12'h77e: data = 16'b0000000000000000; // 
         12'h77f: data = 16'b0000000000000000; //
			
		//code x78 y x79    RING PARTE 2
         12'h780: data = 16'b0000000000000000; // 
         12'h781: data = 16'b0000000000000000; // 
         12'h782: data = 16'b0000000000000000; // 
         12'h783: data = 16'b1000000000000000; // 
         12'h784: data = 16'b1000000001000000; // 
         12'h785: data = 16'b1000000011100000; // 
         12'h786: data = 16'b1000000111110000; // 
         12'h787: data = 16'b1000001111100000; // 
         12'h788: data = 16'b1000011111000000; // 
         12'h789: data = 16'b0000111110000000; // 
         12'h78a: data = 16'b0000011100000000; // 
         12'h78b: data = 16'b1100001000000000; // 
         12'h78c: data = 16'b1110000000000000; // 
         12'h78d: data = 16'b1111000000000000; // 
         12'h78e: data = 16'b1111100000000000; // 
         12'h78f: data = 16'b1111100111111000; //
			12'h790: data = 16'b1111100111111000; // 
         12'h791: data = 16'b1111100111111000; // 
         12'h792: data = 16'b1111100000000000; // 
         12'h793: data = 16'b1111000000000000; // 
         12'h794: data = 16'b1110000000000000; // 
         12'h795: data = 16'b1100001000000000; // 
         12'h796: data = 16'b0000011100000000; // 
         12'h797: data = 16'b0000111110000000; // 
         12'h798: data = 16'b1000011111000000; // 
         12'h799: data = 16'b1000001111100000; // 
         12'h79a: data = 16'b1000000111110000; // 
         12'h79b: data = 16'b1000000011100000; // 
         12'h79c: data = 16'b1000000001000000; // 
         12'h79d: data = 16'b1000000000000000; // 
         12'h79e: data = 16'b0000000000000000; // 
         12'h79f: data = 16'b0000000000000000; //
			
		//code x7a y x7b
         12'h7a0: data = 16'b0000000000000000; // 
         12'h7a1: data = 16'b0000000000000000; // 
         12'h7a2: data = 16'b0000000000000000; // 
         12'h7a3: data = 16'b0000000000000000; // 
         12'h7a4: data = 16'b0000000000000000; // 
         12'h7a5: data = 16'b0000000000001000; // 
         12'h7a6: data = 16'b0000000000001000; // 
         12'h7a7: data = 16'b0000000000011000; // 
         12'h7a8: data = 16'b0000000000011000; // 
         12'h7a9: data = 16'b0000000000110000; // 
         12'h7aa: data = 16'b0000000000110000; // 
         12'h7ab: data = 16'b0000000001100000; // 
         12'h7ac: data = 16'b0000000001100000; // 
         12'h7ad: data = 16'b0000000011000000; // 
         12'h7ae: data = 16'b0000000011000000; // 
         12'h7af: data = 16'b0000000110000000; //
			12'h7b0: data = 16'b0000000110000000; // 
         12'h7b1: data = 16'b0000001100000000; // 
         12'h7b2: data = 16'b0000001100000000; // 
         12'h7b3: data = 16'b0000011000000000; // 
         12'h7b4: data = 16'b0000011000000000; // 
         12'h7b5: data = 16'b0000110000000000; // 
         12'h7b6: data = 16'b0000110000000000; // 
         12'h7b7: data = 16'b0001100000000000; // 
         12'h7b8: data = 16'b0001100000000000; // 
         12'h7b9: data = 16'b0001000000000000; // 
         12'h7ba: data = 16'b0001000000000000; // 
         12'h7bb: data = 16'b0000000000000000; // 
         12'h7bc: data = 16'b0000000000000000; // 
         12'h7bd: data = 16'b0000000000000000; // 
         12'h7be: data = 16'b0000000000000000; // 
         12'h7bf: data = 16'b0000000000000000; //
			
		//code xc2 y xc3			a
         12'hc20: data = 16'b0000000000000000; // 
         12'hc21: data = 16'b0000000000000000; // 
         12'hc22: data = 16'b0000000000000000; // 
         12'hc23: data = 16'b0000000000000000; // 
         12'hc24: data = 16'b0000000000000000; // 
         12'hc25: data = 16'b0000000000000000; // 
         12'hc26: data = 16'b0000000000000000; // 
         12'hc27: data = 16'b0000000000000000; // 
         12'hc28: data = 16'b0000000000000000; // 
         12'hc29: data = 16'b0000000000000000; // 
         12'hc2a: data = 16'b0111111111000000; //  *********
         12'hc2b: data = 16'b0111111111100000; //  **********
         12'hc2c: data = 16'b0000000011110000; //         ****
         12'hc2d: data = 16'b0000000011110000; //         ****
         12'hc2e: data = 16'b0011111111110000; //   **********
         12'hc2f: data = 16'b0111111111110000; //  ***********
			12'hc30: data = 16'b1111100111110000; // *****  *****
         12'hc31: data = 16'b1111000011110000; // ****    ****
         12'hc32: data = 16'b1111000011110000; // ****    ****
         12'hc33: data = 16'b1111000011110000; // ****    ****
         12'hc34: data = 16'b1111000011110000; // ****    ****
         12'hc35: data = 16'b1111100111110000; // *****  *****
         12'hc36: data = 16'b0111111110111000; //  ******** ***
         12'hc37: data = 16'b0011111100011100; //   ******   ***
         12'hc38: data = 16'b0000000000000000; // 
         12'hc39: data = 16'b0000000000000000; // 
         12'hc3a: data = 16'b0000000000000000; // 
         12'hc3b: data = 16'b0000000000000000; // 
         12'hc3c: data = 16'b0000000000000000; // 
         12'hc3d: data = 16'b0000000000000000; // 
         12'hc3e: data = 16'b0000000000000000; // 
         12'hc3f: data = 16'b0000000000000000; //
			
		//code xc4 y xc5    h
         12'hc40: data = 16'b0000000000000000; // 
         12'hc41: data = 16'b0000000000000000; // 
         12'hc42: data = 16'b0000000000000000; // 
         12'hc43: data = 16'b0000000000000000; // 
         12'hc44: data = 16'b0000000000000000; //   
         12'hc45: data = 16'b0011110000000000; //   ****
         12'hc46: data = 16'b0011110000000000; //   ****
         12'hc47: data = 16'b0011110000000000; //   ****
         12'hc48: data = 16'b0011110000000000; //   **** 
         12'hc49: data = 16'b0011110000000000; //   ****
         12'hc4a: data = 16'b0011110000000000; //   ****  
         12'hc4b: data = 16'b0011110000000000; //   ****  *****
         12'hc4c: data = 16'b0011110000000000; //   **** *******
         12'hc4d: data = 16'b0011110000000000; //   ************
         12'hc4e: data = 16'b0011110011110000; //   *****   ****
         12'hc4f: data = 16'b0011110111111000; //   ****    ****
			12'hc50: data = 16'b0011111111111100; //   ****    ****
         12'hc51: data = 16'b0011111111111100; //   ****    ****
         12'hc52: data = 16'b0011111001111100; //   ****    ****
         12'hc53: data = 16'b0011110000111100; //   ****    ****
         12'hc54: data = 16'b0011110000111100; //   ****    ****
         12'hc55: data = 16'b0011110000111100; //   ****    ****
         12'hc56: data = 16'b0011110000111100; //   ****    **** 
         12'hc57: data = 16'b0011110000111100; //   ****    ****
         12'hc58: data = 16'b0011110000111100; // 
         12'hc59: data = 16'b0011110000111100; // 
         12'hc5a: data = 16'b0011110000111100; // 
         12'hc5b: data = 16'b0000000000000000; // 
         12'hc5c: data = 16'b0000000000000000; // 
         12'hc5d: data = 16'b0000000000000000; // 
         12'hc5e: data = 16'b0000000000000000; // 
         12'hc5f: data = 16'b0000000000000000; //
			
		//code xc6 y xc7    m
         12'hc60: data = 16'b0000000000000000; // 
         12'hc61: data = 16'b0000000000000000; // 
         12'hc62: data = 16'b0000000000000000; // 
         12'hc63: data = 16'b0000000000000000; // 
         12'hc64: data = 16'b0000000000000000; // 
         12'hc65: data = 16'b0000000000000000; // 
         12'hc66: data = 16'b0000000000000000; // 
         12'hc67: data = 16'b0000000000000000; // 
         12'hc68: data = 16'b0000000000000000; // 
         12'hc69: data = 16'b0000000000000000; // 
         12'hc6a: data = 16'b0000000000000000; // 
         12'hc6b: data = 16'b0011110000111100; //  ****    ****
         12'hc6c: data = 16'b0111111001111110; // ******  ******
         12'hc6d: data = 16'b0111111111111111; // ***************
         12'hc6e: data = 16'b0111101111101111; // **** ***** ****
         12'hc6f: data = 16'b0111000111000111; // ***   ***   ***
			12'hc70: data = 16'b0111000111000111; // ***   ***   ***
         12'hc71: data = 16'b0111000111000111; // ***   ***   ***  
         12'hc72: data = 16'b0111000111000111; // ***   ***   ***
         12'hc73: data = 16'b0111000111000111; // ***   ***   ***
         12'hc74: data = 16'b0111000111000111; // ***   ***   ***
         12'hc75: data = 16'b0111000111000111; // ***   ***   ***
         12'hc76: data = 16'b0111000111000111; // ***   ***   ***
         12'hc77: data = 16'b0111000111000111; // ***   ***   ***
         12'hc78: data = 16'b0000000000000000; // 
         12'hc79: data = 16'b0000000000000000; // 
         12'hc7a: data = 16'b0000000000000000; // 
         12'hc7b: data = 16'b0000000000000000; // 
         12'hc7c: data = 16'b0000000000000000; // 
         12'hc7d: data = 16'b0000000000000000; // 
         12'hc7e: data = 16'b0000000000000000; // 
         12'hc7f: data = 16'b0000000000000000; //
			
		//code xc8 y xc9    		p
         12'hc80: data = 16'b0000000000000000; // 
         12'hc81: data = 16'b0000000000000000; // 
         12'hc82: data = 16'b0000000000000000; // 
         12'hc83: data = 16'b0000000000000000; // 
         12'hc84: data = 16'b0000000000000000; // 
         12'hc85: data = 16'b0000000000000000; // 
         12'hc86: data = 16'b0000000000000000; // 
         12'hc87: data = 16'b0000000000000000; // 
         12'hc88: data = 16'b0000000000000000; // 
         12'hc89: data = 16'b0000000000000000; // 
         12'hc8a: data = 16'b1110001111110000; // ***   ******
         12'hc8b: data = 16'b0111011111111000; //  *** ********
         12'hc8c: data = 16'b0011111001111100; //   *****  *****
         12'hc8d: data = 16'b0011110000111100; //   ****    ****
         12'hc8e: data = 16'b0011110000111100; //   ****    ****
         12'hc8f: data = 16'b0011110000111100; //   ****    ****
			12'hc90: data = 16'b0011110000111100; //   ****    ****
         12'hc91: data = 16'b0011110000111100; //   ****    ****
         12'hc92: data = 16'b0011110000111100; //   ****    ****
         12'hc93: data = 16'b0011110000111100; //   ****    ****
         12'hc94: data = 16'b0011110000111100; //   ****    ****
         12'hc95: data = 16'b0011111001111100; //   *****  *****
         12'hc96: data = 16'b0011111111111000; //   ***********
         12'hc97: data = 16'b0011111111110000; //   **********
         12'hc98: data = 16'b0011110000000000; //   ****
         12'hc99: data = 16'b0011110000000000; //   ****
         12'hc9a: data = 16'b0011110000000000; //   ****
         12'hc9b: data = 16'b0011110000000000; //   ****
         12'hc9c: data = 16'b0011110000000000; //   ****
         12'hc9d: data = 16'b1111111100000000; // ********
         12'hc9e: data = 16'b0000000000000000; // 
         12'hc9f: data = 16'b0000000000000000; //
			
		//code xca y xcb
         12'hca0: data = 16'b0000000000000000; // 
         12'hca1: data = 16'b0000000000000000; // 
         12'hca2: data = 16'b0000000000000000; // 
         12'hca3: data = 16'b0000000000000000; // 
         12'hca4: data = 16'b0000000011110000; //         ****
         12'hca5: data = 16'b0000000011110000; //         ****
         12'hca6: data = 16'b0000000011110000; //         ****
         12'hca7: data = 16'b0000000011110000; //         ****
         12'hca8: data = 16'b0000000011110000; //         ****
         12'hca9: data = 16'b0000000011110000; //         ****
         12'hcaa: data = 16'b0000000011110000; //         ****
         12'hcab: data = 16'b0011111111110000; //   **********
         12'hcac: data = 16'b0111111111110000; //  ***********
         12'hcad: data = 16'b1111100111110000; // *****  *****
         12'hcae: data = 16'b1111000011110000; // ****    ****
         12'hcaf: data = 16'b1111000011110000; // ****    ****
			12'hcb0: data = 16'b1111000011110000; // ****    ****
         12'hcb1: data = 16'b1111000011110000; // ****    ****
         12'hcb2: data = 16'b1111000011110000; // ****    ****
         12'hcb3: data = 16'b1111000011110000; // ****    ****
         12'hcb4: data = 16'b1111000011110000; // ****    ****
         12'hcb5: data = 16'b1111100111110000; // *****  *****
         12'hcb6: data = 16'b0111111110111000; //  ******** ***
         12'hcb7: data = 16'b0011111100011100; //   ******   ***
         12'hcb8: data = 16'b0000000000000000; // 
         12'hcb9: data = 16'b0000000000000000; // 
         12'hcba: data = 16'b0000000000000000; // 
         12'hcbb: data = 16'b0000000000000000; // 
         12'hcbc: data = 16'b0000000000000000; // 
         12'hcbd: data = 16'b0000000000000000; // 
         12'hcbe: data = 16'b0000000000000000; // 
         12'hcbf: data = 16'b0000000000000000; //
			
		default: data = 16'b0000000000000000;
		
		endcase
	 
endmodule
