module led(clk,led,win);
input clk;
input[2:0] win;
output[7:0]led;
reg[7:0]led;
reg[2:0]state;
reg[4:0]ledstate;
parameter S0=4'b0001,S1=4'b0010,S2=4'b0011;
always@(posedge clk)
begin
     if(win==1)
     begin
		  if(ledstate<=7)
			 ledstate<=ledstate+1'b1;
		  else ledstate<=0;
	 end
	 else if(win==2)
	 begin
		  if(ledstate>7) ledstate<=0;
		  else if(ledstate==0) ledstate<=7;
		  else ledstate<=ledstate-1'b1;
	 end
	 else
	 ledstate<=8;
end
always@(posedge clk)
  begin
     case(ledstate)
     0:led<=8'b01111111;
     1:led<=8'b10111111;
     2:led<=8'b11011111;
     3:led<=8'b11101111;
     4:led<=8'b11110111;
     5:led<=8'b11111011;
     6:led<=8'b11111101;
     7:led<=8'b11111110; 
     8:led<=8'b00000000;            
     endcase
     end
     endmodule 