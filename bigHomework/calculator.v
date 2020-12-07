module calculator(clk,rst,count);
input clk,rst;
output[3:0] count;
reg[3:0] count;
always @(posedge clk or negedge rst)
begin
	if(!rst)
		begin
			count <= 1'd1;
		end
	else
		begin
			if(count == 4'd6)
				begin
					count <= 1'd1;
				end
			else
				begin
					count <= count + 1'b1;
				end
		end
end
endmodule