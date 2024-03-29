module mem					(
   input                  clk,
   input                  wr,
   input         [9:0]    addr,
   input         [7:0]    d_i,
   output logic  [7:0]    d_o);
   
   logic         [7:0]    mem   [1024];

   always @ (posedge clk) begin
      if(wr)
         mem[addr]   <= d_i;
      d_o  <=  mem[addr];
   end
endmodule
