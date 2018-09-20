// DESCRIPTION: Verilator: Systemverilog example module
// with interface to switch buttons, LEDs, LCD and register display

parameter NINSTR_BITS = 32;
parameter NBITS_TOP = 8, NREGS_TOP = 32;
module top(input  logic clk_2,
           input  logic [NBITS_TOP-1:0] SWI,
           output logic [NBITS_TOP-1:0] LED,
           output logic [NBITS_TOP-1:0] SEG,
           output logic [NINSTR_BITS-1:0] lcd_instruction,
           output logic [NBITS_TOP-1:0] lcd_registrador [0:NREGS_TOP-1],
           output logic [NBITS_TOP-1:0] lcd_pc, lcd_SrcA, lcd_SrcB,
             lcd_ALUResult, lcd_Result, lcd_WriteData, lcd_ReadData, 
           output logic lcd_MemWrite, lcd_Branch, lcd_MemtoReg, lcd_RegWrite);

//// DISPLAY DE 7 SEGMENTOS ////
// declarando variaveis de entrada e de resultado
logic a;
logic b;
logic c;
logic d;
logic e;
logic f;
int resultado;
always_comb begin 
	a <= SWI[0];
	b <= SWI[1];
	c <= SWI[2];
	d <= SWI[3];
	e <= SWI[4];
	f <= SWI[5];


  resultado <= (a + b*2 + c*4 + d*8 + e*16 + f*32);

case (resultado)
0:
begin
SEG[7:0] <= 8'b00111111;
end
1:
begin
SEG[7:0] <= 8'b00000110;
end
2:
begin
SEG[7:0] <= 8'b01011011;
end
3:
begin
SEG[7:0] <= 8'b01001111;
end
4:
begin
SEG[7:0] <= 8'b01100110;
end
5:
begin
SEG[7:0] <= 8'b01101101;
end
6:
begin
SEG[7:0] <= 8'b01111101;
end
7:
begin
SEG[7:0] <= 8'b00000111;
end
8:
begin
SEG[7:0] <= 8'b01111111;
end
9:
begin
SEG[7:0] <= 8'b01101111;
end
10:
begin
SEG[7:0] <= 8'b01110111;
end
11:
begin
SEG[7:0] <= 8'b01111100;
end
12:
begin
SEG[7:0] <= 8'b00111001;
end
13:
begin
SEG[7:0] <= 8'b01011110;
end
14:
begin
SEG[7:0] <= 8'b01111001;
end
15:
begin
SEG[7:0] <= 8'b01110001;
end
16:
begin
SEG[7:0] <= 8'b01110111;
end
17:
begin
SEG[7:0] <= 8'b01111100;
end
18:
begin
SEG[7:0] <= 8'b00111001;
end
19:
begin
SEG[7:0] <= 8'b01011000;
end
20:
begin
SEG[7:0] <= 8'b01011110;
end
21:
begin
SEG[7:0] <= 8'b01111001;
end
22:
begin
SEG[7:0] <= 8'b01110001;
end
23:
begin
SEG[7:0] <= 8'b01101111;
end
24:
begin
SEG[7:0] <= 8'b01110110;
end
25:
begin
SEG[7:0] <= 8'b01110100;
end
26:
begin
SEG[7:0] <= 8'b00000100;
end
27:
begin
SEG[7:0] <= 8'b00000110;
end
28:
begin
SEG[7:0] <= 8'b00011110;
end
29:
begin
SEG[7:0] <= 8'b00111000;
end
30:
begin
SEG[7:0] <= 8'b01010100;
end
31:
begin
SEG[7:0] <= 8'b00111111;
end
32:
begin
SEG[7:0] <= 8'b01011100;
end
33:
begin
SEG[7:0] <= 8'b01110011;
end
34:
begin
SEG[7:0] <= 8'b01100111;
end
35:
begin
SEG[7:0] <= 8'b01010000;
end
36:
begin
SEG[7:0] <= 8'b01101101;
end
37:
begin
SEG[7:0] <= 8'b01111000;
end
38:
begin
SEG[7:0] <= 8'b00111110;
end
39:
begin
SEG[7:0] <= 8'b00011100;
end
40:
begin
SEG[7:0] <= 8'b01101110;
end
41:
begin
SEG[7:0] <= 8'b01100011;
end
default begin
SEG[7:0] <= 8'b10000000;
end 
endcase

end

endmodule
