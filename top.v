module top(
    input clk
    );
	 
wire regDest;
wire jump;
wire [1:0]branch;
wire memRead;
wire memToReg;
wire [2:0] aluop;
wire memWrite;
wire aluSrc;
wire regWrite;
wire [31:0] instruction;
wire [31:0] new_pc;
wire [31:0] sign_out;
wire [4:0] mux5_out;
wire [31:0] readData1;
wire [31:0] readData2;
wire [31:0] writedata;
wire [3:0] aluoperation;
wire [31:0] alu_data2;
wire [31:0] alu_res;
wire zero;
wire lt;
wire gt;
wire [31:0] DMem_data_out;
wire beq_and;
wire bneq_and;
wire branch_mux;
wire [31:0] branch_mux_out;
wire [31:0] mux_pc;


reg [31:0] pc = 0;

assign new_pc = pc + 1;
assign beq = branch[0]&zero;
assign bneq = branch[1]&(!zero);
assign branch_mux = beq | bneq;

IMemBank inst_IMemBank
(.memread(1'b1),
.address(pc[7:0]), 
.readdata(instruction));

control_unit inst_control_unit
(.op(instruction[31:26]),
.regDest(regDest),
.jump(jump),
.branch(branch),
.memRead(memRead),
.memToReg(memToReg),
.aluop(aluop),
.memWrite(memWrite),
.aluSrc(aluSrc),
.regWrite(regWrite));

sign_extend inst_sign_extend
(.a(instruction[15:0]),
.z(sign_out));

mux_2to1_5 inst_mux_2to1_5
(.a(instruction[20:16]),
.b(instruction[15:11]),
.sel(regDest),
.z(mux5_out));

RegFile inst_RegFile
(.clk(clk),
.readreg1(instruction[25:21]),
.readreg2(instruction[20:16]),
.writereg(mux5_out),
.writedata(writedata),
.RegWrite(regWrite),
.readdata1(readData1),
.readdata2(readData2));

alu_control inst_alu_control
(.aluop(aluop),
.func(instruction[5:0]),
.aluoperation(aluoperation));

mux_2to1_32 inst_mux_2to1_32
(.a(readData2),
.b(sign_out),
.sel(aluSrc),
.z(alu_data2));

ALU inst_ALU 
(.data1(readData1),
.data2(alu_data2),
.aluoperation(aluoperation),
.result(alu_res),
.zero(zero),
.lt(lt),
.gt(gt));

DMemBank inst_DMemBank
(.memread(memRead),
.memwrite(memWrite),
.address(alu_res[7:0]),
.writedata(readData2),
.readdata(DMem_data_out));

mux_2to1_32 inst_mux_2to1_32_2
(.a(alu_res),
.b(DMem_data_out),
.sel(memToReg),
.z(writedata));

mux_2to1_32 inst_mux_2to1_32_3 
(.a(new_pc),
.b(sign_out+new_pc),
.sel(branch_mux),
.z(branch_mux_out));

mux_2to1_32 inst_mux_2to1_32_4
(.a(branch_mux_out),
.b({new_pc[31:26],instruction[25:0]}),
.sel(jump),
.z(mux_pc));

always@(posedge clk)
begin
	pc = mux_pc; 
end



endmodule
