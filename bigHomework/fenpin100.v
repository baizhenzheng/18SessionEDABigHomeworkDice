module fenpin100 (clkin,out);
input clkin;
output out;
reg out;
reg[7:0] num1;
    
   always@(posedge clkin)
   begin
        if(num1 == 49)
        begin
        out <= ~out;
        num1<=0;
        end
        else
        num1<=num1+1;
   end
        
endmodule