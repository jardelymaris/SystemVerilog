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

//// SOMADOR E MULTIPLICADOR ////
// declarando variaveis de entrada e de resultado
logic signed[2:0] a;
logic signed[2:0] b;
logic[2:0] a1;
logic[7:5] b1;
logic[1:0] F;
logic signed[7:0] result;
logic[7:0] result1;

always_comb begin
 a <= SWI[7:5];
 b <= SWI[2:0];
 a1 <= SWI[2:0];
 b1 <= SWI[7:5];
 F[1:0] <= SWI[4:3];

 if(F == 0) begin 
	result <= a+b;
	result1 <= 0; 
 end else if (F == 1) begin
	
	result <= a-b;
	result1 <= 0; 
 end else if (F == 2) begin 
	result <= 0;
	result1 <= a1*b1; 
 end else begin
	result <= 0;
	result1 <= a*b; 
 end

 LED[5:0] <= result[5:0];
 LED[5:0] <= result1[5:0];

 case(result)
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
 -1:
 begin
	SEG[7:0] <= 8'b10000110;
 end
 -2:
 begin
	SEG[7:0] <= 8'b11011011;
 end
 -3:
 begin
	SEG[7:0] <= 8'b11001111;
 end
 -4:
 begin
	SEG[7:0] <= 8'b11100110;
 end
 default
	SEG[7:0] <= 8'b10000000;
 endcase

end
endmodule
