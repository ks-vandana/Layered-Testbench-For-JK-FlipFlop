`define D_IF vif.DRIVER.driver_cb

class driver;
  virtual intf vif;
  mailbox gen2driv;
  
  function new(virtual intf vif,mailbox gen2driv);
    this.vif = vif;
    this.gen2driv = gen2driv;
  endfunction
  
  task main();
      begin
        transaction t;
        gen2driv.get(t);
        @(posedge vif.DRIVER.clk)
        begin
          `D_IF.j <= t.j;
          `D_IF.k <= t.k;
          t.q = `D_IF.q;
          t.display("DRIVER");
        end
      end
  endtask
endclass
