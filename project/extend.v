module extend(into,out);
input [21:0] into;
output reg [31:0] out;

always @(into)
begin
	out[21:0] = into;

	if( into[21] == 0 )
	begin
		out[31:22] = 10'b0000000000;
	end	
	else
	begin
		out[31:22] = 10'b1111111111;
	end
	
end

initial
begin
	out=0;
end
endmodule
