module cpu_0
	(
	fpga_0_RS232_Uart_1_RX_pin,
	fpga_0_RS232_Uart_1_TX_pin,
	fpga_0_Push_Buttons_5Bit_GPIO_IO_pin,
	fpga_0_IIC_EEPROM_Scl_pin,
	fpga_0_IIC_EEPROM_Sda_pin,
	fpga_0_DDR2_SDRAM_DDR2_ODT_pin,
	fpga_0_DDR2_SDRAM_DDR2_Addr_pin,
	fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin,
	fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin,
	fpga_0_DDR2_SDRAM_DDR2_CE_pin,
	fpga_0_DDR2_SDRAM_DDR2_CS_n_pin,
	fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin,
	fpga_0_DDR2_SDRAM_DDR2_WE_n_pin,
	fpga_0_DDR2_SDRAM_DDR2_Clk_pin,
	fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin,
	fpga_0_DDR2_SDRAM_DDR2_DM_pin,
	fpga_0_DDR2_SDRAM_DDR2_DQS,
	fpga_0_DDR2_SDRAM_DDR2_DQS_n,
	fpga_0_DDR2_SDRAM_DDR2_DQ,
	fpga_0_SysACE_CompactFlash_SysACE_CLK_pin,
	fpga_0_SysACE_CompactFlash_SysACE_MPA_pin,
	fpga_0_SysACE_CompactFlash_SysACE_MPD_pin,
	fpga_0_SysACE_CompactFlash_SysACE_CEN_pin,
	fpga_0_SysACE_CompactFlash_SysACE_OEN_pin,
	fpga_0_SysACE_CompactFlash_SysACE_WEN_pin,
	fpga_0_SysACE_CompactFlash_SysACE_MPIRQ_pin,
	sys_clk_pin,
	sys_rst_pin,
	register_control_0_video_enable_o_pin,
	register_control_0_background_o_pin,
	register_control_0_gpu_enable_o_pin,
	register_control_0_eof_i_pin,
	register_control_0_matrix_we_pin,
	register_control_0_matrix_sel_pin,
	register_control_0_matrix_waddr_pin,
	register_control_0_matrix_wdata_pin,
	register_control_0_x_in_o_pin,
	register_control_0_y_in_o_pin,
	register_control_0_z_in_o_pin,
	register_control_0_w_in_o_pin,
	register_control_0_color_in_o_pin,
	register_control_0_zbt_mbox_dval_pin,
	register_control_0_zbt_mbox_wdone_pin,
	register_control_0_zbt_mbox_rdata_pin,
	register_control_0_zbt_mbox_wdata_pin,
	register_control_0_zbt_mbox_addr_pin,
	register_control_0_zbt_mbox_we_pin,
	register_control_0_zbt_mbox_sel_pin,
	register_control_0_zmax_o_pin,
	register_control_0_point_trig_o_pin
	);
input  fpga_0_RS232_Uart_1_RX_pin;
output  fpga_0_RS232_Uart_1_TX_pin;
inout [0:4] fpga_0_Push_Buttons_5Bit_GPIO_IO_pin;
inout  fpga_0_IIC_EEPROM_Scl_pin;
inout  fpga_0_IIC_EEPROM_Sda_pin;
output [1:0] fpga_0_DDR2_SDRAM_DDR2_ODT_pin;
output [12:0] fpga_0_DDR2_SDRAM_DDR2_Addr_pin;
output [1:0] fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin;
output  fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin;
output [1:0] fpga_0_DDR2_SDRAM_DDR2_CE_pin;
output [1:0] fpga_0_DDR2_SDRAM_DDR2_CS_n_pin;
output  fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin;
output  fpga_0_DDR2_SDRAM_DDR2_WE_n_pin;
output [1:0] fpga_0_DDR2_SDRAM_DDR2_Clk_pin;
output [1:0] fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin;
output [7:0] fpga_0_DDR2_SDRAM_DDR2_DM_pin;
inout [7:0] fpga_0_DDR2_SDRAM_DDR2_DQS;
inout [7:0] fpga_0_DDR2_SDRAM_DDR2_DQS_n;
inout [63:0] fpga_0_DDR2_SDRAM_DDR2_DQ;
input  fpga_0_SysACE_CompactFlash_SysACE_CLK_pin;
output [6:0] fpga_0_SysACE_CompactFlash_SysACE_MPA_pin;
inout [15:0] fpga_0_SysACE_CompactFlash_SysACE_MPD_pin;
output  fpga_0_SysACE_CompactFlash_SysACE_CEN_pin;
output  fpga_0_SysACE_CompactFlash_SysACE_OEN_pin;
output  fpga_0_SysACE_CompactFlash_SysACE_WEN_pin;
input  fpga_0_SysACE_CompactFlash_SysACE_MPIRQ_pin;
input  sys_clk_pin;
input  sys_rst_pin;
output  register_control_0_video_enable_o_pin;
output [35:0] register_control_0_background_o_pin;
output  register_control_0_gpu_enable_o_pin;
input  register_control_0_eof_i_pin;
output  register_control_0_matrix_we_pin;
output [1:0] register_control_0_matrix_sel_pin;
output [3:0] register_control_0_matrix_waddr_pin;
output [127:0] register_control_0_matrix_wdata_pin;
output [31:0] register_control_0_x_in_o_pin;
output [31:0] register_control_0_y_in_o_pin;
output [31:0] register_control_0_z_in_o_pin;
output [31:0] register_control_0_w_in_o_pin;
output [17:0] register_control_0_color_in_o_pin;
input  register_control_0_zbt_mbox_dval_pin;
input  register_control_0_zbt_mbox_wdone_pin;
input [35:0] register_control_0_zbt_mbox_rdata_pin;
output [35:0] register_control_0_zbt_mbox_wdata_pin;
output [19:0] register_control_0_zbt_mbox_addr_pin;
output  register_control_0_zbt_mbox_we_pin;
output  register_control_0_zbt_mbox_sel_pin;
output [31:0] register_control_0_zmax_o_pin;
output  register_control_0_point_trig_o_pin;

endmodule
