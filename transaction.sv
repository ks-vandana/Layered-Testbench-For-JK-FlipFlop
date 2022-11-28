class transaction;
  rand bit j;
  rand bit k;
  bit q;
  
  function void display(string name);
    $display("---------------------------");
    $display("%s",name);
    $display("---------------------------");
    $display("j=%b k=%b",j,k);
    $display("q=%b",q);
    $display("---------------------------");
  endfunction
  
  covergroup cov;
    coverpoint j;
    coverpoint k;
  endgroup
  
  task run();
    cov.sample();
  endtask
endclass
