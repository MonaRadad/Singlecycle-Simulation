//memory unit
module DMemBank(input memread, input memwrite, input [7:0] address, input [31:0] writedata, output reg [31:0] readdata);
 
  reg [31:0] mem_array [63:0];
  
/*  integer i;
  initial 
  begin
      for (i=0; i<64; i=i+1)   
     mem_array[i]=i*10;
  end*/
 
  initial 
  begin
     mem_array[0]=7;
     mem_array[1]=5;
     mem_array[2]=8;
     mem_array[3]=3;
     mem_array[4]=4;
     mem_array[5]=10;
     mem_array[6]=6;
     mem_array[7]=1;
     mem_array[8]=2;
     mem_array[9]=0;
  end 
 
  always@(memread, memwrite, address, mem_array[address], writedata)
  begin
    if(memread)begin
      readdata=mem_array[address];
    end

    if(memwrite)
    begin
      mem_array[address]= writedata;
    end

  end

endmodule

