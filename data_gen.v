module data_gen_source (
  data_out, 
  clk_in
);

output reg [31 : 0] data_out;
input wire clk_in;

always @ (posedge  clk_in) begin
    data_out <= 32'd3;
end
    
endmodule
