`include "environment.sv"

program test(intf i_intf);
  environment e;
  initial begin
    e = new(i_intf);
    e.run();
  end
endprogram
