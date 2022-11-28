class scoreboard;
  mailbox mon2scb;
  
  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction
  
  task main();
    transaction t;
    repeat(1)
      begin
        mon2scb.get(t);
        if(t.j==1'b0 && t.k==1'b0 && t.q==t.q)
          $display("RESULT AS EXPECTED");
        else if(t.j==1'b0 && t.k==1'b1 && t.q==1'b0)
          $display("RESULT AS EXPECTED");
        else if(t.j==1'b1 && t.k==1'b0 && t.q==1'b1)
          $display("RESULT AS EXPECTED");
        else if(t.j==1'b1 && t.k==1'b1 && t.q==~t.q)
          $display("RESULT AS EXPECTED");
        else
          $display("RESULT IS WRONG");
      end
    t.display("SCOREBOARD");
  endtask
endclass
