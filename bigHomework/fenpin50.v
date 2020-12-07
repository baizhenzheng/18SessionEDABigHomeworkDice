module fenpin50 (clkin,out);
input clkin;
output out;
reg out;
reg[5:0] num1;
    
   always@(posedge clkin)
   begin
        if(num1 == 24)
        begin
        out <= ~out;
        num1<=0;
        end
        else
        num1<=num1+1;
   end
        
endmodule