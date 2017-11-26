
//PC

module PC(clock, in, out);
input clock;
input [7:0]in;

reg [7:0]instr;

output reg [7:0]out;

always @(posedge clock) begin
	out = instr;
	instr = in;
end
initial begin
    out = 1;
end
endmodule
