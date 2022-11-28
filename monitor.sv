`define M_IF vif.MONITOR.monitor_cb

class monitor;
  virtual intf vif;
  mailbox mon2scb;
  
  function new(virtual intf vif,mailbox mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction
  
  task main();
    repeat(1)
      #15
      begin
        transaction t;
        t = new();
        @(posedge vif.MONITOR.clk)
        begin
          t.j = `M_IF.j;
          t.k = `M_IF.k;
          t.q = `M_IF.q;
        end
        mon2scb.put(t);
        t.display("MONITOR");
      end
  endtask
endclass
