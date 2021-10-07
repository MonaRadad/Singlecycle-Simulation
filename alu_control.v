module alu_control(
    input [2:0] aluop,
    input [5:0] func,
    output reg [3:0] aluoperation
    );

always@(*)
begin
	if(aluop == 3'b000)
	begin
		if(func == 6'b000000)
		begin
			aluoperation = 4'b0000;//add
		end
		else if(func == 6'b000001)
		begin		
			aluoperation = 4'b0001;//sub
		end	
		else if(func == 6'b000010)
		begin
			aluoperation = 4'b0011;//or
		end
		else if(func == 6'b000011)
		begin
			aluoperation = 4'b0010;//and
		end
		else if(func == 6'b000100)
		begin
			aluoperation = 4'b0100;//slt
		end
	end
	else if(aluop == 3'b001)
	begin
		aluoperation = 4'b0000;//add
	end
	else if(aluop == 3'b010)
	begin
		aluoperation = 4'b0001;//sub	
	end
	else if(aluop == 3'b011)
	begin
		aluoperation = 4'b0010;//and
	end
	else if(aluop == 3'b100)
	begin
		aluoperation = 4'b0011;//or
	end
	else if(aluop == 3'b101)
	begin
		aluoperation = 4'b0100;//slt
	end
	else
	begin
		aluoperation = 4'b0000;//add
	end
end

endmodule
