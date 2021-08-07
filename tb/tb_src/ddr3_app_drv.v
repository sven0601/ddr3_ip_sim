`timescale 1ns / 1ps

module ddr3_app_drv(
    input                   ui_clk,
    input                   ui_rst,
    output  wire    [27:0]  app_addr,
    output  reg     [ 2:0]  app_cmd,
    output  reg             app_en,
    input                   app_rdy,
    output  reg     [255:0] app_wdf_data,
    output  wire    [31:0]  app_wdf_mask,
    input                   app_wdf_rdy,
    output  reg             app_wdf_wren,
    output  wire            app_wdf_end,
    input           [255:0] app_rd_data,
    input                   app_rd_data_valid,
    //Debug
    input                   test_start,
    output  reg             test_busy,
    output  reg     [63:0]  error_num,
    output  reg             error_done
);

parameter   BL_NUM_END      =   1048576;
//parameter   BL_NUM_END      =   100;
parameter   BL_LENGTH       =   16;
parameter   CMD_WR          =   3'b000;
parameter   CMD_RD          =   3'b001;

reg                 [20:0]  bl_cnt;
reg                 [ 6:0]  cmd_cnt;
reg                 [27:0]  wr_addr;
reg                         app_en_r;
reg                 [ 6:0]  wr_cnt;
reg                 [ 6:0]  rd_cnt;
reg                 [27:0]  rd_addr;
reg                 [255:0] check_data;

assign 	app_wdf_mask    =   32'd0;
assign  app_wdf_end     =   app_wdf_wren;
assign  app_addr        =   app_cmd == CMD_RD ? rd_addr : wr_addr;

always @(posedge ui_clk or negedge ui_rst) begin
    if(ui_rst == 1'b1)
        test_busy   <=  1'b0;
    else if(test_start == 1'b1)
        test_busy   <=  1'b1;
    else if(bl_cnt == (BL_NUM_END-1'b1) && rd_cnt == BL_LENGTH)
        test_busy   <=  1'b0;
end

always @(posedge ui_clk or negedge ui_rst) begin
    if(ui_rst == 1'b1)
        app_en  <=  1'b0;
    else if(test_busy == 1'b0 && test_start == 1'b1)
        app_en  <=  1'b1;
    else if(cmd_cnt == BL_LENGTH && wr_cnt == BL_LENGTH)
        app_en  <=  1'b1;
    else if(bl_cnt < (BL_NUM_END-1'b1) && rd_cnt == BL_LENGTH)
        app_en  <=  1'b1;
    else if(cmd_cnt == (BL_LENGTH-1) && app_rdy == 1'b1)
        app_en  <=  1'b0;
end

always @(posedge ui_clk or negedge ui_rst) begin
    if(ui_rst == 1'b1)
        app_cmd <=  CMD_WR;
    else if(test_busy == 1'b0 && test_start == 1'b1)
        app_cmd <=  CMD_WR;
    else if(cmd_cnt == BL_LENGTH && wr_cnt == BL_LENGTH)
        app_cmd <=  CMD_RD;
    else if(rd_cnt == BL_LENGTH)
        app_cmd <=  CMD_WR;
end

always @(posedge ui_clk or negedge ui_rst) begin
    if(ui_rst == 1'b1)
        cmd_cnt <=  7'd0;
    else if(cmd_cnt == BL_LENGTH && wr_cnt == BL_LENGTH)
        cmd_cnt <=  7'd0;
    else if(cmd_cnt == BL_LENGTH && rd_cnt == BL_LENGTH)
        cmd_cnt <=  7'd0;
    else if(app_en == 1'b1 && app_rdy == 1'b1)
        cmd_cnt <=  cmd_cnt + 1'b1;
end

always @(posedge ui_clk or negedge ui_rst) begin
    if(ui_rst == 1'b1)
        wr_addr <=  28'd0;
    else if(test_start == 1'b1 && test_busy == 1'b0)
        wr_addr <=  28'd0;
    else if(app_en == 1'b1 && app_rdy == 1'b1 && app_cmd == CMD_WR)
        wr_addr <=  wr_addr + 8;
end

always @(posedge ui_clk) begin
    app_en_r    <=  app_en;
end

always @(posedge ui_clk or negedge ui_rst) begin
    if(ui_rst == 1'b1)
        app_wdf_wren    <=  1'b0;
    else if(wr_cnt == BL_LENGTH-1 && app_wdf_rdy == 1'b1)
        app_wdf_wren    <=  1'b0;
    else if(app_cmd == CMD_WR && app_en_r == 1'b1 && wr_cnt < BL_LENGTH)
        app_wdf_wren    <=  1'b1;
end

always @(posedge ui_clk or negedge ui_rst) begin
    if(ui_rst == 1'b1)
        app_wdf_data    <=  256'd0;
    else if(app_wdf_wren == 1'b1 && app_wdf_rdy == 1'b1)
        app_wdf_data    <=  app_wdf_data + 1'b1;
end

always @(posedge ui_clk or negedge ui_rst) begin
    if(ui_rst == 1'b1)
        wr_cnt  <=  7'd0;
    else if(wr_cnt == BL_LENGTH && cmd_cnt == BL_LENGTH)
        wr_cnt  <=  7'd0;
    else if(app_wdf_wren == 1'b1 && app_wdf_rdy == 1'b1)
        wr_cnt  <=  wr_cnt + 1'b1;
end

always @(posedge ui_clk or negedge ui_rst) begin
    if(ui_rst == 1'b1)
        rd_cnt  <=  7'd0;
    else if(rd_cnt == BL_LENGTH)
        rd_cnt  <=  7'd0;
    else if(app_rd_data_valid == 1'b1)
        rd_cnt  <=  rd_cnt + 1'b1;
end

always @(posedge ui_clk or negedge ui_rst) begin
    if(ui_rst == 1'b1)
        rd_addr <=  28'd0;
    else if(test_start == 1'b1 && test_busy == 1'b0)
        rd_addr <=  28'd0;
    else if(app_en == 1'b1 && app_rdy == 1'b1 && app_cmd == CMD_RD)
        rd_addr <=  rd_addr + 8;
end

always @(posedge ui_clk or negedge ui_rst) begin
    if(ui_rst == 1'b1)
        bl_cnt  <=  21'd0;
    else if(bl_cnt == BL_NUM_END-1 && rd_cnt == BL_LENGTH)
        bl_cnt  <=  21'd0;
    else if(rd_cnt == BL_LENGTH)
        bl_cnt  <=  bl_cnt + 1'b1;
end

always @(posedge ui_clk or negedge ui_rst) begin
    if(ui_rst == 1'b1)
        check_data  <=  256'd0;
    else if(app_rd_data_valid == 1'b1)
        check_data  <=  check_data + 1'b1;
end

always @(posedge ui_clk or negedge ui_rst) begin
    if(ui_rst == 1'b1)
        error_num   <=  64'd0;
    else if(test_start == 1'b1)
        error_num   <=  64'd0;
    else if(app_rd_data_valid == 1'b1 && check_data != app_rd_data)
        error_num   <=  error_num + 1'b1;
end

always @(posedge ui_clk or negedge ui_rst) begin
    if(ui_rst == 1'b1)
        error_done  <=  1'b0;
    else if(bl_cnt == BL_NUM_END-1 && rd_cnt == BL_LENGTH)
        error_done  <=  1'b1;
    else
        error_done  <=  1'b0;
end

endmodule

