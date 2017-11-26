
module Control(opcode, regwrite, memtoreg, pctoreg, brzero, aluop, memread, memwrite, jump, jumpmem, brneg)

input [3:0] opcode;

output reg regwrite;
output reg memtoreg;
output reg pctoreg;
output reg brzero;
output reg [3:0] aluop;
output reg memread;
output reg memwrite;
output reg jump;
output reg jumpmem;
output reg brneg;

//output reg [4:0] EXOut; // ALUOP, MemRead, MemWrite (ALUOP is three bits)
output reg [6:0] MEMOut; // RegWrite, MemToReg, PCtoReg, Jump, JumpMem, BranchN, BranchZ

begin

	regwrt = 0;
	memtoreg = 0;
	pctoreg = 0;
	brzero = 0;
	aluop = 4'b0100;
	memread = 0;
	memwrite = 0;
	jump = 0;
	jumpmem = 0;
	brneg = 0;

	case (opcode)

	//should ADD and LDPC be the same aluop? AND increment? something seems off

		//NOOP
		4'b0000: begin aluop = 4'b0100; end

		//LDPC
		4'b1111: begin aluop = 4'b0000; regwrite = 1; pctoreg = 1; end

		//LOAD
		4'b1110: begin aluop = 4'b0100; memread = 1; regwrite = 1; memtoreg = 1; end

		//STORE
		4'b0011: begin aluop = 4'b0100; memwrite = 1; end

		//ADD
		4'b0100: begin aluop = 4'b0000; regwrite = 1; end

		//INCREMENT
		4'b0101: begin aluop = 4'b0000; regwrite = 1; end

		//NEGATE
		4'b0110: begin aluop = 4'b0010; regwrite = 1; end

		//SUBTRACT
		4'b0111: begin aluop = 4'b0011; regwrite = 1; end

		//JUMP
		4'b1000: begin aluop = 4'b0100; jump = 1; end

		//BRZERO
		4'b1001: begin aluop = 4'b0100; brzero = 1; end

		//JUMPMEM
		4'b1010: begin aluop = 4'b0100; jumpmem = 1; end

		//BNEG
		4'b1011: begin aluop = 4'b0100; brneg = 1; end

	endcase

end

initial begin
   
	regwrt = 0;
	memtoreg = 0;
	pctoreg = 0;
	brzero = 0;
	aluop = 4'b0100;
	memread = 0;
	memwrite = 0;
	jump = 0;
	jumpmem = 0;
	brneg = 0;

end
endmodule