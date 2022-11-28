`include "interface.sv"
`include "test.sv"

module top;
  bit clk;
  bit rst;
  
  always #5 clk = ~clk;
  initial begin
    rst=1;
    #1 rst=0;
  end
  
  intf i_intf(clk,rst);
  test t1(i_intf);
  jkflipflop jk(
    .j(i_intf.j),
    .k(i_intf.k),
    .clk(i_intf.clk),
    .rst(i_intf.rst),
    .q(i_intf.q));
endmodule
