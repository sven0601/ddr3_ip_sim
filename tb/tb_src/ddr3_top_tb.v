
`timescale 1ps/100fs

module ddr3_top_tb;

    parameter CLKIN_PERIOD  = 5000;
    localparam RESET_PERIOD = 200000; //in pSec
    //rst
    reg             sys_rst_n;
    wire            sys_rst;
    //clk
    reg             sys_clk_i;
    wire            sys_clk_p;
    wire            sys_clk_n;
    //DDR3 if
    wire            ddr3_reset_n;
    wire    [31:0]  ddr3_dq;
    wire    [3:0]   ddr3_dqs_p;
    wire    [3:0]   ddr3_dqs_n;
    wire    [13:0]  ddr3_addr;
    wire    [2:0]   ddr3_ba;
    wire            ddr3_ras_n;
    wire            ddr3_cas_n;
    wire            ddr3_we_n;
    wire            ddr3_cke;
    wire            ddr3_ck_p;
    wire            ddr3_ck_n;
    wire            init_calib_complete;
    wire            tg_compare_error;
    wire            ddr3_cs_n;
    wire    [3:0]   ddr3_dm;
    wire            ddr3_odt;
    //Drv
    wire            ui_clk;
    wire            ui_clk_sync_rst;
    wire    [27:0]  app_addr;
    wire    [ 2:0]  app_cmd;
    wire            app_en;
    wire    [255:0] app_wdf_data;
    wire            app_wdf_end;
    wire            app_wdf_wren;
    wire    [255:0] app_rd_data;
    wire            app_rd_data_end;
    wire            app_rd_data_valid;
    wire            app_rdy;
    wire            app_wdf_rdy;
    wire    [31:0]  app_wdf_mask;

//**************************************************************************//
// Reset Generation
//**************************************************************************//
    initial begin
        sys_rst_n = 1'b0;
        #RESET_PERIOD
        sys_rst_n = 1'b1;
    end

   assign sys_rst = ~sys_rst_n;

   reg  test_start;

    initial begin
        test_start  <=  1'b0;
        @(posedge init_calib_complete)
        #(100*CLKIN_PERIOD);
        test_start  <=  1'b1;
        // #(10)
        // test_start  <=  1'b0;
        // #(100000)
        // test_start  <=  1'b1;
        // #(10)
        // test_start  <=  1'b0;
    end

//**************************************************************************//
// Clock Generation
//**************************************************************************//
    initial
        sys_clk_i = 1'b0;
    always
        sys_clk_i = #(CLKIN_PERIOD/2.0) ~sys_clk_i;

    assign sys_clk_p = sys_clk_i;
    assign sys_clk_n = ~sys_clk_i;

//===========================================================================
//                         FPGA Memory Controller
//===========================================================================

    ddr3 u_ddr3 (
        // Memory interface ports
       .ddr3_addr                      (ddr3_addr),
       .ddr3_ba                        (ddr3_ba),
       .ddr3_cas_n                     (ddr3_cas_n),
       .ddr3_ck_n                      (ddr3_ck_n),
       .ddr3_ck_p                      (ddr3_ck_p),
       .ddr3_cke                       (ddr3_cke),
       .ddr3_ras_n                     (ddr3_ras_n),
       .ddr3_we_n                      (ddr3_we_n),
       .ddr3_dq                        (ddr3_dq),
       .ddr3_dqs_n                     (ddr3_dqs_n),
       .ddr3_dqs_p                     (ddr3_dqs_p),
       .ddr3_reset_n                   (ddr3_reset_n),
       .init_calib_complete            (init_calib_complete),
       .ddr3_cs_n                      (ddr3_cs_n),
       .ddr3_dm                        (ddr3_dm),
       .ddr3_odt                       (ddr3_odt),
        // Application interface ports
       .app_addr                       (app_addr),
       .app_cmd                        (app_cmd),
       .app_en                         (app_en),
       .app_wdf_data                   (app_wdf_data),
       .app_wdf_end                    (app_wdf_end),
       .app_wdf_wren                   (app_wdf_wren),
       .app_rd_data                    (app_rd_data),
       .app_rd_data_end                (app_rd_data_end),
       .app_rd_data_valid              (app_rd_data_valid),
       .app_rdy                        (app_rdy),
       .app_wdf_rdy                    (app_wdf_rdy),
       .app_sr_req                     (1'b0),
       .app_ref_req                    (1'b0),
       .app_zq_req                     (1'b0),
       .app_sr_active                  (    ),
       .app_zq_ack                     (    ),
       .ui_clk                         (ui_clk),
       .ui_clk_sync_rst                (ui_clk_sync_rst),
       .app_wdf_mask                   (app_wdf_mask),
        // System Clock Ports
       .sys_clk_p                      (sys_clk_p),
       .sys_clk_n                      (sys_clk_n),
       .device_temp_i                  (device_temp_i),
       .device_temp                    (device_temp),
       .sys_rst                        (sys_rst)
       );

//===========================================================================
//                         FPGA Memory drive
//===========================================================================
    ddr3_app_drv u_ddr3_app_drv(
        .ui_clk            ( ui_clk             ),
        .ui_rst            ( ui_clk_sync_rst    ),
        .app_addr          ( app_addr           ),
        .app_cmd           ( app_cmd            ),
        .app_en            ( app_en             ),
        .app_rdy           ( app_rdy            ),
        .app_wdf_data      ( app_wdf_data       ),
        .app_wdf_mask      ( app_wdf_mask       ),
        .app_wdf_rdy       ( app_wdf_rdy        ),
        .app_wdf_wren      ( app_wdf_wren       ),
        .app_wdf_end       ( app_wdf_end        ),
        .app_rd_data       ( app_rd_data        ),
        .app_rd_data_valid ( app_rd_data_valid  ),
        .test_start        ( test_start         ),
        .test_busy         (    ),
        .error_num         (    ),
        .error_done        (    )
    );

//**************************************************************************//
// Memory Models instantiations
//**************************************************************************//
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin: gen_mem
          ddr3_model u_comp_ddr3 (
                .rst_n   (ddr3_reset_n),
                .ck      (ddr3_ck_p),
                .ck_n    (ddr3_ck_n),
                .cke     (ddr3_cke),
                .cs_n    (ddr3_cs_n),
                .ras_n   (ddr3_ras_n),
                .cas_n   (ddr3_cas_n),
                .we_n    (ddr3_we_n),
                .dm_tdqs (ddr3_dm[i]),
                .ba      (ddr3_ba),
                .addr    (ddr3_addr),
                .dq      (ddr3_dq[8*(i+1)-1:8*(i)]),
                .dqs     (ddr3_dqs_p[i]),
                .dqs_n   (ddr3_dqs_n[i]),
                .tdqs_n  (),
                .odt     (ddr3_odt)
            );
        end
    endgenerate

endmodule