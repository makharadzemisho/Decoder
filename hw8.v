`timescale 1ns / 1ps
module hw8(
		input [31:0] instruction,
		input [3:0] flags,
		output reg [1:0] OP,
		output reg [3:0] Base, Bits, Reg_data,
		output reg [23:0] Iminstruction,
		output reg [11:0] Iminstruction_memory,
		output reg en_jump, en_regjump,en_flags, en_datawr, datamemory, data_memory, en_datamemory
    );
		
		
		reg s, i;
		
		always @(*)
		begin
			Bits<=instruction[24:21];
			OP<=instruction[27:26];
			s<=instruction[20];
			i<=instruction[25];
			
			if(OP==0)
				begin
					en_jump <=0;
					en_regjump<=0;
					Iminstruction <=0;
					Base <=instruction[19:16];
					Reg_data <= instruction[15:12];
					datamemory <=0;
					Iminstruction_memory <=instruction[11:0];
					data_memory <= 0;
					en_datamemory<=0;
						if(s==1)
							en_flags<=1;
						else
							en_flags<=0;
						if (Bits == 10)
							en_datawr <=0;
						else
							en_datawr <=1;
				end
			else if(OP==1)
				begin
					en_jump <=0;
					en_regjump<=0;
					Iminstruction <=0;
					en_flags <= 0;
					en_datawr<=0;
					Base <= instruction[19:16];
					Reg_data <= instruction[15:12];
					en_datamemory<=1;
						if(s==1)
							begin
								datamemory <= 1;
								data_memory <= 0;
								en_datamemory<=1;
							end
						else
							begin
								datamemory <= 0;
								data_memory <= 1;
								en_datamemory<=0;
							end
							
							
						if(i==1)
							Iminstruction_memory<=instruction[11:0];
						else
							Iminstruction_memory<=0;
				end
				
			else if(OP==2)
				begin
					en_jump <=1;
					en_regjump<=1;
					Iminstruction <=instruction[23:0];
					en_flags <= 0;
					en_datawr<=0;
					Base <= 0;
					Reg_data <= 15;
					en_datamemory<=0;
					Iminstruction_memory<=0;
					data_memory<=0;
					datamemory<=0;
				end
			else if(OP==3)
				begin
					en_jump <=0;
					en_regjump<=0;
					Iminstruction <=0;
					en_flags <= 0;
					en_datawr<=0;
					Base <= 0;
					Reg_data <= 0;
					en_datamemory<=0;
					datamemory<=0;
					data_memory<=0;
					Iminstruction_memory<=0;
				end
			
		end
					

endmodule
