module bmc100
(
   input    [1:0] rx_pair,
   output   logic [1:0] path_0_bmc,
   output   logic [1:0] path_1_bmc);
  
  logic temp00, temp01, temp10, temp11;
  
  always_comb begin
    temp00 = rx_pair[0];
    temp01 = rx_pair[1];
    temp10 = !temp00;
    temp11 = !temp01;
    
    path_0_bmc[1] = temp00 & temp01;
    path_0_bmc[0] = temp00 ^ temp01;
    path_1_bmc[1] = temp10 & temp11;
    path_1_bmc[0] = temp10 ^ temp11;
  end

endmodule
