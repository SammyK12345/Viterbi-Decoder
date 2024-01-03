module ACS		                        // add-compare-select
(
   input       path_0_valid,
   input       path_1_valid,
   input [1:0] path_0_bmc,	            // branch metric computation
   input [1:0] path_1_bmc,				
   input [7:0] path_0_pmc,				// path metric computation
   input [7:0] path_1_pmc,

   output logic        selection,
   output logic        valid_o,
   output logic  [7:0] path_cost);  

   logic  [7:0] path_cost_0;			   // branch metric + path metric
   logic  [7:0] path_cost_1;

/* Fill in the guts per ACS instructions
*/

   always_comb begin
    path_cost_0 = path_0_bmc + path_0_pmc;
    path_cost_1 = path_1_bmc + path_1_pmc;
   end
  
   always_comb begin
    valid_o = 0;
    path_cost = 0;
    selection = 0;
    
    if(path_0_valid == 1 || path_1_valid == 1)
      valid_o = 1;
    
    if(path_0_valid == 1 && path_1_valid == 1) begin
      if(path_cost_0 > path_cost_1)
        selection = 1;
      else
        selection = 0;
    end
    else if(path_0_valid == 1)
      selection = 0;
    else if(path_1_valid == 1)
      selection = 1;
    
    if(valid_o == 0)
      path_cost = 0;
    else if(selection == 0)
      path_cost = path_cost_0;
    else
      path_cost = path_cost_1;
  end
  
  
endmodule
