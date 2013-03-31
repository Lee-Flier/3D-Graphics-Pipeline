----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:00:31 09/19/2010 
-- Design Name: 
-- Module Name:    top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


library  work;
use work.gpu_pkg.all;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity top is
port(
	sys_rst_pin : in std_logic; -- ping chang wei gao dian ping  
	-- Main external clock reference
	sys_clk_pin:  in std_logic;  -- 100 mhz de chu li nei rong 
	-- UART (for debugging, stdio, etc.) 
	fpga_0_RS232_Uart_1_RX_pin : in std_logic;
	fpga_0_RS232_Uart_1_TX_pin : out std_logic;

	-- I2C Bus I/O (to be used later...DO NOT FORGET
	-- PULLUP declarations on these pins in the UCF)
	fpga_0_IIC_EEPROM_Scl_pin : inout std_logic; 
	fpga_0_IIC_EEPROM_Sda_pin : inout std_logic; 

	fpga_0_DVI_IIC_0_Scl_pin  : out std_logic; -- wei zhi jie ying yong de 
	fpga_0_DVI_IIC_0_Sda_pin  : out std_logic; -- wei zhi jie ying yong de 


	-- Flash interface pins.
	fpga_0_SysACE_CompactFlash_SysACE_CLK_pin : in std_logic;
	fpga_0_SysACE_CompactFlash_SysACE_MPA_pin : out std_logic_vector(6 downto 0);
	fpga_0_SysACE_CompactFlash_SysACE_CEN_pin : out std_logic;
	fpga_0_SysACE_CompactFlash_SysACE_OEN_pin : out std_logic;
	fpga_0_SysACE_CompactFlash_SysACE_WEN_pin : out std_logic;
	fpga_0_SysACE_CompactFlash_SysACE_MPIRQ_pin : in std_logic;
	fpga_0_SysACE_CompactFlash_SysACE_MPD_pin : inout std_logic_vector ( 15 downto 0 );

   -- ddr dram interface pins
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

	-- push buttons_5bit input
	fpga_0_Push_Buttons_5Bit_GPIO_IO_pin: inout std_logic_vector(0 to 4);
		
	-- sram interface pins 
 	-- zbt_clk : out std_logic;  -- ZBT CLK  125 Mhz hai shi zai tong bu dao dian dou shi 
	-- zbt_clk_fb : in std_logic;  -- YONG YU FANG HUI YOU LUO JI
	-- --zbt_addr : out std_logic_vector(20 downto 0); -- " XIANGYING DE JIAO DE CHU LI "
	-- zbt_addr : out std_logic_vector(17 downto 0); -- " XIANGYING DE JIAO DE CHU LI "
	-- zbt_dq : inout std_logic_vector(35 downto 0);  -- DATA SIGNAL 
	-- zbt_ben : out std_logic_vector(3 downto 0);  -- wei jie "0000"
	-- zbt_oen : out std_logic;  -- READ DE  SIGNAL 
	-- zbt_cen : out std_logic;  -- ENABLE SIGNAL 
	-- zbt_wen : out std_logic;  -- WRITER OR READ SIGNAL 
	-- zbt_adv : out std_logic; 
	-- zbt_mode : out std_logic;
			
	-- Signals that drive the video DAC
	dvi_reset_b : in std_logic;  
	dvi_xclk_n : out std_logic;  -- DVI SIGNAL 
	dvi_xclk_p : out std_logic; 
	dvi_d : out std_logic_vector(11 downto 0);   -- XIN HAO FU YONG 
	dvi_de : out std_logic; 
	--dvi_gpio1 : inout std_logic; 
	dvi_h : out std_logic; 
	dvi_v : out std_logic
);
end top;

architecture Behavioral of top is

COMPONENT cpu_0 is
	PORT(
		fpga_0_RS232_Uart_1_RX_pin : IN std_logic;
	 	fpga_0_SysACE_CompactFlash_SysACE_CLK_pin : IN std_logic;
		fpga_0_SysACE_CompactFlash_SysACE_MPIRQ_pin : IN std_logic;
		sys_clk_pin : IN std_logic;
		sys_rst_pin : IN std_logic;
		register_control_0_eof_i_pin : IN std_logic;
		register_control_0_zbt_mbox_dval_pin : IN std_logic;
		register_control_0_zbt_mbox_wdone_pin : IN std_logic;
		register_control_0_zbt_mbox_rdata_pin : IN std_logic_vector(35 downto 0);
		IIC_EEPROM_Scl_I_pin : IN std_logic;
		IIC_EEPROM_Sda_I_pin : IN std_logic;
		Push_Buttons_5Bit_GPIO_IO_I_pin : IN std_logic_vector(0 to 4);
		SysACE_CompactFlash_SysACE_MPD_I_pin : IN std_logic_vector(15 downto 0);    
		register_control_0_pix_valid_pin : IN std_logic;
		fpga_0_DDR2_SDRAM_DDR2_DQS : INOUT std_logic_vector(7 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_DQS_n : INOUT std_logic_vector(7 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_DQ : INOUT std_logic_vector(63 downto 0);      
		fpga_0_RS232_Uart_1_TX_pin : OUT std_logic;
		fpga_0_DDR2_SDRAM_DDR2_ODT_pin : OUT std_logic_vector(1 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_Addr_pin : OUT std_logic_vector(12 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_BankAddr_pin : OUT std_logic_vector(1 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_CAS_n_pin : OUT std_logic;
		fpga_0_DDR2_SDRAM_DDR2_CE_pin : OUT std_logic_vector(1 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_CS_n_pin : OUT std_logic_vector(1 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_RAS_n_pin : OUT std_logic;
		fpga_0_DDR2_SDRAM_DDR2_WE_n_pin : OUT std_logic;
		fpga_0_DDR2_SDRAM_DDR2_Clk_pin : OUT std_logic_vector(1 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_Clk_n_pin : OUT std_logic_vector(1 downto 0);
		fpga_0_DDR2_SDRAM_DDR2_DM_pin : OUT std_logic_vector(7 downto 0);
		fpga_0_SysACE_CompactFlash_SysACE_MPA_pin : OUT std_logic_vector(6 downto 0);
		fpga_0_SysACE_CompactFlash_SysACE_CEN_pin : OUT std_logic;
		fpga_0_SysACE_CompactFlash_SysACE_OEN_pin : OUT std_logic;
		fpga_0_SysACE_CompactFlash_SysACE_WEN_pin : OUT std_logic;
		register_control_0_video_enable_o_pin : OUT std_logic;
		register_control_0_background_o_pin : OUT std_logic_vector(35 downto 0);
		register_control_0_gpu_enable_o_pin : OUT std_logic;
		register_control_0_matrix_we_pin : OUT std_logic;
		register_control_0_matrix_sel_pin : OUT std_logic_vector(1 downto 0);
		register_control_0_matrix_waddr_pin : OUT std_logic_vector(3 downto 0);
		register_control_0_matrix_wdata_pin : OUT std_logic_vector(127 downto 0);
		register_control_0_x_in_o_pin : OUT std_logic_vector(31 downto 0);
		register_control_0_y_in_o_pin : OUT std_logic_vector(31 downto 0);
		register_control_0_z_in_o_pin : OUT std_logic_vector(31 downto 0);
		register_control_0_w_in_o_pin : OUT std_logic_vector(31 downto 0);
		register_control_0_color_in_o_pin : OUT std_logic_vector(31 downto 0);
		register_control_0_zbt_mbox_wdata_pin : OUT std_logic_vector(35 downto 0);
		register_control_0_zbt_mbox_addr_pin : OUT std_logic_vector(19 downto 0);
		register_control_0_zbt_mbox_we_pin : OUT std_logic;
		register_control_0_zbt_mbox_sel_pin : OUT std_logic;
		register_control_0_zmax_o_pin : OUT std_logic_vector(31 downto 0);
		register_control_0_point_trig_o_pin : OUT std_logic;
		IIC_EEPROM_Scl_T_pin : OUT std_logic;
		IIC_EEPROM_Scl_O_pin : OUT std_logic;
		IIC_EEPROM_Sda_T_pin : OUT std_logic;
		IIC_EEPROM_Sda_O_pin : OUT std_logic;
		Push_Buttons_5Bit_GPIO_IO_T_pin : OUT std_logic_vector(0 to 4);
		Push_Buttons_5Bit_GPIO_IO_O_pin : OUT std_logic_vector(0 to 4);
		SysACE_CompactFlash_SysACE_MPD_T_pin : OUT std_logic_vector(15 downto 0);
		SysACE_CompactFlash_SysACE_MPD_O_pin : OUT std_logic_vector(15 downto 0);
		register_control_0_Ty_in_o_pin : OUT std_logic_vector(31 downto 0);
		register_control_0_Tx_in_o_pin : OUT std_logic_vector(31 downto 0);
		register_control_0_Ver_Tex_o_pin : OUT std_logic;
		register_control_0_Clc_scr_o_pin : OUT std_logic
		);
	END COMPONENT;

component FIFOTODVI is 
port (
		reset : in std_logic; -- Async Reset. 
		sys_clk_pin : in std_logic; -- System clock. 
		clk : out std_logic;
		-- zbt_clk : in std_logic; -- ZBT memory clock. 
		-- vga_clk : in std_logic; -- Vga clock.

		vga_enable : in std_logic;
		-- New frame trigger signals. 
		gpu_enable : in std_logic;
		-- Background 
		background : in std_logic_vector(35 downto 0);
		-- End of file 
		eof : out std_logic;
		matrix_we : in std_logic; 
		matrix_sel : in std_logic_vector(1 downto 0); 
		matrix_waddr : in std_logic_vector(3 downto 0); 
		matrix_wdata : in std_logic_vector(127 downto 0);
		-- Pixel Pipe.
		x_in : in std_logic_vector(31 downto 0); 
		y_in : in std_logic_vector(31 downto 0); 
		z_in : in std_logic_vector(31 downto 0); 
		w_in : in std_logic_vector(31 downto 0); 
		color : in std_logic_vector(31 downto 0); 
		Tx : in std_logic_vector(31 downto 0);
		Ty : in std_logic_vector(31 downto 0);
		Ver_Tex : in std_logic;
		Clc_scr : in std_logic;
		pix_valid : in std_logic; 
		pix_ready : out std_logic;
 
-- Clipping Maximum 
		zmax : in std_logic_vector(31 downto 0);
		-- CPU Interface port. 
		-- cpu_sel : in std_logic; 
		-- cpu_we : in std_logic; 
		-- cpu_addr : in std_logic_vector(19 downto 0); 
		-- cpu_wdata : in std_logic_vector(35 downto 0); 
		-- cpu_wdone : out std_logic; 
		-- cpu_dval : out std_logic; 
		-- cpu_rdata : out std_logic_vector(35 downto 0);

		-- ZBT interface 
		-- zbt_cen : out std_logic; 
		-- zbt_wen : out std_logic; 
		-- zbt_oen : out std_logic; 
		-- zbt_ts : out std_logic; 
		-- zbt_wdata : out std_logic_vector(35 downto 0); 
		-- zbt_addr : out std_logic_vector(17 downto 0); 
		-- zbt_rdata : in std_logic_vector(35 downto 0); 

		-- Dvi interface signals. 
		sda_pin : out std_logic;
		scl_pin : out std_logic;
		done : out std_logic;
		
		dvi_d : out std_logic_vector(11 downto 0);
		dvi_h : out std_logic;
		dvi_v : out std_logic;
		dvi_de : out std_logic;
		dvi_xclk_n : out std_logic;
		dvi_xclk_p : out std_logic
		-- dvi_hsync_n: out std_logic;
		-- dvi_vsync_n: out std_logic; 
		-- dvi_data_en: out std_logic; 
		-- dvi_data1 : out std_logic_vector(11 downto 0); 
		-- dvi_data2 : out std_logic_vector(11 downto 0)
);
end component ;


COMPONENT pix_clk_gen
	PORT(
	   -- CLKFB_IN : IN std_logic;
		CLKIN_IN : IN std_logic;
		RST_IN : IN std_logic;          
		CLKDV_OUT : OUT std_logic;
		--CLKFX_OUT : OUT std_logic;
		CLKIN_IBUFG_OUT : OUT std_logic;
		CLK0_OUT : OUT std_logic;
		LOCKED_OUT : OUT std_logic
		);
END COMPONENT;
	
component iic_init  is
  port ( 
          clk : in std_logic;
          Reset_n : in std_logic;
			 SDA : out std_logic;
			 SCL : out std_logic;
			 Done : out std_logic
      );
end component;

component icon is
  port (
   CONTROL0 : inout STD_LOGIC_VECTOR ( 35 downto 0 )     
  );
end component ;


component ila is 
  port (
    CLK : in STD_LOGIC := 'X'; 
    CONTROL : inout STD_LOGIC_VECTOR ( 35 downto 0 ); 
    TRIG0 : in STD_LOGIC_VECTOR ( 449 downto 0 ) 
  );
end component ;





signal vdd : std_logic_vector(31 downto 0);  -- YONG YU ZHONG HE SHI ZI JI DING YI DE 
signal gnd : std_logic_vector(31 downto 0); 

signal reset_0 : std_logic; 
signal reset_1 : std_logic; 

signal dvi_hsync_n : std_logic; 
signal dvi_vsync_n : std_logic; 
signal dvi_data_en : std_logic; 
signal dvi_data1 : std_logic_vector(11 downto 0); 
signal dvi_data2 : std_logic_vector(11 downto 0); 
-- 
signal vga_clk_d : std_logic ; 
signal sys_clk_125 : std_logic; 



--signal vga_data : std_logic_vector(23 downto 0);
--signal vga_data_val :  std_logic;
--signal vga_fifo_afull :  std_logic;


signal clk_100mhz : std_logic;
signal locked : std_logic;
signal double_vga_clk : std_logic;

-- control port 
signal vga_enable : std_logic := '0';
signal gpu_enable : std_logic := '0';
signal background : std_logic_vector(35 downto 0);
signal eof : std_logic; 
signal done : std_logic;


signal zbt_cen_i : std_logic; 
signal zbt_wen_i : std_logic; 
signal zbt_oen_i : std_logic; 
signal zbt_ts_i : std_logic;
signal zbt_addr_i : std_logic_vector(17 downto 0); 
signal zbt_wdata_i : std_logic_vector(35 downto 0); 
signal zbt_rdata_i : std_logic_vector(35 downto 0); 

signal cpu_sel :  std_logic; 
signal cpu_we :  std_logic;
signal cpu_addr : std_logic_vector(19 downto 0); 
signal cpu_wdata :  std_logic_vector(35 downto 0); 
signal cpu_wdone : std_logic;
signal cpu_dval :  std_logic; 
signal cpu_rdata :  std_logic_vector(35 downto 0);

signal video_enable : std_logic;





signal x0_buf : std_logic_vector(8 downto 0); 
signal x1_buf : std_logic_vector(8 downto 0);
signal y0_buf : std_logic_vector(7 downto 0);
signal y1_buf : std_logic_vector(7 downto 0);

signal color : std_logic_vector(31 downto 0):= ( others => '1'); 
signal pix_valid : std_logic; 
signal pix_ready : std_logic; 

signal matrix_we : std_logic; 
signal matrix_sel : std_logic_vector(1 downto 0); 
signal matrix_waddr : std_logic_vector(3 downto 0); 
signal matrix_wdata : std_logic_vector(127 downto 0); 

signal x_in : std_logic_vector(31 downto 0); 
signal y_in : std_logic_vector(31 downto 0); 
signal z_in : std_logic_vector(31 downto 0); 
signal w_in : std_logic_vector(31 downto 0); 
signal color_in : std_logic_vector(31 downto 0); 
signal Tx : std_logic_vector(31 downto 0);
signal Ty : std_logic_vector(31 downto 0);
signal Ver_Tex : std_logic;
signal Clc_scr : std_logic;
signal zmax : std_logic_vector(31 downto 0); 

signal cpu_addr_i : std_logic_vector(17 downto 0); 

signal write_cmd_count: std_logic_vector(1 downto 0) := ( others => '0'); 

-- x y z w  test_port	
signal	x_in_test :  std_logic_vector(31 downto 0); 
signal	y_in_test :  std_logic_vector(31 downto 0); 
signal	z_in_test :  std_logic_vector(31 downto 0); 
signal	w_in_test :  std_logic_vector(31 downto 0); 
signal	color_test :  std_logic_vector(17 downto 0); 
signal	pix_valid_test :  std_logic; 
signal	pix_ready_test :  std_logic;

signal   x_screen  :  std_logic_vector(17 downto 0);
signal   y_screen  :  std_logic_vector(17 downto 0);
signal	color_screen :  std_logic_vector(17 downto 0); 
signal	valid_screen :  std_logic ;

signal 	IIC_EEPROM_Scl_T_pin :  std_logic;
signal	IIC_EEPROM_Scl_O_pin :  std_logic;
signal	IIC_EEPROM_Scl_I_pin :  std_logic;
signal	IIC_EEPROM_Sda_T_pin :  std_logic;
signal	IIC_EEPROM_Sda_O_pin :  std_logic;
signal	IIC_EEPROM_Sda_I_pin :  std_logic;

signal  	Push_Buttons_5Bit_GPIO_IO_T_pin :  std_logic_vector(4 downto 0);
signal	Push_Buttons_5Bit_GPIO_IO_O_pin :  std_logic_vector(4 downto 0);
signal	Push_Buttons_5Bit_GPIO_IO_I_pin :  std_logic_vector(4 downto 0);


signal SysACE_CompactFlash_SysACE_MPD_I_pin :  std_logic_vector(15 downto 0);
signal SysACE_CompactFlash_SysACE_MPD_T_pin :  std_logic_vector(15 downto 0);
signal SysACE_CompactFlash_SysACE_MPD_O_pin :  std_logic_vector(15 downto 0);


type cpu_write_staue_t is (cpu_cmd_write, wait_for_down, enable_vga_gpu, write_world_matrix, write_view_matrix, write_project_matrix, write_screen_matrix, draw_line, wait_for_eof,idle);
signal  cpu_write_staue : cpu_write_staue_t;
 
begin

-- Create both high and low polarity reset signals...
--reset_n <= ext_rst_n; -- SHANG DIAN WEI 
reset_0 <= sys_rst_pin;
reset_1 <= not(sys_rst_pin);  -- WAI BU DE WEI SHU RU SHANG LAI DIAN ZHU  DI DIAN PING YOU XIAO 
-- Single bit ones and zeroes...
vdd <= (others => '1');
gnd <= (others => '0');



-- Inst_pix_clk_gen: pix_clk_gen 
	-- PORT MAP(
	   -- -- CLKFB_IN => zbt_clk_fb,
		-- CLKIN_IN => sys_clk_pin,
		-- RST_IN => '0',
		-- CLKDV_OUT => vga_clk_d ,
		-- --CLKFX_OUT => double_vga_clk,
		-- CLKIN_IBUFG_OUT => open ,
		-- CLK0_OUT => clk_100mhz,
		-- LOCKED_OUT => locked
	-- );




-- zbt_clk <= clk_100mhz;


Inst_cpu_0: cpu_0 
PORT MAP(
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
		--fpga_0_SysACE_CompactFlash_SysACE_MPD_pin => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin,
		fpga_0_SysACE_CompactFlash_SysACE_CEN_pin => fpga_0_SysACE_CompactFlash_SysACE_CEN_pin,
		fpga_0_SysACE_CompactFlash_SysACE_OEN_pin => fpga_0_SysACE_CompactFlash_SysACE_OEN_pin,
		fpga_0_SysACE_CompactFlash_SysACE_WEN_pin => fpga_0_SysACE_CompactFlash_SysACE_WEN_pin,
		fpga_0_SysACE_CompactFlash_SysACE_MPIRQ_pin => fpga_0_SysACE_CompactFlash_SysACE_MPIRQ_pin,
		sys_clk_pin => clk_100mhz,
		sys_rst_pin => sys_rst_pin,
		register_control_0_video_enable_o_pin => vga_enable,
		register_control_0_background_o_pin => background,
		register_control_0_gpu_enable_o_pin => gpu_enable,
		register_control_0_eof_i_pin => eof, -------------------fifo valid------------------
		register_control_0_pix_valid_pin => pix_ready,
		--register_control_0_eof_i_pin => eof, -------------------fifo valid------------------
		register_control_0_matrix_we_pin => matrix_we,
		register_control_0_matrix_sel_pin => matrix_sel,
		register_control_0_matrix_waddr_pin => matrix_waddr,
		register_control_0_matrix_wdata_pin => matrix_wdata,
		register_control_0_x_in_o_pin => x_in,
		register_control_0_y_in_o_pin => y_in,
		register_control_0_z_in_o_pin => z_in,
		register_control_0_w_in_o_pin => w_in,
		register_control_0_color_in_o_pin => color_in,
		register_control_0_zbt_mbox_dval_pin => cpu_dval,
		register_control_0_zbt_mbox_wdone_pin => cpu_wdone,
		register_control_0_zbt_mbox_rdata_pin => cpu_rdata,
		register_control_0_zbt_mbox_wdata_pin => cpu_wdata,
		register_control_0_zbt_mbox_addr_pin => cpu_addr,
		register_control_0_zbt_mbox_we_pin => cpu_we,
		register_control_0_zbt_mbox_sel_pin => cpu_sel,
		register_control_0_zmax_o_pin => zmax,
		register_control_0_point_trig_o_pin => pix_valid,
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
		register_control_0_Ty_in_o_pin =>Tx,
		register_control_0_Tx_in_o_pin =>Ty,
		register_control_0_Ver_Tex_o_pin => Ver_Tex,
		register_control_0_Clc_scr_o_pin => Clc_scr
	);


test : FIFOTODVI
port map
(
		reset => reset_1, -- Async Reset. 
		sys_clk_pin =>sys_clk_pin,
		clk => clk_100mhz,-- System clock. 
		-- zbt_clk => clk_100mhz,-- ZBT memory clock. 
		-- vga_clk => vga_clk_d, -- Vga clock.
		vga_enable => vga_enable,--
		-- New frame trigger signals. 
		gpu_enable => gpu_enable,
		-- Background 
		background => background,
		-- End of file 
		eof => eof,
		-- Matrix Memory access.
		matrix_we => matrix_we,
		matrix_sel => matrix_sel, 
		matrix_waddr => matrix_waddr, 
		matrix_wdata => matrix_wdata,
		-- Pixel Pipe.
		x_in => x_in, 
		y_in => y_in,
		z_in => z_in,
		w_in => w_in,
		color => color_in,
		Tx => Tx,
		Ty => Ty,
		Ver_Tex => Ver_Tex,
		Clc_scr =>Clc_scr,
		pix_valid => pix_valid, 
		pix_ready => pix_ready,
		-- Clipping Maximum 
		zmax  => zmax,
		-- CPU Interface port. 
		-- cpu_sel => cpu_sel, 
		-- cpu_we => cpu_we,
		-- cpu_addr => cpu_addr,
		-- cpu_wdata => cpu_wdata,
		-- cpu_wdone => cpu_wdone,
		-- cpu_dval => cpu_dval,
		-- cpu_rdata => cpu_rdata,
		-- ZBT interface 
		-- zbt_cen => zbt_cen_i, 
		-- zbt_wen => zbt_wen_i,
		-- zbt_oen => zbt_oen_i, 
		-- zbt_ts  => zbt_ts_i, 
		-- zbt_wdata => zbt_wdata_i, 
		-- zbt_addr  => zbt_addr_i, 
		-- zbt_rdata => zbt_rdata_i, 
		-- Dvi interface signals. 
		sda_pin =>fpga_0_DVI_IIC_0_Sda_pin,
		scl_pin =>fpga_0_DVI_IIC_0_Scl_pin,
		done =>done,
		
		dvi_d => dvi_d,
		dvi_h => dvi_h,
		dvi_v => dvi_v,
		dvi_de=> dvi_de,
		dvi_xclk_n=> dvi_xclk_n,
		dvi_xclk_p=> dvi_xclk_p
		-- dvi_hsync_n => dvi_hsync_n,
		-- dvi_vsync_n => dvi_vsync_n, 
		-- dvi_data_en => dvi_data_en, 
		-- dvi_data1 => dvi_data1, 
		-- dvi_data2 => dvi_data2
);
 
 



--zbt_addr <= "000" & zbt_addr_i;  -- 18 WEI YOU XIAO SHUJU 
-- zbt_addr <=  zbt_addr_i;  -- 18 WEI YOU XIAO SHUJU 
-- --zbt_cen <= zbt_cen_i; 
-- zbt_cen <= '0'; 
-- zbt_wen <= zbt_wen_i; 
-- zbt_ben(0) <= '0'; 
-- zbt_ben(1) <= '0';
-- zbt_ben(2) <= '0';
-- zbt_ben(3) <= '0'; -- zhe bian you wen ti   gu ji ke yi yong  chipscore  lai guang ce xin hao duan shu ju 
-- --zbt_oen <= zbt_oen_i;  -- wen = '1' he  oen = '1' de signal 
-- zbt_oen <= '0';
-- zbt_adv <= '0';
-- zbt_mode <= '0';



-- zbt_tristate :  for i in 35 downto 0 generate
  -- zbt_io:  IOBUF
    -- port map ( I => zbt_wdata_i(i),IO => zbt_dq(i),O => zbt_rdata_i(i),T => zbt_ts_i);
-- end generate;


-- iic_control : iic_init
  -- port map( 
             -- clk => clk_100mhz, -- wei quan ju shi zhong xing hao 
             -- Reset_n => reset_0,
				 -- SDA => fpga_0_DVI_IIC_0_Sda_pin,
				 -- SCL => fpga_0_DVI_IIC_0_Scl_pin,
				 -- Done => done  
  -- );

-- Drive out the ZBT related signals.
 
-- fre_divide : process ( double_vga_clk ) 
--  begin 
--   if (double_vga_clk = '1' and double_vga_clk' event ) then 
--        	 vga_clk_d <= not vga_clk_d ;				
--		end if;
--   end process;
	
	
 -- hsync_mirror : FDRSE 
 -- port map 	( Q => dvi_h , C => vga_clk_d, CE => vdd(0),	R => gnd(0), 	D => dvi_hsync_n); 
 -- vsync_mirror : FDRSE
 -- port map	( Q => dvi_v ,	C => vga_clk_d, CE => vdd(0),	R => gnd(0), 	D=> dvi_vsync_n);
 -- de_mirror :    FDRSE 
 -- port map	( Q => dvi_de,	C => vga_clk_d, CE => vdd(0),	R => gnd(0), 	D=> dvi_data_en);	
	
-- LUO JI SHANG QU SHU LU 
-- -- Clock mirrors for the DAC clock 
-- xclk_p_mirror : ODDR -- Xilinx primitive...-- P clock....
-- port map ( C => vga_clk_d, Q => dvi_xclk_p, CE => vdd(0), D1 => vdd(0), D2 => gnd(0), R => gnd(0), S => gnd(0));
-- xclk_n_mirror : ODDR -- Xilinx primitive...-- N clock...
-- port map ( C => vga_clk_d, Q => dvi_xclk_n, CE => vdd(0), D1 => gnd(0), D2 => vdd(0), R => gnd(0), S => gnd(0));
--vsync_mirror : ODDR -- Xilinx primitive...-- Vsync
--port map ( C => vga_clk_d, Q => dvi_v, CE => vdd(0), D1 => dvi_vsync_n, D2 => dvi_vsync_n, R => gnd(0), S => gnd(0));
--hsync_mirror : ODDR -- Xilinx primitive...--hsync
--port map ( C => vga_clk_d, Q => dvi_h, CE => vdd(0), D1 => dvi_hsync_n, D2 => dvi_hsync_n, R => gnd(0), S => gnd(0));
--de_mirror : ODDR -- Xilinx primitive...
--port map ( C => vga_clk_d, Q => dvi_de, CE => vdd(0), D1 => dvi_data_en, D2 => dvi_data_en, R => gnd(0), S => gnd(0));
-- Data bus (12 bit DDR)
-- dvi_ddr_data : for i in 11 downto 0 generate
-- -- Data flop
-- dvi_dbus_oddr : ODDR -- Xilinx primitive...
-- port map ( C => vga_clk_d, Q => dvi_d(i), CE => vdd(0), D1 => dvi_data1(i), D2 => dvi_data2(i), R => gnd(0), S => gnd(0));
-- end generate;


-- iic_eeprom_scl:  IOBUF
    -- port map ( I => IIC_EEPROM_Scl_O_pin,IO => fpga_0_IIC_EEPROM_Scl_pin,O => IIC_EEPROM_Scl_I_pin,T => IIC_EEPROM_Scl_T_pin);
-- iic_eeprom_sda:  IOBUF
    -- port map ( I => IIC_EEPROM_sda_O_pin,IO => fpga_0_IIC_EEPROM_Sda_pin,O => IIC_EEPROM_sda_I_pin,T => IIC_EEPROM_sda_T_pin);
	 
push :  for i in 4 downto 0 generate
push_buttons_5_bit: IOBUF
    port map ( I => Push_Buttons_5Bit_GPIO_IO_O_pin(i),IO => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin(i),O => Push_Buttons_5Bit_GPIO_IO_I_pin(i),T => Push_Buttons_5Bit_GPIO_IO_T_pin(i));
end generate;

FLASH :  for i in 15 downto 0 generate
  iobuf_0 : IOBUF
    port map (
      I => SysACE_CompactFlash_SysACE_MPD_O_pin(i),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(i),
      O => SysACE_CompactFlash_SysACE_MPD_I_pin(i),
      T => SysACE_CompactFlash_SysACE_MPD_T_pin(i)
    );
end generate;	


--dvi_gpio1 <= 'Z'; -- Keep this at Hi-Z just to be safe... 
--dvi_reset_b <= '1'; -- Keep reset high as the DAC has a poweron reset.

end Behavioral;




