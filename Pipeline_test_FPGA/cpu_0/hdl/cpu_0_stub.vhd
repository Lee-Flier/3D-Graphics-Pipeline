-------------------------------------------------------------------------------
-- cpu_0_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity cpu_0_stub is
  port (
    fpga_0_RS232_Uart_1_RX_pin : in std_logic;
    fpga_0_RS232_Uart_1_TX_pin : out std_logic;
    fpga_0_DDR2_SDRAM_DDR2_ODT_pin : out std_logic_vector(1 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_Addr_pin : out std_logic_vector(12 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin : out std_logic_vector(1 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin : out std_logic;
    fpga_0_DDR2_SDRAM_DDR2_CE_pin : out std_logic_vector(1 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_CS_n_pin : out std_logic_vector(1 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin : out std_logic;
    fpga_0_DDR2_SDRAM_DDR2_WE_n_pin : out std_logic;
    fpga_0_DDR2_SDRAM_DDR2_Clk_pin : out std_logic_vector(1 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin : out std_logic_vector(1 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_DM_pin : out std_logic_vector(7 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_DQS : inout std_logic_vector(7 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_DQS_n : inout std_logic_vector(7 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_DQ : inout std_logic_vector(63 downto 0);
    fpga_0_SysACE_CompactFlash_SysACE_CLK_pin : in std_logic;
    fpga_0_SysACE_CompactFlash_SysACE_MPA_pin : out std_logic_vector(6 downto 0);
    fpga_0_SysACE_CompactFlash_SysACE_CEN_pin : out std_logic;
    fpga_0_SysACE_CompactFlash_SysACE_OEN_pin : out std_logic;
    fpga_0_SysACE_CompactFlash_SysACE_WEN_pin : out std_logic;
    fpga_0_SysACE_CompactFlash_SysACE_MPIRQ_pin : in std_logic;
    sys_clk_pin : in std_logic;
    sys_rst_pin : in std_logic;
    register_control_0_video_enable_o_pin : out std_logic;
    register_control_0_background_o_pin : out std_logic_vector(35 downto 0);
    register_control_0_gpu_enable_o_pin : out std_logic;
    register_control_0_eof_i_pin : in std_logic;
    register_control_0_matrix_we_pin : out std_logic;
    register_control_0_matrix_sel_pin : out std_logic_vector(1 downto 0);
    register_control_0_matrix_waddr_pin : out std_logic_vector(3 downto 0);
    register_control_0_matrix_wdata_pin : out std_logic_vector(127 downto 0);
    register_control_0_x_in_o_pin : out std_logic_vector(31 downto 0);
    register_control_0_y_in_o_pin : out std_logic_vector(31 downto 0);
    register_control_0_z_in_o_pin : out std_logic_vector(31 downto 0);
    register_control_0_w_in_o_pin : out std_logic_vector(31 downto 0);
    register_control_0_color_in_o_pin : out std_logic_vector(31 downto 0);
    register_control_0_zbt_mbox_dval_pin : in std_logic;
    register_control_0_zbt_mbox_wdone_pin : in std_logic;
    register_control_0_zbt_mbox_rdata_pin : in std_logic_vector(35 downto 0);
    register_control_0_zbt_mbox_wdata_pin : out std_logic_vector(35 downto 0);
    register_control_0_zbt_mbox_addr_pin : out std_logic_vector(19 downto 0);
    register_control_0_zbt_mbox_we_pin : out std_logic;
    register_control_0_zbt_mbox_sel_pin : out std_logic;
    register_control_0_zmax_o_pin : out std_logic_vector(31 downto 0);
    register_control_0_point_trig_o_pin : out std_logic;
    IIC_EEPROM_Scl_T_pin : out std_logic;
    IIC_EEPROM_Scl_O_pin : out std_logic;
    IIC_EEPROM_Scl_I_pin : in std_logic;
    IIC_EEPROM_Sda_T_pin : out std_logic;
    IIC_EEPROM_Sda_O_pin : out std_logic;
    IIC_EEPROM_Sda_I_pin : in std_logic;
    Push_Buttons_5Bit_GPIO_IO_T_pin : out std_logic_vector(0 to 4);
    Push_Buttons_5Bit_GPIO_IO_O_pin : out std_logic_vector(0 to 4);
    Push_Buttons_5Bit_GPIO_IO_I_pin : in std_logic_vector(0 to 4);
    SysACE_CompactFlash_SysACE_MPD_T_pin : out std_logic_vector(15 downto 0);
    SysACE_CompactFlash_SysACE_MPD_O_pin : out std_logic_vector(15 downto 0);
    SysACE_CompactFlash_SysACE_MPD_I_pin : in std_logic_vector(15 downto 0);
    register_control_0_pix_valid_pin : in std_logic;
    register_control_0_Ty_in_o_pin : out std_logic_vector(31 downto 0);
    register_control_0_Tx_in_o_pin : out std_logic_vector(31 downto 0);
    register_control_0_Ver_Tex_o_pin : out std_logic;
    register_control_0_Clc_scr_o_pin : out std_logic
  );
end cpu_0_stub;

architecture STRUCTURE of cpu_0_stub is

  component cpu_0 is
    port (
      fpga_0_RS232_Uart_1_RX_pin : in std_logic;
      fpga_0_RS232_Uart_1_TX_pin : out std_logic;
      fpga_0_DDR2_SDRAM_DDR2_ODT_pin : out std_logic_vector(1 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_Addr_pin : out std_logic_vector(12 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin : out std_logic_vector(1 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin : out std_logic;
      fpga_0_DDR2_SDRAM_DDR2_CE_pin : out std_logic_vector(1 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_CS_n_pin : out std_logic_vector(1 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin : out std_logic;
      fpga_0_DDR2_SDRAM_DDR2_WE_n_pin : out std_logic;
      fpga_0_DDR2_SDRAM_DDR2_Clk_pin : out std_logic_vector(1 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin : out std_logic_vector(1 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_DM_pin : out std_logic_vector(7 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_DQS : inout std_logic_vector(7 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_DQS_n : inout std_logic_vector(7 downto 0);
      fpga_0_DDR2_SDRAM_DDR2_DQ : inout std_logic_vector(63 downto 0);
      fpga_0_SysACE_CompactFlash_SysACE_CLK_pin : in std_logic;
      fpga_0_SysACE_CompactFlash_SysACE_MPA_pin : out std_logic_vector(6 downto 0);
      fpga_0_SysACE_CompactFlash_SysACE_CEN_pin : out std_logic;
      fpga_0_SysACE_CompactFlash_SysACE_OEN_pin : out std_logic;
      fpga_0_SysACE_CompactFlash_SysACE_WEN_pin : out std_logic;
      fpga_0_SysACE_CompactFlash_SysACE_MPIRQ_pin : in std_logic;
      sys_clk_pin : in std_logic;
      sys_rst_pin : in std_logic;
      register_control_0_video_enable_o_pin : out std_logic;
      register_control_0_background_o_pin : out std_logic_vector(35 downto 0);
      register_control_0_gpu_enable_o_pin : out std_logic;
      register_control_0_eof_i_pin : in std_logic;
      register_control_0_matrix_we_pin : out std_logic;
      register_control_0_matrix_sel_pin : out std_logic_vector(1 downto 0);
      register_control_0_matrix_waddr_pin : out std_logic_vector(3 downto 0);
      register_control_0_matrix_wdata_pin : out std_logic_vector(127 downto 0);
      register_control_0_x_in_o_pin : out std_logic_vector(31 downto 0);
      register_control_0_y_in_o_pin : out std_logic_vector(31 downto 0);
      register_control_0_z_in_o_pin : out std_logic_vector(31 downto 0);
      register_control_0_w_in_o_pin : out std_logic_vector(31 downto 0);
      register_control_0_color_in_o_pin : out std_logic_vector(31 downto 0);
      register_control_0_zbt_mbox_dval_pin : in std_logic;
      register_control_0_zbt_mbox_wdone_pin : in std_logic;
      register_control_0_zbt_mbox_rdata_pin : in std_logic_vector(35 downto 0);
      register_control_0_zbt_mbox_wdata_pin : out std_logic_vector(35 downto 0);
      register_control_0_zbt_mbox_addr_pin : out std_logic_vector(19 downto 0);
      register_control_0_zbt_mbox_we_pin : out std_logic;
      register_control_0_zbt_mbox_sel_pin : out std_logic;
      register_control_0_zmax_o_pin : out std_logic_vector(31 downto 0);
      register_control_0_point_trig_o_pin : out std_logic;
      IIC_EEPROM_Scl_T_pin : out std_logic;
      IIC_EEPROM_Scl_O_pin : out std_logic;
      IIC_EEPROM_Scl_I_pin : in std_logic;
      IIC_EEPROM_Sda_T_pin : out std_logic;
      IIC_EEPROM_Sda_O_pin : out std_logic;
      IIC_EEPROM_Sda_I_pin : in std_logic;
      Push_Buttons_5Bit_GPIO_IO_T_pin : out std_logic_vector(0 to 4);
      Push_Buttons_5Bit_GPIO_IO_O_pin : out std_logic_vector(0 to 4);
      Push_Buttons_5Bit_GPIO_IO_I_pin : in std_logic_vector(0 to 4);
      SysACE_CompactFlash_SysACE_MPD_T_pin : out std_logic_vector(15 downto 0);
      SysACE_CompactFlash_SysACE_MPD_O_pin : out std_logic_vector(15 downto 0);
      SysACE_CompactFlash_SysACE_MPD_I_pin : in std_logic_vector(15 downto 0);
      register_control_0_pix_valid_pin : in std_logic;
      register_control_0_Ty_in_o_pin : out std_logic_vector(31 downto 0);
      register_control_0_Tx_in_o_pin : out std_logic_vector(31 downto 0);
      register_control_0_Ver_Tex_o_pin : out std_logic;
      register_control_0_Clc_scr_o_pin : out std_logic
    );
  end component;

begin

  cpu_0_i : cpu_0
    port map (
      fpga_0_RS232_Uart_1_RX_pin => fpga_0_RS232_Uart_1_RX_pin,
      fpga_0_RS232_Uart_1_TX_pin => fpga_0_RS232_Uart_1_TX_pin,
      fpga_0_DDR2_SDRAM_DDR2_ODT_pin => fpga_0_DDR2_SDRAM_DDR2_ODT_pin,
      fpga_0_DDR2_SDRAM_DDR2_Addr_pin => fpga_0_DDR2_SDRAM_DDR2_Addr_pin,
      fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin => fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin,
      fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin => fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin,
      fpga_0_DDR2_SDRAM_DDR2_CE_pin => fpga_0_DDR2_SDRAM_DDR2_CE_pin,
      fpga_0_DDR2_SDRAM_DDR2_CS_n_pin => fpga_0_DDR2_SDRAM_DDR2_CS_n_pin,
      fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin => fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin,
      fpga_0_DDR2_SDRAM_DDR2_WE_n_pin => fpga_0_DDR2_SDRAM_DDR2_WE_n_pin,
      fpga_0_DDR2_SDRAM_DDR2_Clk_pin => fpga_0_DDR2_SDRAM_DDR2_Clk_pin,
      fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin => fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin,
      fpga_0_DDR2_SDRAM_DDR2_DM_pin => fpga_0_DDR2_SDRAM_DDR2_DM_pin,
      fpga_0_DDR2_SDRAM_DDR2_DQS => fpga_0_DDR2_SDRAM_DDR2_DQS,
      fpga_0_DDR2_SDRAM_DDR2_DQS_n => fpga_0_DDR2_SDRAM_DDR2_DQS_n,
      fpga_0_DDR2_SDRAM_DDR2_DQ => fpga_0_DDR2_SDRAM_DDR2_DQ,
      fpga_0_SysACE_CompactFlash_SysACE_CLK_pin => fpga_0_SysACE_CompactFlash_SysACE_CLK_pin,
      fpga_0_SysACE_CompactFlash_SysACE_MPA_pin => fpga_0_SysACE_CompactFlash_SysACE_MPA_pin,
      fpga_0_SysACE_CompactFlash_SysACE_CEN_pin => fpga_0_SysACE_CompactFlash_SysACE_CEN_pin,
      fpga_0_SysACE_CompactFlash_SysACE_OEN_pin => fpga_0_SysACE_CompactFlash_SysACE_OEN_pin,
      fpga_0_SysACE_CompactFlash_SysACE_WEN_pin => fpga_0_SysACE_CompactFlash_SysACE_WEN_pin,
      fpga_0_SysACE_CompactFlash_SysACE_MPIRQ_pin => fpga_0_SysACE_CompactFlash_SysACE_MPIRQ_pin,
      sys_clk_pin => sys_clk_pin,
      sys_rst_pin => sys_rst_pin,
      register_control_0_video_enable_o_pin => register_control_0_video_enable_o_pin,
      register_control_0_background_o_pin => register_control_0_background_o_pin,
      register_control_0_gpu_enable_o_pin => register_control_0_gpu_enable_o_pin,
      register_control_0_eof_i_pin => register_control_0_eof_i_pin,
      register_control_0_matrix_we_pin => register_control_0_matrix_we_pin,
      register_control_0_matrix_sel_pin => register_control_0_matrix_sel_pin,
      register_control_0_matrix_waddr_pin => register_control_0_matrix_waddr_pin,
      register_control_0_matrix_wdata_pin => register_control_0_matrix_wdata_pin,
      register_control_0_x_in_o_pin => register_control_0_x_in_o_pin,
      register_control_0_y_in_o_pin => register_control_0_y_in_o_pin,
      register_control_0_z_in_o_pin => register_control_0_z_in_o_pin,
      register_control_0_w_in_o_pin => register_control_0_w_in_o_pin,
      register_control_0_color_in_o_pin => register_control_0_color_in_o_pin,
      register_control_0_zbt_mbox_dval_pin => register_control_0_zbt_mbox_dval_pin,
      register_control_0_zbt_mbox_wdone_pin => register_control_0_zbt_mbox_wdone_pin,
      register_control_0_zbt_mbox_rdata_pin => register_control_0_zbt_mbox_rdata_pin,
      register_control_0_zbt_mbox_wdata_pin => register_control_0_zbt_mbox_wdata_pin,
      register_control_0_zbt_mbox_addr_pin => register_control_0_zbt_mbox_addr_pin,
      register_control_0_zbt_mbox_we_pin => register_control_0_zbt_mbox_we_pin,
      register_control_0_zbt_mbox_sel_pin => register_control_0_zbt_mbox_sel_pin,
      register_control_0_zmax_o_pin => register_control_0_zmax_o_pin,
      register_control_0_point_trig_o_pin => register_control_0_point_trig_o_pin,
      IIC_EEPROM_Scl_T_pin => IIC_EEPROM_Scl_T_pin,
      IIC_EEPROM_Scl_O_pin => IIC_EEPROM_Scl_O_pin,
      IIC_EEPROM_Scl_I_pin => IIC_EEPROM_Scl_I_pin,
      IIC_EEPROM_Sda_T_pin => IIC_EEPROM_Sda_T_pin,
      IIC_EEPROM_Sda_O_pin => IIC_EEPROM_Sda_O_pin,
      IIC_EEPROM_Sda_I_pin => IIC_EEPROM_Sda_I_pin,
      Push_Buttons_5Bit_GPIO_IO_T_pin => Push_Buttons_5Bit_GPIO_IO_T_pin,
      Push_Buttons_5Bit_GPIO_IO_O_pin => Push_Buttons_5Bit_GPIO_IO_O_pin,
      Push_Buttons_5Bit_GPIO_IO_I_pin => Push_Buttons_5Bit_GPIO_IO_I_pin,
      SysACE_CompactFlash_SysACE_MPD_T_pin => SysACE_CompactFlash_SysACE_MPD_T_pin,
      SysACE_CompactFlash_SysACE_MPD_O_pin => SysACE_CompactFlash_SysACE_MPD_O_pin,
      SysACE_CompactFlash_SysACE_MPD_I_pin => SysACE_CompactFlash_SysACE_MPD_I_pin,
      register_control_0_pix_valid_pin => register_control_0_pix_valid_pin,
      register_control_0_Ty_in_o_pin => register_control_0_Ty_in_o_pin,
      register_control_0_Tx_in_o_pin => register_control_0_Tx_in_o_pin,
      register_control_0_Ver_Tex_o_pin => register_control_0_Ver_Tex_o_pin,
      register_control_0_Clc_scr_o_pin => register_control_0_Clc_scr_o_pin
    );

end architecture STRUCTURE;

