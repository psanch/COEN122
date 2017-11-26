module or(a,b,c)
input a;
input b;

output reg c;

always@(a or b)
begin

	if(a == 1 || b == 1)
	begin
		c = 1;
	end
	else
	begin
		c = 0;
	end
end

initial
begin
	a = 0;
	b = 0;
	c = 0;
end
endmodule

