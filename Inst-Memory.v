//memory unit
module IMemBank(input memread, input [7:0] address, output reg [31:0] readdata);
 
  reg [31:0] mem_array [63:0];
  
/*  integer i;
  initial begin
      for (i=0; i<64; i=i+1)   
     mem_array[i]=i*10;
  end*/


integer i;
initial
begin
	mem_array[0] = 32'b000010_11101_11100_0000000000000000;	//load r29,r28,0
	mem_array[1] = 32'b000011_11101_11101_0000000000000001;	//addi r29,r29,1
	mem_array[2] = 32'b000000_11100_11110_11011_00000_000100;//slt r28,r30,r27
	mem_array[3] = 32'b000111_11011_00000_0000000000000001;	//beq r27,r0,1
	mem_array[4] = 32'b000000_11100_00000_11110_00000_000000;//add r28,r0,r30
	mem_array[5] = 32'b000000_11111_11100_11011_00000_000100;//slt r31,r28,r27
	mem_array[6] = 32'b000111_11011_00000_0000000000000001;	//beq r27,r0,1
	mem_array[7] = 32'b000000_11100_00000_11111_00000_000000;//add r28,r0,r31
	mem_array[8] = 32'b000111_11101_01010_0000000000000001;	//beq r29,r10,1
	mem_array[9] = 32'b001001_00000000000000000000000000;		//jmp 0
	for (i=10; i<64; i=i+1)
		mem_array[i] = 32'd0;

	
end
 
  always@(memread, address)
  begin
    if(memread)begin
      readdata=mem_array[address];
    end
  end

endmodule
