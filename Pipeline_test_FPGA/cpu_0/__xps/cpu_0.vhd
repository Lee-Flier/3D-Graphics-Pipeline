LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY cpu_0 IS
PORT (
	fpga_0_RS232_Uart_1_RX_pin : IN STD_LOGIC;
	fpga_0_RS232_Uart_1_TX_pin : OUT STD_LOGIC;
	fpga_0_DDR2_SDRAM_DDR2_ODT_pin : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	fpga_0_DDR2_SDRAM_DDR2_Addr_pin : OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
	fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin : OUT STD_LOGIC;
	fpga_0_DDR2_SDRAM_DDR2_CE_pin : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	fpga_0_DDR2_SDRAM_DDR2_CS_n_pin : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin : OUT STD_LOGIC;
	fpga_0_DDR2_SDRAM_DDR2_WE_n_pin : OUT STD_LOGIC;
	fpga_0_DDR2_SDRAM_DDR2_Clk_pin : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	fpga_0_DDR2_SDRAM_DDR2_DM_pin : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	fpga_0_DDR2_SDRAM_DDR2_DQS : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	fpga_0_DDR2_SDRAM_DDR2_DQS_n : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	fpga_0_DDR2_SDRAM_DDR2_DQ : INOUT STD_LOGIC_VECTOR(63 DOWNTO 0);
	fpga_0_SysACE_CompactFlash_SysACE_CLK_pin : IN STD_LOGIC;
	fpga_0_SysACE_CompactFlash_SysACE_MPA_pin : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	fpga_0_SysACE_CompactFlash_SysACE_CEN_pin : OUT STD_LOGIC;
	fpga_0_SysACE_CompactFlash_SysACE_OEN_pin : OUT STD_LOGIC;
	fpga_0_SysACE_CompactFlash_SysACE_WEN_pin : OUT STD_LOGIC;
	fpga_0_SysACE_CompactFlash_SysACE_MPIRQ_pin : IN STD_LOGIC;
	sys_clk_pin : IN STD_LOGIC;
	sys_rst_pin : IN STD_LOGIC;
	register_control_0_video_enable_o_pin : OUT STD_LOGIC;
	register_control_0_background_o_pin : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
	register_control_0_gpu_enable_o_pin : OUT STD_LOGIC;
	register_control_0_eof_i_pin : IN STD_LOGIC;
	register_control_0_matrix_we_pin : OUT STD_LOGIC;
	register_control_0_matrix_sel_pin : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	register_control_0_matrix_waddr_pin : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	register_control_0_matrix_wdata_pin : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
	register_control_0_x_in_o_pin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	register_control_0_y_in_o_pin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	register_control_0_z_in_o_pin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	register_control_0_w_in_o_pin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	register_control_0_color_in_o_pin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	register_control_0_zbt_mbox_dval_pin : IN STD_LOGIC;
	register_control_0_zbt_mbox_wdone_pin : IN STD_LOGIC;
	register_control_0_zbt_mbox_rdata_pin : IN STD_LOGIC_VECTOR(35 DOWNTO 0);
	register_control_0_zbt_mbox_wdata_pin : OUT STD_LOGIC_VECTOR(35 DOWNTO 0);
	register_control_0_zbt_mbox_addr_pin : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
	register_control_0_zbt_mbox_we_pin : OUT STD_LOGIC;
	register_control_0_zbt_mbox_sel_pin : OUT STD_LOGIC;
	register_control_0_zmax_o_pin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	register_control_0_point_trig_o_pin : OUT STD_LOGIC;
	IIC_EEPROM_Scl_T_pin : OUT STD_LOGIC;
	IIC_EEPROM_Scl_O_pin : OUT STD_LOGIC;
	IIC_EEPROM_Scl_I_pin : IN STD_LOGIC;
	IIC_EEPROM_Sda_T_pin : OUT STD_LOGIC;
	IIC_EEPROM_Sda_O_pin : OUT STD_LOGIC;
	IIC_EEPROM_Sda_I_pin : IN STD_LOGIC;
	Push_Buttons_5Bit_GPIO_IO_T_pin : OUT STD_LOGIC_VECTOR(0 TO 4);
	Push_Buttons_5Bit_GPIO_IO_O_pin : OUT STD_LOGIC_VECTOR(0 TO 4);
	Push_Buttons_5Bit_GPIO_IO_I_pin : IN STD_LOGIC_VECTOR(0 TO 4);
	SysACE_CompactFlash_SysACE_MPD_T_pin : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	SysACE_CompactFlash_SysACE_MPD_O_pin : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	SysACE_CompactFlash_SysACE_MPD_I_pin : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	register_control_0_pix_valid_pin : IN STD_LOGIC;
	register_control_0_Ty_in_o_pin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	register_control_0_Tx_in_o_pin : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	register_control_0_Ver_Tex_o_pin : OUT STD_LOGIC;
	register_control_0_Clc_scr_o_pin : OUT STD_LOGIC
	);
END cpu_0;

ARCHITECTURE STRUCTURE OF cpu_0 IS

BEGIN
END ARCHITECTURE STRUCTURE;
