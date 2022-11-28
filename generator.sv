class generator;
  transaction t;
  mailbox gen2driv;
  
  function new(mailbox gen2driv);
    this.gen2driv= gen2driv;
  endfunction
  
  task main();
    repeat(1)
      begin
        t = new();
        t.randomize();
        gen2driv.put(t);
        t.display("GENERATOR");
        t.run();
      end
  endtask
 
endclass
