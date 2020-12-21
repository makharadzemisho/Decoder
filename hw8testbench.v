`timescale 1ns / 1ps


module hw8testbench;

	// Inputs
	reg [31:0] instruction;
	reg [3:0] flags;

	// Outputs
	wire [1:0] OP;
	wire [3:0] Base;
	wire [3:0] Bits;
	wire [3:0] Reg_data;
	wire [23:0] Iminstruction;
	wire [11:0] Iminstruction_memory;
	wire en_jump;
	wire en_regjump;
	wire en_flags;
	wire en_datawr;
	wire datamemory;
	wire data_memory;
	wire en_datamemory;

	// Instantiate the Unit Under Test (UUT)
	hw8 uut (
		.instruction(instruction), 
		.OP(OP), 
		.Base(Base), 
		.Bits(Bits), 
		.Reg_data(Reg_data), 
		.Iminstruction(Iminstruction), 
		.Iminstruction_memory(Iminstruction_memory), 
		.en_jump(en_jump), 
		.en_regjump(en_regjump), 
		.en_flags(en_flags), 
		.en_datawr(en_datawr), 
		.datamemory(datamemory), 
		.data_memory(data_memory), 
		.en_datamemory(en_datamemory)
	);

	initial begin
		// Initialize Inputs
		instruction = 0;
		flags = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		
		instruction = 32'b11010011010010010110111111111111;	
		
		#100;
		
		instruction = 32'b10010011111001011010011111111111;	

		#100;
		
		

		instruction = 32'b11010111111100001000111011000000;	
		
		#100;
		
		instruction = 32'b10010101111011000001000011111111;	
		
		#100;


	
		instruction = 32'b11101011101010101010101010101010;	
		
		#100;
		
		instruction = 32'b11011011010101010101010101010101;	



	end
      
endmodule

