module control_unit(
    input [5:0] op,
    output reg regDest,
    output reg jump,
    output reg [1:0]branch,//branch[0] = branch eq |||| branch[1] = branch neq
    output reg memRead,
    output reg memToReg,
    output reg [2:0] aluop,
    output reg memWrite,
    output reg aluSrc,
    output reg regWrite
    );

always@(*)
begin
	if(op == 6'b000000)//R_type
	begin
	   regDest  = 1'b1;
		jump 		= 1'b0;
		branch 	= 2'b00;
		memRead 	= 1'b0;
		memToReg = 1'b0;
		aluop 	= 3'b000;
		memWrite =1'b0;
		aluSrc   =1'b0;
		regWrite =1'b1;
	end
	else if(op == 6'b000001)//sw
	begin
	   regDest  = 1'b0;
		jump 		= 1'b0;
		branch 	= 2'b00;
		memRead 	= 1'b0;
		memToReg = 1'b0;//dont care
		aluop 	= 3'b001;//add
		memWrite =1'b1;
		aluSrc   =1'b1;
		regWrite =1'b0;
	end
	else if(op == 6'b000010)//lw
	begin
	   regDest  = 1'b0;
		jump 		= 1'b0;
		branch 	= 2'b00;
		memRead 	= 1'b1;
		memToReg = 1'b1;
		aluop 	= 3'b001;//add
		memWrite =1'b0;
		aluSrc   =1'b1;
		regWrite =1'b1;
	end
	else if(op == 6'b000011)//addi
	begin
	   regDest  = 1'b0;
		jump 		= 1'b0;
		branch 	= 2'b00;
		memRead 	= 1'b0;
		memToReg = 1'b0;
		aluop 	= 3'b001;//add
		memWrite =1'b0;
		aluSrc   =1'b1;
		regWrite =1'b1;
	end
	else if(op == 6'b000100)//slti
	begin
	   regDest  = 1'b0;
		jump 		= 1'b0;
		branch 	= 2'b00;
		memRead 	= 1'b0;
		memToReg = 1'b0;
		aluop 	= 3'b101;//sub
		memWrite =1'b0;
		aluSrc   =1'b1;
		regWrite =1'b1;
	end
	else if(op == 6'b000101)//andi
	begin
	   regDest  = 1'b0;
		jump 		= 1'b0;
		branch 	= 2'b00;
		memRead 	= 1'b0;
		memToReg = 1'b0;
		aluop 	= 3'b011;//and
		memWrite =1'b0;
		aluSrc   =1'b1;
		regWrite =1'b1;
	end
	else if(op == 6'b000110)//ori
	begin
	   regDest  = 1'b0;
		jump 		= 1'b0;
		branch 	= 2'b00;
		memRead 	= 1'b0;
		memToReg = 1'b0;
		aluop 	= 3'b100;//or
		memWrite =1'b0;
		aluSrc   =1'b1;
		regWrite =1'b1;
	end
	else if(op == 6'b000111)//beq
	begin
	   regDest  = 1'b0;
		jump 		= 1'b0;
		branch 	= 2'b01;
		memRead 	= 1'b0;
		memToReg = 1'b0;
		aluop 	= 3'b010;//sub
		memWrite =1'b0;
		aluSrc   =1'b0;
		regWrite =1'b0;
	end
	else if(op == 6'b001000)//bne
	begin
	   regDest  = 1'b0;
		jump 		= 1'b0;
		branch 	= 2'b10;
		memRead 	= 1'b0;
		memToReg = 1'b0;
		aluop 	= 3'b010;//sub
		memWrite =1'b0;
		aluSrc   =1'b0;
		regWrite =1'b0;
	end
	else if(op == 6'b001001)//jmp
	begin
	   regDest  = 1'b0;
		jump 		= 1'b1;
		branch 	= 2'b00;
		memRead 	= 1'b0;
		memToReg = 1'b0;
		aluop 	= 3'b010;//sub
		memWrite =1'b0;
		aluSrc   =1'b1;
		regWrite =1'b0;
	end
	else
	begin
	   regDest  = 1'b0;
		jump 		= 1'b0;
		branch 	= 2'b00;
		memRead 	= 1'b0;
		memToReg = 1'b0;
		aluop 	= 3'b010;//sub
		memWrite =1'b0;
		aluSrc   =1'b1;
		regWrite =1'b0;	
	end
end
endmodule
