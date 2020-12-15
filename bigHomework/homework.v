module homework(clkin,reset,count,throwa,throwb,scorea1,scorea2,scoreb1,scoreb2,win,suma,sumb);
input clkin,reset;
input[3:0] count;
input throwa,throwb;
output[3:0] scorea1,scorea2,scoreb1,scoreb2;
reg[3:0] scorea1,scorea2,scoreb1,scoreb2;
output[2:0] win;
reg[2:0] win;
reg[6:0] state;
output[4:0] suma,sumb;
reg[4:0] suma,sumb;
reg[4:0] regsuma,regsumb;
reg flag;
parameter
	s0=4'b0000, 
    s1=4'b0001,
    s2=4'b0010,
    s3=4'b0011,
    s4=4'b0100,
    s5=4'b0101,
    s6=4'b0110;
always@(posedge clkin)
 begin
	if(!reset)
	begin
		win<=0;
		state<=s0;
		flag<=0;
		scorea1<=0;
		scorea2<=0;
		scoreb1<=0;
		scoreb2<=0;
		suma<=0;
		sumb<=0;
	end
	else 
	begin
	case(state)
		s0:if(!throwa)
		begin
		scorea1<=count;
		state<=s1;
		end
		else
		scorea1<=scorea1;
		s1:if(!throwb)
		begin
		scoreb1<=count;
		state<=s2;
		end
		else
		scoreb1<=scoreb1;
		s2:if(!throwa)
		begin
		scorea2<=count;
		state<=s3;
		end
		else
		scorea2<=scorea2;
		s3:if(!throwb)
		begin
		scoreb2<=count;
		state<=s4;
		end
		else
		scoreb2<=scoreb2;
		s4:
		begin
		if(flag==0)
		state<=s5;
		else
		state<=s6;
		end
		s5:
		begin
		suma <= scorea1 + scorea2;
		sumb <= scoreb1 + scoreb2;
		if((suma == 5 || suma == 11) && (sumb == 5 || sumb == 11))
		begin
		win <= 0;
		state<=s0;
		flag<=1;
		end
		else if(suma == 5 || suma == 11)
		win <= 1;
		else if(sumb == 5 || sumb == 11)
		win <= 2;
		else
		begin
		flag <= 1;
		end
		state<=s0;
		end
		s6:
		begin
			regsuma = scorea1 + scorea2;
			regsumb = scoreb1 + scoreb2;
			if((regsuma == suma || (regsumb == 5 || regsumb == 11)) && (regsumb == sumb || (regsuma == 5 || regsuma == 11)))
			begin
			win<=0;
			state<=s0;
			suma = scorea1 + scorea2;
			sumb = scoreb1 + scoreb2;
			end
			else if(regsuma == suma)
			win <= 1;
			else if(regsumb == sumb)
			win <= 2;
			else if(regsuma == 5 || regsuma == 11)
			win <= 2;
			else if(regsumb == 5 || regsumb == 11)
			win <= 1;

			else
			begin
			state<=s0;
			suma = scorea1 + scorea2;
			sumb = scoreb1 + scoreb2;
			end
				
			end
		default:
		begin
		state<=s0;
		scorea1<=0;
		scorea2<=0;
		scoreb1<=0;
		scoreb2<=0;
		end
		endcase
	end	
	
end
endmodule