module yima(clk,data,out);
input [3:0]data;
input clk;
output [6:0]out;
reg [6:0]out;
always@(posedge clk)
  begin
    case(data)
      4'b0000:out<=7'b0000_001;
      4'b0001:out<=7'b1001_111;
      4'b0010:out<=7'b0010_010;
      4'b0011:out<=7'b0000_110;
      4'b0100:out<=7'b1001_100;
      4'b0101:out<=7'b0100_100;
      4'b0110:out<=7'b0100_000;
      4'b0111:out<=7'b0001_111;
      4'b1000:out<=7'b0000_000;
      4'b1001:out<=7'b0000_100;
	  default:out<=7'b0000_001;
    endcase
  end
 endmodule