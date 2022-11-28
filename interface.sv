interface intf(input bit clk,rst);
  bit j;
  bit k;
  bit q;
  
  clocking driver_cb@(posedge clk);
    default input #1 output #1;
    output j;
    output k;
    input q;
  endclocking
  
  clocking monitor_cb@(posedge clk);
    default input #1 output #1;
    input j;
    input k;
    input q;
  endclocking
  
  modport DRIVER(clocking driver_cb,input clk,rst);
  modport MONITOR(clocking monitor_cb,input clk,rst);
      
endinterface
