// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sat Jun  6 15:00:08 2026
// Host        : Daksh running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               E:/VerilogProjects/Verifications/FIFO/FIFO.sim/sim_1/synth/func/xsim/tb_top_func_synth.v
// Design      : fifo
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu5eg-sfvc784-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module fifo
   (clk,
    rst,
    wr,
    rd,
    din,
    dout,
    empty,
    full);
  input clk;
  input rst;
  input wr;
  input rd;
  input [7:0]din;
  output [7:0]dout;
  output empty;
  output full;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire \cnt[0]_i_1_n_0 ;
  wire \cnt[1]_i_1_n_0 ;
  wire \cnt[2]_i_1_n_0 ;
  wire \cnt[3]_i_1_n_0 ;
  wire \cnt[4]_i_1_n_0 ;
  wire \cnt[4]_i_2_n_0 ;
  wire [4:0]cnt_reg;
  wire [7:0]din;
  wire [7:0]din_IBUF;
  wire [7:0]dout;
  wire [7:0]dout0;
  wire \dout[7]_i_2_n_0 ;
  wire [7:0]dout_OBUF;
  wire empty;
  wire empty_OBUF;
  wire full;
  wire full_OBUF;
  wire p_0_in;
  wire [3:0]p_0_in__0;
  wire rd;
  wire rd_IBUF;
  wire [3:0]rptr;
  wire \rptr[0]_i_1_n_0 ;
  wire \rptr[1]_i_1_n_0 ;
  wire \rptr[2]_i_1_n_0 ;
  wire \rptr[3]_i_1_n_0 ;
  wire [0:0]rptr__0;
  wire rst;
  wire rst_IBUF;
  wire wptr0;
  wire [3:0]wptr_reg;
  wire wr;
  wire wr_IBUF;
  wire [1:0]NLW_mem_reg_0_15_0_7_DOE_UNCONNECTED;
  wire [1:0]NLW_mem_reg_0_15_0_7_DOF_UNCONNECTED;
  wire [1:0]NLW_mem_reg_0_15_0_7_DOG_UNCONNECTED;
  wire [1:0]NLW_mem_reg_0_15_0_7_DOH_UNCONNECTED;

  (* XILINX_LEGACY_PRIM = "BUFG" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  BUFGCE #(
    .CE_TYPE("ASYNC"),
    .SIM_DEVICE("ULTRASCALE_PLUS"),
    .STARTUP_SYNC("FALSE")) 
    clk_IBUF_BUFG_inst
       (.CE(1'b1),
        .I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[0]_i_1 
       (.I0(cnt_reg[0]),
        .O(\cnt[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h55AA55AAAA55AA5D)) 
    \cnt[1]_i_1 
       (.I0(wr_IBUF),
        .I1(cnt_reg[4]),
        .I2(cnt_reg[3]),
        .I3(cnt_reg[1]),
        .I4(cnt_reg[2]),
        .I5(cnt_reg[0]),
        .O(\cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0FFFFFF0F000004F)) 
    \cnt[2]_i_1 
       (.I0(cnt_reg[3]),
        .I1(cnt_reg[4]),
        .I2(wr_IBUF),
        .I3(cnt_reg[0]),
        .I4(cnt_reg[1]),
        .I5(cnt_reg[2]),
        .O(\cnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3FFFFFFCC0000203)) 
    \cnt[3]_i_1 
       (.I0(cnt_reg[4]),
        .I1(cnt_reg[2]),
        .I2(cnt_reg[1]),
        .I3(wr_IBUF),
        .I4(cnt_reg[0]),
        .I5(cnt_reg[3]),
        .O(\cnt[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEAEC)) 
    \cnt[4]_i_1 
       (.I0(rd_IBUF),
        .I1(wr_IBUF),
        .I2(\dout[7]_i_2_n_0 ),
        .I3(cnt_reg[4]),
        .O(\cnt[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAA8AAAAAAA9)) 
    \cnt[4]_i_2 
       (.I0(cnt_reg[4]),
        .I1(cnt_reg[3]),
        .I2(cnt_reg[1]),
        .I3(cnt_reg[2]),
        .I4(cnt_reg[0]),
        .I5(wr_IBUF),
        .O(\cnt[4]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\cnt[4]_i_1_n_0 ),
        .D(\cnt[0]_i_1_n_0 ),
        .Q(cnt_reg[0]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\cnt[4]_i_1_n_0 ),
        .D(\cnt[1]_i_1_n_0 ),
        .Q(cnt_reg[1]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\cnt[4]_i_1_n_0 ),
        .D(\cnt[2]_i_1_n_0 ),
        .Q(cnt_reg[2]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\cnt[4]_i_1_n_0 ),
        .D(\cnt[3]_i_1_n_0 ),
        .Q(cnt_reg[3]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\cnt[4]_i_1_n_0 ),
        .D(\cnt[4]_i_2_n_0 ),
        .Q(cnt_reg[4]),
        .R(rst_IBUF));
  IBUF \din_IBUF[0]_inst 
       (.I(din[0]),
        .O(din_IBUF[0]));
  IBUF \din_IBUF[1]_inst 
       (.I(din[1]),
        .O(din_IBUF[1]));
  IBUF \din_IBUF[2]_inst 
       (.I(din[2]),
        .O(din_IBUF[2]));
  IBUF \din_IBUF[3]_inst 
       (.I(din[3]),
        .O(din_IBUF[3]));
  IBUF \din_IBUF[4]_inst 
       (.I(din[4]),
        .O(din_IBUF[4]));
  IBUF \din_IBUF[5]_inst 
       (.I(din[5]),
        .O(din_IBUF[5]));
  IBUF \din_IBUF[6]_inst 
       (.I(din[6]),
        .O(din_IBUF[6]));
  IBUF \din_IBUF[7]_inst 
       (.I(din[7]),
        .O(din_IBUF[7]));
  LUT4 #(
    .INIT(16'h20E0)) 
    \dout[7]_i_1 
       (.I0(cnt_reg[4]),
        .I1(\dout[7]_i_2_n_0 ),
        .I2(rd_IBUF),
        .I3(wr_IBUF),
        .O(rptr__0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \dout[7]_i_2 
       (.I0(cnt_reg[3]),
        .I1(cnt_reg[1]),
        .I2(cnt_reg[2]),
        .I3(cnt_reg[0]),
        .O(\dout[7]_i_2_n_0 ));
  OBUF \dout_OBUF[0]_inst 
       (.I(dout_OBUF[0]),
        .O(dout[0]));
  OBUF \dout_OBUF[1]_inst 
       (.I(dout_OBUF[1]),
        .O(dout[1]));
  OBUF \dout_OBUF[2]_inst 
       (.I(dout_OBUF[2]),
        .O(dout[2]));
  OBUF \dout_OBUF[3]_inst 
       (.I(dout_OBUF[3]),
        .O(dout[3]));
  OBUF \dout_OBUF[4]_inst 
       (.I(dout_OBUF[4]),
        .O(dout[4]));
  OBUF \dout_OBUF[5]_inst 
       (.I(dout_OBUF[5]),
        .O(dout[5]));
  OBUF \dout_OBUF[6]_inst 
       (.I(dout_OBUF[6]),
        .O(dout[6]));
  OBUF \dout_OBUF[7]_inst 
       (.I(dout_OBUF[7]),
        .O(dout[7]));
  FDRE #(
    .INIT(1'b0)) 
    \dout_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(rptr__0),
        .D(dout0[0]),
        .Q(dout_OBUF[0]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \dout_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(rptr__0),
        .D(dout0[1]),
        .Q(dout_OBUF[1]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \dout_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(rptr__0),
        .D(dout0[2]),
        .Q(dout_OBUF[2]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \dout_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(rptr__0),
        .D(dout0[3]),
        .Q(dout_OBUF[3]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \dout_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(rptr__0),
        .D(dout0[4]),
        .Q(dout_OBUF[4]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \dout_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(rptr__0),
        .D(dout0[5]),
        .Q(dout_OBUF[5]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \dout_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(rptr__0),
        .D(dout0[6]),
        .Q(dout_OBUF[6]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \dout_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(rptr__0),
        .D(dout0[7]),
        .Q(dout_OBUF[7]),
        .R(rst_IBUF));
  OBUF empty_OBUF_inst
       (.I(empty_OBUF),
        .O(empty));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    empty_OBUF_inst_i_1
       (.I0(cnt_reg[4]),
        .I1(cnt_reg[3]),
        .I2(cnt_reg[1]),
        .I3(cnt_reg[2]),
        .I4(cnt_reg[0]),
        .O(empty_OBUF));
  OBUF full_OBUF_inst
       (.I(full_OBUF),
        .O(full));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00000002)) 
    full_OBUF_inst_i_1
       (.I0(cnt_reg[4]),
        .I1(cnt_reg[3]),
        .I2(cnt_reg[1]),
        .I3(cnt_reg[2]),
        .I4(cnt_reg[0]),
        .O(full_OBUF));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "128" *) 
  (* RTL_RAM_NAME = "fifo/mem_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "7" *) 
  RAM32M16 #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000),
    .INIT_E(64'h0000000000000000),
    .INIT_F(64'h0000000000000000),
    .INIT_G(64'h0000000000000000),
    .INIT_H(64'h0000000000000000)) 
    mem_reg_0_15_0_7
       (.ADDRA({1'b0,rptr}),
        .ADDRB({1'b0,rptr}),
        .ADDRC({1'b0,rptr}),
        .ADDRD({1'b0,rptr}),
        .ADDRE({1'b0,rptr}),
        .ADDRF({1'b0,rptr}),
        .ADDRG({1'b0,rptr}),
        .ADDRH({1'b0,wptr_reg}),
        .DIA(din_IBUF[1:0]),
        .DIB(din_IBUF[3:2]),
        .DIC(din_IBUF[5:4]),
        .DID(din_IBUF[7:6]),
        .DIE({1'b0,1'b0}),
        .DIF({1'b0,1'b0}),
        .DIG({1'b0,1'b0}),
        .DIH({1'b0,1'b0}),
        .DOA(dout0[1:0]),
        .DOB(dout0[3:2]),
        .DOC(dout0[5:4]),
        .DOD(dout0[7:6]),
        .DOE(NLW_mem_reg_0_15_0_7_DOE_UNCONNECTED[1:0]),
        .DOF(NLW_mem_reg_0_15_0_7_DOF_UNCONNECTED[1:0]),
        .DOG(NLW_mem_reg_0_15_0_7_DOG_UNCONNECTED[1:0]),
        .DOH(NLW_mem_reg_0_15_0_7_DOH_UNCONNECTED[1:0]),
        .WCLK(clk_IBUF_BUFG),
        .WE(p_0_in));
  LUT2 #(
    .INIT(4'h2)) 
    mem_reg_0_15_0_7_i_1
       (.I0(wptr0),
        .I1(rst_IBUF),
        .O(p_0_in));
  IBUF rd_IBUF_inst
       (.I(rd),
        .O(rd_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \rptr[0]_i_1 
       (.I0(rptr[0]),
        .O(\rptr[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rptr[1]_i_1 
       (.I0(rptr[0]),
        .I1(rptr[1]),
        .O(\rptr[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \rptr[2]_i_1 
       (.I0(rptr[1]),
        .I1(rptr[0]),
        .I2(rptr[2]),
        .O(\rptr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \rptr[3]_i_1 
       (.I0(rptr[2]),
        .I1(rptr[0]),
        .I2(rptr[1]),
        .I3(rptr[3]),
        .O(\rptr[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rptr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(rptr__0),
        .D(\rptr[0]_i_1_n_0 ),
        .Q(rptr[0]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \rptr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(rptr__0),
        .D(\rptr[1]_i_1_n_0 ),
        .Q(rptr[1]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \rptr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(rptr__0),
        .D(\rptr[2]_i_1_n_0 ),
        .Q(rptr[2]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \rptr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(rptr__0),
        .D(\rptr[3]_i_1_n_0 ),
        .Q(rptr[3]),
        .R(rst_IBUF));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \wptr[0]_i_1 
       (.I0(wptr_reg[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wptr[1]_i_1 
       (.I0(wptr_reg[0]),
        .I1(wptr_reg[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \wptr[2]_i_1 
       (.I0(wptr_reg[1]),
        .I1(wptr_reg[0]),
        .I2(wptr_reg[2]),
        .O(p_0_in__0[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFD00000000)) 
    \wptr[3]_i_1 
       (.I0(cnt_reg[4]),
        .I1(cnt_reg[3]),
        .I2(cnt_reg[1]),
        .I3(cnt_reg[2]),
        .I4(cnt_reg[0]),
        .I5(wr_IBUF),
        .O(wptr0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \wptr[3]_i_2 
       (.I0(wptr_reg[2]),
        .I1(wptr_reg[0]),
        .I2(wptr_reg[1]),
        .I3(wptr_reg[3]),
        .O(p_0_in__0[3]));
  FDRE #(
    .INIT(1'b0)) 
    \wptr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(wptr0),
        .D(p_0_in__0[0]),
        .Q(wptr_reg[0]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \wptr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(wptr0),
        .D(p_0_in__0[1]),
        .Q(wptr_reg[1]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \wptr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(wptr0),
        .D(p_0_in__0[2]),
        .Q(wptr_reg[2]),
        .R(rst_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \wptr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(wptr0),
        .D(p_0_in__0[3]),
        .Q(wptr_reg[3]),
        .R(rst_IBUF));
  IBUF wr_IBUF_inst
       (.I(wr),
        .O(wr_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
