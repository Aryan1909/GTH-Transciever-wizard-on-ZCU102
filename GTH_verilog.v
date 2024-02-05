`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.01.2024 19:56:16
// Design Name: 
// Module Name: delay_with_gth
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module delay_with_gth(
input gthrxn_in1,
    input gthrxp_in1,
    
    output gthtxn_out1,
    output gthtxp_out1,
    input gthrxn_in2,
    input gthrxp_in2,
    
    output gthtxn_out2,
    output gthtxp_out2,
    input mgtrefclk0_x0y1_p,
    input mgtrefclk0_x0y1_n,
    input mgtrefclk1_x0y1_p,
    input mgtrefclk1_x0y1_n,
    input clk_in1_p,
    input clk_in1_n
    
    
   /* input gtwiz_userclk_tx_active_in,
    input gtwiz_userclk_rx_active_in,
    input gtwiz_reset_all_in,
    input gtwiz_reset_tx_pll_and_datapath_in,
    input gtwiz_reset_tx_datapath_in,
    input gtwiz_reset_rx_pll_and_datapath_in,
    input gtwiz_reset_rx_datapath_in,
    output gtwiz_reset_rx_cdr_stable_out,
    output gtwiz_reset_tx_done_out,
    output gtwiz_reset_rx_done_out,
    output gtwiz_userdata_rx_out,
    input gtrefclk00_in,
    output qpll0outclk_out,
    output qpll0outrefclk_out,
    input gthrxn_in,
    input gthrxp_in,
    input rxusrclk_in,
    input rxusrclk2_in,
    input txusrclk_in,
    input txusrclk2_in,
    output gthtxn_out,
    output gthtxp_out,
    output gtpowergood_out,
    output rxoutclk_out,
    output rxpmaresetdone_out,
    output txoutclk_out,
    input clk,
    output txpmaresetdone_out,
    output clk_out1,

    output [31:0] tx_data,
    input mgtrefclk0_x0y1_p,
    input mgtrefclk0_x0y1_n,
    output gtwiz_clk_int*/
);



        
  wire mgtrefclk0_x0y1_int;
  wire mgtrefclk1_x0y1_int;
  wire [31:0]data_out1,data_out2;
  wire clk_out;
  wire gtwiz_userclk_tx_usrclk2_out;
 // assign txoutclk_out = txoutclk_out1;
//  wire [31:0] gtwiz_userdata_tx_int;
 // assign gtwiz_userdata_tx_int[31:0] = tx_data_out;
   
 // assign cm0_gtrefclk00_int = mgtrefclk0_x0y1_int;
 // assign gtrefclk00_int[0:0] = cm0_gtrefclk00_int;
  
 // wire [0:0] gtwiz_clk_int;
  //reg [0:0] hb0_gtwiz_clk_in;
  //reg [0:0] hb0_gtwiz_clk_in;
  //assign gtwiz_clk_int[0:0] = hb0_gtwiz_clk_in;
/*
  wire [31:0] gtwiz_userdata_tx_int;
  wire [31:0] hb0_gtwiz_userdata_tx_int;
  assign gtwiz_userdata_tx_int[31:0] = hb0_gtwiz_userdata_tx_int;*/
 


gtwizard_ultrascale_0 gth (
  .gtwiz_userclk_tx_reset_in({1{1'b0}}),                    // input wire [0 : 0] gtwiz_userclk_tx_reset_in
  .gtwiz_userclk_tx_srcclk_out(),                // output wire [0 : 0] gtwiz_userclk_tx_srcclk_out
  .gtwiz_userclk_tx_usrclk_out(),                // output wire [0 : 0] gtwiz_userclk_tx_usrclk_out
  .gtwiz_userclk_tx_usrclk2_out(gtwiz_userclk_tx_usrclk2_out),              // output wire [0 : 0] gtwiz_userclk_tx_usrclk2_out
  .gtwiz_userclk_tx_active_out(),                // output wire [0 : 0] gtwiz_userclk_tx_active_out
  .gtwiz_userclk_rx_reset_in({1{1'b0}}),                    // input wire [0 : 0] gtwiz_userclk_rx_reset_in
  .gtwiz_userclk_rx_srcclk_out(),                // output wire [0 : 0] gtwiz_userclk_rx_srcclk_out
  .gtwiz_userclk_rx_usrclk_out(),                // output wire [0 : 0] gtwiz_userclk_rx_usrclk_out
  .gtwiz_userclk_rx_usrclk2_out(),              // output wire [0 : 0] gtwiz_userclk_rx_usrclk2_out
  .gtwiz_userclk_rx_active_out(),                // output wire [0 : 0] gtwiz_userclk_rx_active_out
  .gtwiz_reset_clk_freerun_in(clk_out),                  // input wire [0 : 0] gtwiz_reset_clk_freerun_in
  .gtwiz_reset_all_in({1{1'b0}}),                                  // input wire [0 : 0] gtwiz_reset_all_in
  .gtwiz_reset_tx_pll_and_datapath_in({1{1'b0}}),  // input wire [0 : 0] gtwiz_reset_tx_pll_and_datapath_in
  .gtwiz_reset_tx_datapath_in({1{1'b0}}),                  // input wire [0 : 0] gtwiz_reset_tx_datapath_in
  .gtwiz_reset_rx_pll_and_datapath_in({1{1'b0}}),  // input wire [0 : 0] gtwiz_reset_rx_pll_and_datapath_in
  .gtwiz_reset_rx_datapath_in({1{1'b0}}),                  // input wire [0 : 0] gtwiz_reset_rx_datapath_in
  .gtwiz_reset_rx_cdr_stable_out(),            // output wire [0 : 0] gtwiz_reset_rx_cdr_stable_out
  .gtwiz_reset_tx_done_out(),                        // output wire [0 : 0] gtwiz_reset_tx_done_out
  .gtwiz_reset_rx_done_out(),                        // output wire [0 : 0] gtwiz_reset_rx_done_out
  .gtwiz_userdata_tx_in(data_out1),                              // input wire [31 : 0] gtwiz_userdata_tx_in
  .gtwiz_userdata_rx_out(),                            // output wire [31 : 0] gtwiz_userdata_rx_out
//  .gtrefclk01_in(mgtrefclk0_x0y1_int),                                            // input wire [0 : 0] gtrefclk00_in
  .gtrefclk01_in(mgtrefclk1_x0y1_int),                                            // input wire [0 : 0] gtrefclk00_in
  .qpll1outclk_out(),                                        // output wire [0 : 0] qpll0outclk_out
  .qpll1outrefclk_out(),                                  // output wire [0 : 0] qpll0outrefclk_out
  .gthrxn_in(gthrxn_in1),                                                    // input wire [0 : 0] gthrxn_in
  .gthrxp_in(gthrxp_in1),                                                    // input wire [0 : 0] gthrxp_in
  .gthtxn_out(gthtxn_out1),                                                  // output wire [0 : 0] gthtxn_out
  .gthtxp_out(gthtxp_out1),                                                  // output wire [0 : 0] gthtxp_out
  .gtpowergood_out(),                                        // output wire [0 : 0] gtpowergood_out
  .rxpmaresetdone_out(),                                  // output wire [0 : 0] rxpmaresetdone_out
  .txpmaresetdone_out()                                  // output wire [0 : 0] txpmaresetdone_out
);

gtwizard_ultrascale_1 gth_op (
  .gtwiz_userclk_tx_reset_in({1{1'b0}}),                    // input wire [0 : 0] gtwiz_userclk_tx_reset_in
  .gtwiz_userclk_tx_srcclk_out(),                // output wire [0 : 0] gtwiz_userclk_tx_srcclk_out
  .gtwiz_userclk_tx_usrclk_out(),                // output wire [0 : 0] gtwiz_userclk_tx_usrclk_out
  .gtwiz_userclk_tx_usrclk2_out(gtwiz_userclk_tx_usrclk2_out2),              // output wire [0 : 0] gtwiz_userclk_tx_usrclk2_out
  .gtwiz_userclk_tx_active_out(),                // output wire [0 : 0] gtwiz_userclk_tx_active_out
  .gtwiz_userclk_rx_reset_in({1{1'b0}}),                    // input wire [0 : 0] gtwiz_userclk_rx_reset_in
  .gtwiz_userclk_rx_srcclk_out(),                // output wire [0 : 0] gtwiz_userclk_rx_srcclk_out
  .gtwiz_userclk_rx_usrclk_out(),                // output wire [0 : 0] gtwiz_userclk_rx_usrclk_out
  .gtwiz_userclk_rx_usrclk2_out(),              // output wire [0 : 0] gtwiz_userclk_rx_usrclk2_out
  .gtwiz_userclk_rx_active_out(),                // output wire [0 : 0] gtwiz_userclk_rx_active_out
  .gtwiz_reset_clk_freerun_in(clk_out),                  // input wire [0 : 0] gtwiz_reset_clk_freerun_in
  .gtwiz_reset_all_in({1{1'b0}}),                                  // input wire [0 : 0] gtwiz_reset_all_in
  .gtwiz_reset_tx_pll_and_datapath_in({1{1'b0}}),  // input wire [0 : 0] gtwiz_reset_tx_pll_and_datapath_in
  .gtwiz_reset_tx_datapath_in({1{1'b0}}),                  // input wire [0 : 0] gtwiz_reset_tx_datapath_in
  .gtwiz_reset_rx_pll_and_datapath_in({1{1'b0}}),  // input wire [0 : 0] gtwiz_reset_rx_pll_and_datapath_in
  .gtwiz_reset_rx_datapath_in({1{1'b0}}),                  // input wire [0 : 0] gtwiz_reset_rx_datapath_in
  .gtwiz_reset_rx_cdr_stable_out(),            // output wire [0 : 0] gtwiz_reset_rx_cdr_stable_out
  .gtwiz_reset_tx_done_out(),                        // output wire [0 : 0] gtwiz_reset_tx_done_out
  .gtwiz_reset_rx_done_out(),                        // output wire [0 : 0] gtwiz_reset_rx_done_out
  .gtwiz_userdata_tx_in(data_out2),                              // input wire [31 : 0] gtwiz_userdata_tx_in
  .gtwiz_userdata_rx_out(),                            // output wire [31 : 0] gtwiz_userdata_rx_out
  .gtrefclk00_in(mgtrefclk0_x0y1_int),                                            // input wire [0 : 0] gtrefclk00_in
  .qpll0outclk_out(),                                        // output wire [0 : 0] qpll0outclk_out
  .qpll0outrefclk_out(),                                  // output wire [0 : 0] qpll0outrefclk_out
  .gthrxn_in(gthrxn_in2),                                                    // input wire [0 : 0] gthrxn_in
  .gthrxp_in(gthrxp_in2),                                                    // input wire [0 : 0] gthrxp_in
  .gthtxn_out(gthtxn_out2),                                                  // output wire [0 : 0] gthtxn_out
  .gthtxp_out(gthtxp_out2),                                                  // output wire [0 : 0] gthtxp_out
  .gtpowergood_out(),                                        // output wire [0 : 0] gtpowergood_out
  .rxpmaresetdone_out(),                                  // output wire [0 : 0] rxpmaresetdone_out
  .txpmaresetdone_out()                                  // output wire [0 : 0] txpmaresetdone_out
);




  clk_wiz_0 clk_wizard
   (
    // Clock out ports
    .clk_out1(clk_out),     // output clk_out1
   // Clock in ports
    .clk_in1_p(clk_in1_p),    // input clk_in1_p
    .clk_in1_n(clk_in1_n));    // input clk_in1_n

  data_gen_0 data_gen
   (
    // Clock out ports
    .data_out(data_out1),     // output clk_out1
   // Clock in ports
    .clk_in(gtwiz_userclk_tx_usrclk2_out));    // input clk_in1_n

data_gen_source2 data_gen2
   (
    // Clock out ports
    .data_out(data_out2),     // output clk_out1
   // Clock in ports
    .clk_in(gtwiz_userclk_tx_usrclk2_out2));    // input clk_in1_n



  IBUFDS_GTE4 #(
    .REFCLK_EN_TX_PATH  (1'b0),
    .REFCLK_HROW_CK_SEL (2'b00),
    .REFCLK_ICNTL_RX    (2'b00)
    )

IBUFDS_GTE4_MGTREFCLK1_X0Y1_INST (
    .I     (mgtrefclk1_x0y1_p),
    .IB    (mgtrefclk1_x0y1_n),
    .CEB   (1'b0),
    .O     (mgtrefclk1_x0y1_int),
    .ODIV2 ()
  );
  
  
  IBUFDS_GTE4 #(
    .REFCLK_EN_TX_PATH  (1'b0),
    .REFCLK_HROW_CK_SEL (2'b00),
    .REFCLK_ICNTL_RX    (2'b00)
  ) IBUFDS_GTE4_MGTREFCLK0_X0Y1_INST (
    .I     (mgtrefclk0_x0y1_p),
    .IB    (mgtrefclk0_x0y1_n),
    .CEB   (1'b0),
    .O     (mgtrefclk0_x0y1_int),
    .ODIV2 ()
  );
endmodule
