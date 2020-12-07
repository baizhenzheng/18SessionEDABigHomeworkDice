module qudou (clock,clkin,clkout);
input clock,clkin;
output clkout;
reg[3:0] count;
reg clkout;
always @(posedge clock)
 begin
  if(clkin==1)
  begin 
   count<=count+1'b1;
   if (count<=8) clkout<=0;
   else 
   begin 
     clkout<=clkin;
     count<=9;
     end
     end
     else
     begin
     count <=0;
       clkout<=0;
       end
    end
   endmodule