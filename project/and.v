module and(a,b,c)
input a;
input b;

output reg c;

always@(a or b)
begin
	if(a == 0 || b == 0)
	begin	
		c = 0;
	end
	else
	begin
		c = 1;
	end
		
end
initial
begin
	a=0;
	b=0;
	c=0;
end
endmodule
