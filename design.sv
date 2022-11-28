module jkflipflop(j,k,clk,rst,q);
  input bit j,k,clk,rst;
  output bit q;
  always@(posedge clk)
    begin
      if(rst)
        q<=1'b0;
      else
        begin
          case({j,k})
            2'b00 : q<=q;  //q value will be 0
            2'b01 : q<=1'b0;
            2'b10 : q<=1'b1;
            2'b11 : q<=~q;  //q value will be 1
          endcase
        end
    end
endmodule
