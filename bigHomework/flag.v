module flag(clk,sum,high,low);
input clk;
input[4:0] sum;
output[3:0] low;
reg[3:0] low;
output[3:0] high;
reg[3:0] high;

always@(clk)
if(sum > 9)
begin
high <= 1;
low <= sum % 10;
end
else
begin
high <= 0;
low <= sum;
end
endmodule