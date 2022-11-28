`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  generator g;
  driver d;
  monitor m;
  scoreboard s;
  mailbox gen2driv;
  mailbox mon2scb;
  virtual intf vif;
  
  function new(virtual intf vif);
    this.vif = vif;
    gen2driv = new();
    mon2scb = new();
    g = new(gen2driv);
    d = new(vif,gen2driv);
    m = new(vif,mon2scb);
    s = new(mon2scb);
  endfunction
  
  task test();
    fork
      g.main();
      d.main();
      m.main();
      s.main();
    join
  endtask
  
  task run;
    repeat(1)
      begin
        test();
        $finish;
      end
  endtask
endclass
