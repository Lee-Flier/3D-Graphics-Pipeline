--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:13:54 09/19/2010
-- Design Name:   
-- Module Name:   D:/xiao/test/testtop.vhd
-- Project Name:  test
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY testtop IS
END testtop;
 
ARCHITECTURE behavior OF testtop IS 

 component cy7c1352 is
   GENERIC ( 
         -- Constant parameters 
	    addr_bits : INTEGER := 19; 
	    data_bits : INTEGER := 36;  
       -- Timing parameters for -10 (133 Mhz) 
        tCYC: TIME    := 7.5 ns; 
        tCH	: TIME    :=  2.1 ns; 
        tCL	: TIME    :=  2.1 ns; 
        tCDV: TIME    :=  6.5 ns; 
        tAS	: TIME    :=  1.5 ns; 
        tCENS: TIME    :=  1.5 ns; 
        tWES: TIME    :=  1.5 ns; 
        tDS	: TIME    :=  1.5 ns; 
        tAH	: TIME    :=  0.5 ns; 
        tCENH: TIME    :=  0.5 ns; 
        tWEH: TIME    :=  0.5 ns; 
        tDH	: TIME    :=  0.5 ns       
    ); 
     -- Port Declarations 
    PORT ( 
	Dq	: INOUT STD_LOGIC_VECTOR ((data_bits - 1) DOWNTO 0);   	-- Data I/O 
	Addr	: IN	STD_LOGIC_VECTOR ((addr_bits - 1) DOWNTO 0);   	-- Address   -- shao le yi ge bit wei zi
	Mode	: IN	STD_LOGIC := '1'; 		                      	-- Burst Mode 
	Clk	: IN	STD_LOGIC;                                      -- Clk 
	CEN_n	: IN	STD_LOGIC;                                      -- CEN# 
	AdvLd_n	: IN	STD_LOGIC;                                   -- Adv/Ld# 
	Bwa_n	: IN	STD_LOGIC;                                      -- Bwa# 
	Bwb_n	: IN	STD_LOGIC;                                      -- BWb# 
	Bwc_n	: IN	STD_LOGIC;                                      -- Bwc# 
	Bwd_n	: IN	STD_LOGIC;                                      -- BWd# 
	Rw_n	: IN	STD_LOGIC;                                      -- RW# 
	Oe_n	: IN	STD_LOGIC;                                      -- OE# 
	Ce1_n	: IN	STD_LOGIC;                                      -- CE1# 
	Ce2	: IN	STD_LOGIC;                                      -- CE2 
	Ce3_n	: IN	STD_LOGIC;                                      -- CE3# 
	Zz	   : IN	STD_LOGIC                                       -- Snooze Mode 
    ); 
end component;
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         sys_rst_pin : IN  std_logic;
         sys_clk_pin : IN  std_logic;
         fpga_0_DVI_IIC_0_Sda_pin : OUT  std_logic;
         fpga_0_DVI_IIC_0_Scl_pin : OUT  std_logic;
         dvi_reset_b : OUT  std_logic;
         dvi_xclk_n : OUT  std_logic;
         dvi_xclk_p : OUT  std_logic;
         dvi_d : OUT  std_logic_vector(11 downto 0);
         dvi_de : OUT  std_logic;
         dvi_h : OUT  std_logic;
         dvi_v : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal sys_rst_pin : std_logic := '1';
   signal sys_clk_pin : std_logic := '0';

 	--Outputs
   signal fpga_0_DVI_IIC_0_Sda_pin : std_logic;
   signal fpga_0_DVI_IIC_0_Scl_pin : std_logic;
   signal dvi_reset_b : std_logic;
   signal dvi_xclk_n : std_logic;
   signal dvi_xclk_p : std_logic;
   signal dvi_d : std_logic_vector(11 downto 0);
   signal dvi_de : std_logic;
   signal dvi_h : std_logic;
   signal dvi_v : std_logic;
 
 
  -- Constants 
 constant sysCLK : time := 5 ns; -- 100 Mhz
 constant zbtCLK : time := 5 ns; -- 100 Mhz 
 constant vgaCLK : time := 20 ns; -- 25 Mhz 
 constant dviCLK : time := 10 ns; -- 50 Mhz 
 constant tsetup : time := 1 ns; 
 constant boardDelay : time := 1 ns; 
 -- Tieoffs in case you need them...
 signal vdd : std_logic; 
 signal gnd : std_logic_vector(63 downto 0);
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          sys_rst_pin => sys_rst_pin,
          sys_clk_pin => sys_clk_pin,
          fpga_0_DVI_IIC_0_Sda_pin => fpga_0_DVI_IIC_0_Sda_pin,
          fpga_0_DVI_IIC_0_Scl_pin => fpga_0_DVI_IIC_0_Scl_pin,
          dvi_reset_b => dvi_reset_b,
          dvi_xclk_n => dvi_xclk_n,
          dvi_xclk_p => dvi_xclk_p,
          dvi_d => dvi_d,
          dvi_de => dvi_de,
          dvi_h => dvi_h,
          dvi_v => dvi_v
        );
 
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period := 1ns;
 
    testprocess :process
   begin
		sys_clk_pin <= '0';
		wait for 5 ns;
   	sys_clk_pin <= '1';
		wait for 5 ns;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100ms.
      wait for 100ms;	

   --   wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;




library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all; 
library work;
use work.zbt_ctrl_pkg.all;
 
 entity video_control_top_tb is 
 end video_control_top_tb;
 
 architecture test of video_control_top_tb is 
 -- Constants 
 constant sysCLK : time := 5 ns; -- 100 Mhz
 constant zbtCLK : time := 5 ns; -- 100 Mhz 
 constant vgaCLK : time := 20 ns; -- 25 Mhz 
 constant dviCLK : time := 10 ns; -- 50 Mhz 
 constant tsetup : time := 1 ns; 
 constant boardDelay : time := 1 ns; 
 -- Tieoffs in case you need them...
 signal vdd : std_logic; 
 signal gnd : std_logic_vector(63 downto 0);
 
-- component ppm_gen is 
-- generic( 
-- X_DIM : integer := 640;
-- Y_DIM : integer := 480; 
-- PATH : string := "./ppm_frames/output_frames/" 
-- ); 
-- port
-- ( 
-- pixel_clk : in std_logic;
-- enable : in std_logic; 
-- red : in std_logic_vector(7 downto 0); 
-- green : in std_logic_vector(7 downto 0);
-- blue : in std_logic_vector(7 downto 0);
-- push : in std_logic );
-- end component; 
 
 

 component cy7c1352 is
   GENERIC ( 
         -- Constant parameters 
	    addr_bits : INTEGER := 19; 
	    data_bits : INTEGER := 36;  
       -- Timing parameters for -10 (133 Mhz) 
        tCYC: TIME    := 7.5 ns; 
        tCH	: TIME    :=  2.1 ns; 
        tCL	: TIME    :=  2.1 ns; 
        tCDV: TIME    :=  6.5 ns; 
        tAS	: TIME    :=  1.5 ns; 
        tCENS: TIME    :=  1.5 ns; 
        tWES: TIME    :=  1.5 ns; 
        tDS	: TIME    :=  1.5 ns; 
        tAH	: TIME    :=  0.5 ns; 
        tCENH: TIME    :=  0.5 ns; 
        tWEH: TIME    :=  0.5 ns; 
        tDH	: TIME    :=  0.5 ns       
    ); 
     -- Port Declarations 
    PORT ( 
	Dq	: INOUT STD_LOGIC_VECTOR ((data_bits - 1) DOWNTO 0);   	-- Data I/O 
	Addr	: IN	STD_LOGIC_VECTOR ((addr_bits - 1) DOWNTO 0);   	-- Address   -- shao le yi ge bit wei zi
	Mode	: IN	STD_LOGIC := '1'; 		                      	-- Burst Mode 
	Clk	: IN	STD_LOGIC;                                      -- Clk 
	CEN_n	: IN	STD_LOGIC;                                      -- CEN# 
	AdvLd_n	: IN	STD_LOGIC;                                   -- Adv/Ld# 
	Bwa_n	: IN	STD_LOGIC;                                      -- Bwa# 
	Bwb_n	: IN	STD_LOGIC;                                      -- BWb# 
	Bwc_n	: IN	STD_LOGIC;                                      -- Bwc# 
	Bwd_n	: IN	STD_LOGIC;                                      -- BWd# 
	Rw_n	: IN	STD_LOGIC;                                      -- RW# 
	Oe_n	: IN	STD_LOGIC;                                      -- OE# 
	Ce1_n	: IN	STD_LOGIC;                                      -- CE1# 
	Ce2	: IN	STD_LOGIC;                                      -- CE2 
	Ce3_n	: IN	STD_LOGIC;                                      -- CE3# 
	Zz	   : IN	STD_LOGIC                                       -- Snooze Mode 
    ); 
end component; 
 
 
 
 component video_control_top is 
 port(
 -- Reset/Clock 
 reset : in std_logic; -- Async Reset. 
 sys_clk : in std_logic; -- System clock. 
 zbt_clk : in std_logic; -- ZBT memory clock. 
 vga_clk : in std_logic; -- Vga clock.
 -- VGA enable signals. 
 vga_enable : in std_logic; 
 -- New frame trigger signals.
 gpu_enable : in std_logic;
 -- Background
 background : in std_logic_vector(35 downto 0); 
 -- End of file 
 eof : out std_logic; 
 -- Matrix input
 matrix_we : in std_logic; 
 matrix_sel : in std_logic_vector(1 downto 0); 
 matrix_waddr : in std_logic_vector(3 downto 0); 
 matrix_wdata : in std_logic_vector(127 downto 0); 
 -- Pixel Pipe.
 x_in : in std_logic_vector(31 downto 0); 
 y_in : in std_logic_vector(31 downto 0); 
 z_in : in std_logic_vector(31 downto 0); 
 w_in : in std_logic_vector(31 downto 0);
 color : in std_logic_vector(17 downto 0);
 pix_valid : in std_logic; 
 pix_ready : out std_logic; 
 -- Clipping Maximum 
 zmax : in std_logic_vector(31 downto 0); 
 -- CPU Interface port. 
 cpu_sel : in std_logic; 
 cpu_we : in std_logic; 
 cpu_addr : in std_logic_vector(19 downto 0);
 cpu_wdata : in std_logic_vector(35 downto 0);
 cpu_wdone : out std_logic;
 cpu_dval : out std_logic; 
 cpu_rdata : out std_logic_vector(35 downto 0);
 -- ZBT interface 
 zbt_cen : out std_logic; 
 zbt_wen : out std_logic; 
 zbt_oen : out std_logic; 
 zbt_ts : out std_logic; 
 zbt_wdata : out std_logic_vector(35 downto 0); 
 zbt_addr : out std_logic_vector(17 downto 0); 
 zbt_rdata : in std_logic_vector(35 downto 0);
 -- Dvi interface signals. 
 dvi_hsync_n: out std_logic; 
 dvi_vsync_n: out std_logic; 
 dvi_data_en: out std_logic; 
 dvi_data1 : out std_logic_vector(11 downto 0); 
 dvi_data2 : out std_logic_vector(11 downto 0) 
 );
 end component; 
 
 
 
 
 
 component user_logic is
 port(
 -- Video output enable. 
 video_enable_o : out std_logic;   --  link gpu
 gpu_enable_o : out std_logic;  --  link gpu
 -- Background color 
 background_o : out std_logic_vector(35 downto 0);  --  link gpu
 -- End of file 
 eof_i : in std_logic;   --  link gpu input 
 -- Matrix Input
 matrix_we : out std_logic;   --  link gpu
 matrix_sel : out std_logic_vector(1 downto 0);   --  link gpu
 matrix_waddr : out std_logic_vector(3 downto 0);    --  link gpu
 matrix_wdata : out std_logic_vector(127 downto 0);    --  link gpu
 -- Pixel input 
 x_in_o : out std_logic_vector(31 downto 0);  --  link gpu
 y_in_o : out std_logic_vector(31 downto 0);  --  link gpu
 z_in_o : out std_logic_vector(31 downto 0);  --  link gpu
 w_in_o : out std_logic_vector(31 downto 0);  --  link gpu
 color_in_o : out std_logic_vector(17 downto 0);  --  link gpu
 point_trig_o : out std_logic;   --  link gpu
 -- ZBT DCM lock 
 zbt_dcm_lock : in std_logic;  -- --  link gpu  bu zhi dao shi she me yong de 
 -- Clipping Zmax 
 zmax_o : out std_logic_vector(31 downto 0);   --  link gpu
 -- Debug zbt memory interface.
 zbt_mbox_sel : out std_logic;  
 zbt_mbox_we : out std_logic; 
 zbt_mbox_addr : out std_logic_vector(19 downto 0);  --  link gpu zhe ge di zi  you shi bu yi yang de  ?  yu cpu de xuan zhe you guan 
 zbt_mbox_wdata : out std_logic_vector(35 downto 0);
 zbt_mbox_rdata : in std_logic_vector(35 downto 0); 
 zbt_mbox_wdone : in std_logic; 
 zbt_mbox_dval : in std_logic; 
 -- OPB interface. 
 Bus2IP_Clk : in std_logic;    -- zhe ge shi zi ji xiu gai de  yao dan xin le 
 Bus2IP_Reset : in std_logic; 
 Bus2IP_Data : in std_logic_vector(0 to 31);   --  cong gao dao di de pai xu 
 Bus2IP_BE : in std_logic_vector(0 to 3);   -- xiang xin de fu zhu fu ga bian de  zhe ge ye shi wen ti 
 Bus2IP_RdCE : in std_logic_vector(0 to 31);
 Bus2IP_WrCE : in std_logic_vector(0 to 31);
 IP2Bus_Data : out std_logic_vector(0 to 31);
 IP2Bus_RdAck : out std_logic; 
 IP2Bus_WrAck : out std_logic; 
 IP2Bus_Error : out std_logic 
-- IP2Bus_IntrEvent : out std_logic_vector(0 to 0)
 
 -- ADD USER PORTS ABOVE THIS LINE ---------------

 -- DO NOT EDIT BELOW THIS LINE ------------------
 -- Bus protocol ports, do not add to or delete 
 
 );
 end component; 
 
 signal vga_enable : std_logic; --output 
 signal gpu_enable : std_logic; -- output 
 signal background : std_logic_vector(35 downto 0); -- output 
 signal eof : std_logic; -- input 
 signal zbt_adv : std_logic; -- 
 signal zbt_addr : std_logic_vector(17 downto 0); 
 signal zbt_bwn : std_logic_vector( 1 downto 0); 
 signal zbt_wen : std_logic;
 signal zbt_oen : std_logic; 
 signal zbt_cen_i : std_logic; 
 signal zbt_ts : std_logic;     -- zbt xiang guang de  interface 
 signal zbt_zz : std_logic; 
 signal zbt_mode : std_logic; 
 signal zbt_cen : std_logic; 
 signal zbt_ce : std_logic_vector(2 downto 0);
 signal zbt_dq : std_logic_vector(35 downto 0);  -- inoutput  data bus
 signal zbt_wdata : std_logic_vector(35 downto 0); -- 
 signal zbt_rdata : std_logic_vector(35 downto 0); -- 
 signal reset : std_logic := '1';   --   reset  gao dian ping chu li 
 signal sys_clk : std_logic := '0';  
 signal zbt_clk : std_logic := '0'; 
 signal vga_clk : std_logic := '0';
 signal cpu_sel : std_logic; -- yong yu xuan zhe 
 signal cpu_we : std_logic; -- read or writer 
 signal cpu_addr : std_logic_vector(19 downto 0); -- di zi chu li 20 wei di zi  shi ji shi yong bu dao de 
 signal cpu_wdata : std_logic_vector(35 downto 0); 
 signal cpu_wdone : std_logic; 
 signal cpu_dval : std_logic; 
 signal cpu_rdata : std_logic_vector(35 downto 0); 
 signal dvi_clk : std_logic := '1'; --  div de shi zhong   ling wai de 
 signal dvi_hsync_n : std_logic;
 signal dvi_vsync_n : std_logic;
 signal dvi_data_en : std_logic;
 signal dvi_data1 : std_logic_vector(11 downto 0);
 signal dvi_data2 : std_logic_vector(11 downto 0); 
-- signal ppm_red : std_logic_vector(7 downto 0); 
-- signal ppm_green : std_logic_vector(7 downto 0);   --  zhe xie zhuan  shi bu yong de 
-- signal ppm_blue : std_logic_vector(7 downto 0); 
-- signal ppm_push : std_logic; 
 
-- type ppm_state_t is (FIRST,SECOND); 
-- signal ppm_state : ppm_state_t;


--  wu guang xin hao 

signal  Bwc_n_i : std_logic; --zbt_bwn(0),
 
signal  Bwd_n_i : std_logic;

--  yi xia wei plb zong xian xiang guang xin hao 

 signal ip_raddr : std_logic_vector(31 downto 0);   -- yong yu ip_zong xian de chu li 
 signal ip_waddr : std_logic_vector(31 downto 0); 
-- signal ip_rnw : std_logic; 
 signal ip_rack : std_logic; -- wo shou fang hui xin hao signal 
 signal ip_wack : std_logic; -- 
 signal ip_wdata : std_logic_vector(31 downto 0);
 signal ip_be : std_logic_vector(3 downto 0);  -- byte de signal de xuan zhe 
 --signal ip_cs : std_logic_vector(0 downto 0);
 signal ip_rdata : std_logic_vector(31 downto 0); -- you shi zhong xin hao de ba ? 
 
 --  yi xia  dou shi  register control yu gpu top de lian jie xian le 
 
 signal x_in : std_logic_vector(31 downto 0); 
 signal y_in : std_logic_vector(31 downto 0); 
 signal z_in : std_logic_vector(31 downto 0); 
 signal w_in : std_logic_vector(31 downto 0); 
 signal color_in : std_logic_vector(17 downto 0);
 signal point_trig : std_logic;
 signal zmax : std_logic_vector(31 downto 0); 
 signal matrix_we : std_logic; 

 signal matrix_sel : std_logic_vector(1 downto 0); 
 signal matrix_waddr : std_logic_vector(3 downto 0);
 signal matrix_wdata : std_logic_vector(127 downto 0);
 begin 
 -- Power supplies... 
 vdd <= '1';   --  1 bit 
 gnd <= (others => '0');  -- 64 bits 
 -- Clock an reset generation.
 
 sys_clk <= (not sys_clk) after sysCLK; 
 vga_clk <= (not vga_clk) after vgaCLK; 
 dvi_clk <= (not dvi_clk) after dviCLK;
 zbt_clk <= (not zbt_clk) after zbtCLK;
 reset <= '1', '0' after (sysCLK * 25);
 
 
 
 
-- process(dvi_clk,reset)
-- begin 
-- if (reset = '1') then
-- ppm_red <= (others => '0');
-- ppm_green <= (others => '0'); 
-- ppm_blue <= (others => '0'); 
-- ppm_push <= '0'; 
-- ppm_state <= FIRST;
-- elsif (dvi_clk = '1' and dvi_clk'event) then 
-- ppm_push <= '0';
-- if (dvi_data_en = '1') then 
-- if (ppm_state = FIRST) then 
-- ppm_state <= SECOND; 
-- ppm_red <= dvi_data1(7 downto 0); 
-- ppm_green(3 downto 0) <= dvi_data1(11 downto 8);
-- else ppm_state <= FIRST; 
-- ppm_green(7 downto 4) <= dvi_data2(3 downto 0); 
-- ppm_blue <= dvi_data2(11 downto 4);
-- ppm_push <= '1';
-- end if; 
-- end if; 
-- end if; 
-- end process; 
 
-- u1_genarator : ppm_gen 
-- generic map(
-- X_DIM => 640, 
-- Y_DIM => 480
-- ) 
-- port map(
-- pixel_clk => dvi_clk,
-- enable => vga_enable,
-- red => ppm_red,
-- green => ppm_green, 
-- blue => ppm_blue, 
-- push => ppm_push 
-- ); 
 
 video_control_top_0 : video_control_top 
 port map( 
 -- Reset/Clock
 reset => reset, 
 sys_clk => sys_clk, -- mei yi ge dou you zhou qi 
 zbt_clk => zbt_clk, 
 vga_clk => vga_clk, 
 -- VGA enable signals. 
 vga_enable => vga_enable, 
 -- New frame trigger signals. 
 gpu_enable => gpu_enable,  
 -- Background 
 background => background,
 -- End of frame. 
 eof => eof, -- ye shi yi ge signal 
 -- Matrix input
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
 pix_valid => point_trig, 
 pix_ready => open, 
 -- Clipping Zmax
 zmax => zmax, 
 -- CPU Interface port.
 cpu_sel => cpu_sel,
 cpu_we => cpu_we, 
 cpu_addr => cpu_addr, 
 cpu_wdata => cpu_wdata,
 cpu_wdone => cpu_wdone, 
 cpu_dval => cpu_dval, 
 cpu_rdata => cpu_rdata, 
 -- ZBT interface 
 zbt_cen => zbt_cen_i,-- yu zbt xiang guan de xin xi 
 zbt_wen => zbt_wen,  -- you ke neng hui chu cuo 
 zbt_oen => zbt_oen, 
 zbt_ts => zbt_ts, 
 zbt_wdata => zbt_wdata, 
 zbt_addr => zbt_addr, 
 zbt_rdata => zbt_rdata, 
 -- DVI interface
 dvi_hsync_n => dvi_hsync_n,
 dvi_vsync_n => dvi_vsync_n, 
 dvi_data_en => dvi_data_en, 
 dvi_data1 => dvi_data1, 
 dvi_data2 => dvi_data2 
 ); 
 
 zbt_model_0 : cy7c1352
 generic map( 
 -- Constant parameters 
 addr_bits => 18, 
 data_bits => 36, 
 -- Timing parameters for -5 (133 Mhz) 
        tCYC => 7.5 ns, 
        tCH	 => 2.1 ns, 
        tCL	 => 2.1 ns, 
        tCDV => 6.5 ns, 
        tAS	 => 1.5 ns, 
        tCENS =>1.5 ns, 
        tWES =>  1.5 ns, 
        tDS => 1.5 ns, 
        tAH	=> 0.5 ns, 
        tCENH => 0.5 ns, 
        tWEH =>  0.5 ns, 
        tDH	 =>  0.5 ns 

 )
 -- Port Declarations 
 port map(
 Dq => zbt_dq,
 Addr => zbt_addr,
 Mode => zbt_mode, 
 Clk => zbt_clk, 
 CEN_n => zbt_cen,
 -- Clock enable... 
 AdvLd_n => zbt_adv, 
 Bwa_n => zbt_bwn(0),
 Bwb_n => zbt_bwn(1),
 Bwc_n =>  Bwc_n_i, --zbt_bwn(0),
 Bwd_n =>  Bwd_n_i,--open,--zbt_bwn(1),
 Rw_n => zbt_wen,
 Oe_n => zbt_oen, 
 Ce1_n => zbt_ce(0),
 Ce2 => zbt_ce(1), 
 Ce3_n => zbt_ce(2), 
 Zz => zbt_zz 
 ); 
 -- Tristate buffer for ZBT data...
 zbt_dq <= zbt_wdata when (zbt_ts = '0') else (others => 'Z'); -- input or output   zbt_ts wei du xie xin hao 
 zbt_rdata <= zbt_dq(35 downto 0);  -- zhu yao shi jie zai yi tiao shu ju zong xian shang 
 zbt_mode <= '0'; 
 zbt_zz <= '0'; 
 zbt_ce(0) <= '0';
 zbt_ce(1) <= '1'; 
 zbt_ce(2) <= zbt_cen_i; -- zhe ge cai shi qu xuan zhe zuo yong de 
 zbt_bwn <= (others => '0'); 
 zbt_adv <= '0'; -- heng duo dou shi wai se yu frame buffer wu guang 
 zbt_cen <= '0'; 
 
 
 u_regs_if0 : user_logic 
 port map(
 -- Video output enable. 
 video_enable_o => vga_enable, 
 gpu_enable_o => gpu_enable, 
 -- Background color 
 background_o => background, 
 -- End of frame 
 eof_i => eof, 
 -- Matrix input
 matrix_we => matrix_we, 
 matrix_sel => matrix_sel, 
 matrix_waddr => matrix_waddr,
 matrix_wdata => matrix_wdata, 
 -- Vector input 
 x_in_o => x_in,
 y_in_o => y_in, 
 z_in_o => z_in,
 w_in_o => w_in, 
 color_in_o => color_in,
 point_trig_o => point_trig, 
 -- Zmax Clipping
 zmax_o => zmax,
 -- ZBT DCM lock 
 zbt_dcm_lock => '1',  -- yuan bu wei yi  zhe ge wei shu ru xin hao 
 -- Debug zbt memory interface.
 zbt_mbox_sel => cpu_sel, 
 zbt_mbox_we => cpu_we, 
 zbt_mbox_addr => cpu_addr, 
 zbt_mbox_wdata => cpu_wdata, 
 zbt_mbox_rdata => cpu_rdata, 
 zbt_mbox_wdone => cpu_wdone, 
 zbt_mbox_dval => cpu_dval,
 -- PLB interface. 
 Bus2IP_Clk => sys_clk,  -- zhe ge hai shi yu you guan
 Bus2IP_Reset => reset, 
 Bus2IP_RdCE => ip_raddr, 
 Bus2IP_WrCE => ip_waddr, 

 Bus2IP_Data => ip_wdata, 
 Bus2IP_BE => ip_be, 
 IP2Bus_Data => ip_rdata, 
 IP2Bus_RdAck => ip_rack, 
 IP2Bus_WrAck => ip_wack, 
 IP2Bus_Error => open 
  ); 

 

 
 ----- yi shang  chu le can sheng xin hao  jiu sheng lian xian le chu li 
 
 cpu_mem_write_prc : process 
 variable rslt_data : std_logic_vector(31 downto 0) := (others => '0');--
 procedure cpu_write_addr ( addr : in std_logic_vector(7 downto 0); 
                            wdata : in std_logic_vector(31 downto 0) ) is -- xiang dang yu hang shu chu li 
 begin
     
 
 
 wait until sys_clk = '0'; 
    if ( addr = x"E0") then 
 ip_waddr <= b"0000_0000_0001_0000_0000_0000_0000_0000" ; 
	 end if ;
	 if ( addr = x"E1") then 
 ip_waddr <= b"0000_0000_0000_1000_0000_0000_0000_0000" ; 
	 end if;
	  if ( addr =x"E2") then
 ip_waddr <= b"0000_0000_0000_0100_0000_0000_0000_0000" ; 
	 end if;
	 if ( addr = x"E3") then
 ip_waddr <= b"0000_0000_0000_0010_0000_0000_0000_0000" ; 
	 end if;
    if ( addr = x"E4") then
 ip_waddr <= b"0000_0000_0000_0001_0000_0000_0000_0000" ; 
	 end if;
    if ( addr = x"F0") then
    ip_waddr <= b"0000_0000_0000_0000_1000_0000_0000_0000" ;
	 end if;
    if ( addr = x"F1") then
    ip_waddr <= b"0000_0000_0000_0000_0100_0000_0000_0000" ;
	 end if;
    if ( addr = x"F2") then
    ip_waddr <= b"0000_0000_0000_0000_0010_0000_0000_0000" ;
	 end if;
	 if ( addr = x"F3") then
    ip_waddr <= b"0000_0000_0000_0000_0001_0000_0000_0000" ;
	 end if;
    if ( addr = x"F4") then
    ip_waddr <= b"0000_0000_0000_0000_0000_1000_0000_0000" ;
	 end if;
    if ( addr = x"F5") then
    ip_waddr <= b"0000_0000_0000_0000_0000_0100_0000_0000" ;
	 end if;
	 if ( addr = x"F6") then
    ip_waddr <= b"0000_0000_0000_0000_0000_0010_0000_0000" ;
	 end if;
    if ( addr = x"00") then
    ip_waddr <= b"1000_0000_0000_0000_0000_0000_0000_0000" ;
	 end if;
    if ( addr = x"01") then
    ip_waddr <= b"0100_0000_0000_0000_0000_0000_0000_0000" ;
	 end if;
    if ( addr = x"02") then
    ip_waddr <= b"0010_0000_0000_0000_0000_0000_0000_0000" ;
	 end if;
	 if ( addr = x"03") then
    ip_waddr <= b"0001_0000_0000_0000_0000_0000_0000_0000" ;
	 end if;
	 if ( addr = x"04") then 
    ip_waddr <= b"0000_1000_0000_0000_0000_0000_0000_0000" ;
	 end if;
	 if ( addr = x"05") then  
    ip_waddr <= b"0000_0100_0000_0000_0000_0000_0000_0000" ;
	 end if ;
	 if ( addr = x"D0") then  
    ip_waddr <= b"0000_0000_0010_0000_0000_0000_0000_0000" ;
	 end if ;
	

  	 if ( addr = x"06") then  
    ip_waddr <= b"0000_0010_0000_0000_0000_0000_0000_0000" ;
	 end if ;
	 if ( addr = x"07") then  
    ip_waddr <= b"0000_0001_0000_0000_0000_0000_0000_0000" ;
	 end if ;
	 if ( addr = x"08") then  
    ip_waddr <= b"0000_0000_1000_0000_0000_0000_0000_0000" ;
	 end if ;
	 if ( addr = x"09") then  
    ip_waddr <= b"0000_0000_0100_0000_0000_0000_0000_0000" ;
	 end if ;
	 if ( addr = x"23") then  
    ip_waddr <= b"0000_0000_0000_0000_0000_0001_0000_0000" ;
	 end if ;
	 

 ip_be <= (others => '1');
 --ip_cs <= "1"; 
 --ip_rnw <= '0'; 
 ip_wdata <= wdata;
 wait until (sys_clk = '0'); 
 ip_waddr <= (others => '0');
 ip_be <= (others => '0'); 
-- --ip_cs <= "0"; 
-- --ip_rnw <= '1'; 
ip_wdata <= (others => '0');
 end procedure;


 procedure cpu_read_addr (
 addr : in std_logic_vector(7 downto 0); 
 rdata : out std_logic_vector(31 downto 0) ) is 
 begin 
 

-- 
 
 wait until sys_clk = '0'; 
 --ip_raddr <= x"00000" & "00" & addr & "00"; 
 if ( addr = x"E0") then 
 ip_raddr <= b"0000_0000_0001_0000_0000_0000_0000_0000" ; 
	 end if ;
	 if ( addr = x"E1") then 
 ip_raddr <= b"0000_0000_0000_1000_0000_0000_0000_0000" ; 
	 end if;
	  if ( addr =x"E2") then
 ip_raddr <= b"0000_0000_0000_0100_0000_0000_0000_0000" ; 
	 end if;
	 if ( addr = x"E3") then
 ip_raddr <= b"0000_0000_0000_0010_0000_0000_0000_0000" ; 
	 end if;
    if ( addr = x"E4") then
 ip_raddr <= b"0000_0000_0000_0001_0000_0000_0000_0000" ; 
	 end if;
    if ( addr = x"F0") then
    ip_raddr <= b"0000_0000_0000_0000_1000_0000_0000_0000" ;
	 end if;
    if ( addr = x"F1") then
    ip_raddr <= b"0000_0000_0000_0000_0100_0000_0000_0000" ;
	 end if;
    if ( addr = x"F2") then
    ip_raddr <= b"0000_0000_0000_0000_0010_0000_0000_0000" ;
	 end if;
	 if ( addr = x"F3") then
    ip_raddr <= b"0000_0000_0000_0000_0001_0000_0000_0000" ;
	 end if;
    if ( addr = x"F4") then
    ip_raddr <= b"0000_0000_0000_0000_0000_1000_0000_0000" ;
	 end if;
    if ( addr = x"F5") then
    ip_raddr <= b"0000_0000_0000_0000_0000_0100_0000_0000" ;
	 end if;
	 if ( addr = x"F6") then
    ip_raddr <= b"0000_0000_0000_0000_0000_0010_0000_0000" ;
	 end if;
    if ( addr = x"00") then
    ip_raddr <= b"1000_0000_0000_0000_0000_0000_0000_0000" ;
	 end if;
    if ( addr = x"01") then
    ip_raddr <= b"0100_0000_0000_0000_0000_0000_0000_0000" ;
	 end if;
    if ( addr = x"02") then
    ip_raddr <= b"0010_0000_0000_0000_0000_0000_0000_0000" ;
	 end if;
	 if ( addr = x"03") then
    ip_raddr <= b"0001_0000_0000_0000_0000_0000_0000_0000" ;
	 end if;
	 if ( addr = x"04") then 
    ip_raddr <= b"0000_1000_0000_0000_0000_0000_0000_0000" ;
	 end if;
	 if ( addr = x"05") then  
    ip_raddr <= b"0000_0100_0000_0000_0000_0000_0000_0000" ;
	 end if ;
	 if ( addr = x"D0") then  
    ip_raddr <= b"0000_0000_0010_0000_0000_0000_0000_0000" ;
	 end if ;
  ip_be <= (others => '1');
 --ip_cs <= "1";
 --ip_rnw <= '1'; 
  wait until (sys_clk = '0');
 ip_raddr <= (others => '0'); 
 ip_be <= (others => '0'); 
-- ip_cs <= "0"; 
-- ip_rnw <= '1';
 rdata := ip_rdata;
 end procedure;
 
 
 
 
 begin 
 -- Initial conditions 
 -- Wait for reset 
 wait until reset = '0'; 
 wait until sys_clk = '0';
 -- Read Id. 
 cpu_read_addr(x"00",rslt_data);
 -- Write and read scratch register. 
 cpu_write_addr(x"01",x"1234abcd"); 
 cpu_read_addr(x"01",rslt_data);

 -- Write in a screen.
 for y in 0 to 239 loop 
 for x in 0 to 319 loop 
 cpu_write_addr(x"08",x"ffffffff");
 cpu_write_addr(x"09",x"0000000f");
 cpu_write_addr(x"06",conv_std_logic_vector((x+(y*320))*4,32)); 
 cpu_write_addr(x"23",x"00000001"); 
 cpu_write_addr(x"23",x"00000000"); 
-- wait;
 end loop; 
 end loop;
 
 cpu_write_addr(x"03",x"00000001"); 
  wait ;
 -- Write background register 
 cpu_write_addr(x"04",x"0000003F");
 cpu_write_addr(x"05",x"00000000"); 
 -- Zmax register 
 cpu_write_addr(x"D0",x"BDCCCCCC"); 
 -- Setup Default World translation to view coordinates matrix values. 
 cpu_write_addr(x"F6",x"00000000"); 
 cpu_write_addr(x"E0",x"3F800000");
 cpu_write_addr(x"E1",x"00000000"); 
 cpu_write_addr(x"E2",x"00000000"); 
 cpu_write_addr(x"E3",x"00000000"); 
 cpu_write_addr(x"E4",x"00000010"); 
 cpu_write_addr(x"F6",x"00000001"); 
 cpu_write_addr(x"F6",x"00000000"); 
 
    -- wait ;
 
 cpu_write_addr(x"E0",x"00000000"); 
 cpu_write_addr(x"E1",x"3F800000"); 
 cpu_write_addr(x"E2",x"00000000"); 
 cpu_write_addr(x"E3",x"00000000"); 
 cpu_write_addr(x"E4",x"00000011"); 
 cpu_write_addr(x"F6",x"00000001"); 
 cpu_write_addr(x"F6",x"00000000");
 
 
 cpu_write_addr(x"E0",x"00000000"); 
 cpu_write_addr(x"E1",x"00000000"); 
 cpu_write_addr(x"E2",x"3F800000"); 
 cpu_write_addr(x"E3",x"00000000"); 
 cpu_write_addr(x"E4",x"00000012");
 cpu_write_addr(x"F6",x"00000001"); 
 cpu_write_addr(x"F6",x"00000000");
 
 cpu_write_addr(x"E0",x"00000000"); 
 cpu_write_addr(x"E1",x"00000000"); 
 cpu_write_addr(x"E2",x"00000000");
 cpu_write_addr(x"E3",x"3F800000");
 cpu_write_addr(x"E4",x"00000013"); 
 cpu_write_addr(x"F6",x"00000001"); 
 cpu_write_addr(x"F6",x"00000000");
 -- Setup Projection translation to screen coordinates matrix values. 
 cpu_write_addr(x"E0",x"431F8000");
 cpu_write_addr(x"E1",x"00000000");
 cpu_write_addr(x"E2",x"00000000"); 
 cpu_write_addr(x"E3",x"431f8000"); 
 cpu_write_addr(x"E4",x"0000001C"); 
 cpu_write_addr(x"F6",x"00000001"); 
 cpu_write_addr(x"F6",x"00000000");
 
 cpu_write_addr(x"E0",x"00000000"); 
 cpu_write_addr(x"E1",x"42EF0000"); 
 cpu_write_addr(x"E2",x"00000000"); 
 cpu_write_addr(x"E3",x"42EF0000"); 
 cpu_write_addr(x"E4",x"0000001D");

 cpu_write_addr(x"F6",x"00000001"); 
 cpu_write_addr(x"F6",x"00000000"); 
 
 
 cpu_write_addr(x"E0",x"00000000");
 cpu_write_addr(x"E1",x"00000000"); 
 cpu_write_addr(x"E2",x"3F800000"); 
 cpu_write_addr(x"E3",x"00000000");
 cpu_write_addr(x"E4",x"0000001E"); 
 
 cpu_write_addr(x"F6",x"00000001"); 
 cpu_write_addr(x"F6",x"00000000");
 
 cpu_write_addr(x"E0",x"00000000");
 cpu_write_addr(x"E1",x"00000000"); 
 cpu_write_addr(x"E2",x"00000000"); 
 cpu_write_addr(x"E3",x"3F800000");
 cpu_write_addr(x"E4",x"0000001F"); 
 cpu_write_addr(x"F6",x"00000001"); 
 cpu_write_addr(x"F6",x"00000000");
 
 -- Enable GPU engine. 
 cpu_write_addr(x"03",x"00000002"); 
 -- Enable VGA engine. 
 cpu_write_addr(x"03",x"00000003"); 
  --  wait;
 -- Draw a triangle
 --while (true) loop 
 -- Wait for end of frame. 
   wait until eof = '1'; 
 -- Setup Default View translation to screen coordinates matrix values. 
 cpu_write_addr(x"E0",x"3F800000"); --  
 cpu_write_addr(x"E1",x"00000000");
 cpu_write_addr(x"E2",x"00000000"); 
 cpu_write_addr(x"E3",x"00000000"); 
 cpu_write_addr(x"E4",x"00000014"); 
 cpu_write_addr(x"F6",x"00000001"); 
 cpu_write_addr(x"F6",x"00000000");
  -- wait;
 cpu_write_addr(x"E0",x"00000000"); 
 cpu_write_addr(x"E1",x"3F800000");
 cpu_write_addr(x"E2",x"00000000"); 
 cpu_write_addr(x"E3",x"00000000"); 
 cpu_write_addr(x"E4",x"00000015"); 
 cpu_write_addr(x"F6",x"00000001"); 
 cpu_write_addr(x"F6",x"00000000");
 
 cpu_write_addr(x"E0",x"00000000"); 
 cpu_write_addr(x"E1",x"00000000"); 
 cpu_write_addr(x"E2",x"3F800000"); 
 cpu_write_addr(x"E3",x"00000000");
 cpu_write_addr(x"E4",x"00000016");
 
 cpu_write_addr(x"F6",x"00000001"); 
 cpu_write_addr(x"F6",x"00000000");
 
 cpu_write_addr(x"E0",x"00000000"); 
 cpu_write_addr(x"E1",x"00000000");
 cpu_write_addr(x"E2",x"00000000");
 cpu_write_addr(x"E3",x"3F800000"); 
 cpu_write_addr(x"E4",x"00000017");
 
 cpu_write_addr(x"F6",x"00000001"); 
 cpu_write_addr(x"F6",x"00000000");
 
 -- Setup Default View translation to screen coordinates matrix values. 
 cpu_write_addr(x"E0",x"3F800000");
 cpu_write_addr(x"E1",x"00000000"); 
 cpu_write_addr(x"E2",x"00000000"); 
 cpu_write_addr(x"E3",x"00000000");
 cpu_write_addr(x"E4",x"00000018");
 cpu_write_addr(x"F6",x"00000001"); 
 cpu_write_addr(x"F6",x"00000000");
 
 
 cpu_write_addr(x"E0",x"00000000"); 
 cpu_write_addr(x"E1",x"3F800000");
 cpu_write_addr(x"E2",x"00000000");
 cpu_write_addr(x"E3",x"00000000"); 
 cpu_write_addr(x"E4",x"00000019");
 
 cpu_write_addr(x"F6",x"00000001"); 
 cpu_write_addr(x"F6",x"00000000");
 
 
 cpu_write_addr(x"E0",x"00000000"); 
 cpu_write_addr(x"E1",x"00000000"); 
 cpu_write_addr(x"E2",x"3F800000");
 cpu_write_addr(x"E3",x"00000000");
 cpu_write_addr(x"E4",x"0000001A"); 
 cpu_write_addr(x"F6",x"00000001"); 
 cpu_write_addr(x"F6",x"00000000");
 
 
 cpu_write_addr(x"E0",x"00000000"); 
 cpu_write_addr(x"E1",x"00000000");
 cpu_write_addr(x"E2",x"3F800000"); 
 cpu_write_addr(x"E3",x"00000000"); 
 cpu_write_addr(x"E4",x"0000001B");
 
 cpu_write_addr(x"F6",x"00000001"); 
 cpu_write_addr(x"F6",x"00000000");
 
 -- Setup Default World translation to screen coordinates matrix values. 
 cpu_write_addr(x"E0",x"3F800000");
 cpu_write_addr(x"E1",x"00000000");
 cpu_write_addr(x"E2",x"00000000"); 
 cpu_write_addr(x"E3",x"00000000"); 
 cpu_write_addr(x"E4",x"00000010"); 
 
 cpu_write_addr(x"F6",x"00000001"); 
 cpu_write_addr(x"F6",x"00000000");
 
 cpu_write_addr(x"E0",x"00000000"); 
 cpu_write_addr(x"E1",x"3F800000");
 cpu_write_addr(x"E2",x"00000000"); 
 cpu_write_addr(x"E3",x"00000000");
 cpu_write_addr(x"E4",x"00000011"); 
 cpu_write_addr(x"F6",x"00000001"); 
 cpu_write_addr(x"F6",x"00000000");
 
 cpu_write_addr(x"E0",x"00000000");
 cpu_write_addr(x"E1",x"00000000"); 
 cpu_write_addr(x"E2",x"3F800000");  
 cpu_write_addr(x"E3",x"00000000");
 cpu_write_addr(x"E4",x"00000012");
 cpu_write_addr(x"F6",x"00000001"); 
 cpu_write_addr(x"F6",x"00000000");
 
 cpu_write_addr(x"E0",x"00000000"); 
 cpu_write_addr(x"E1",x"00000000"); 
 cpu_write_addr(x"E2",x"00000000"); 
 cpu_write_addr(x"E3",x"3F800000");
 cpu_write_addr(x"E4",x"00000013"); 
 
 cpu_write_addr(x"F6",x"00000001"); 
 cpu_write_addr(x"F6",x"00000000");
 -- Draw Cube 
 cpu_write_addr(x"F0",x"BE800000");
 cpu_write_addr(x"F1",x"BE800000"); 
 cpu_write_addr(x"F2",x"BE800000"); 
 cpu_write_addr(x"F3",x"3F800000");
 cpu_write_addr(x"F4",x"0003FFFF");
 cpu_write_addr(x"F5",x"00000001"); 
 cpu_write_addr(x"F5",x"00000000"); 
   --wait ;
 cpu_write_addr(x"F0",x"BE800000");
 cpu_write_addr(x"F1",x"3E800000"); 
 cpu_write_addr(x"F2",x"BE800000");
 cpu_write_addr(x"F3",x"3F800000");
 cpu_write_addr(x"F4",x"0003FFFF"); 
 cpu_write_addr(x"F5",x"00000001");
 cpu_write_addr(x"F5",x"00000000");  
		--wait 
 cpu_write_addr(x"F0",x"BE800000"); 
 cpu_write_addr(x"F1",x"3E800000"); 
 cpu_write_addr(x"F2",x"BE800000"); 
 cpu_write_addr(x"F3",x"3F800000"); 
 cpu_write_addr(x"F4",x"0003FFFF"); 
 cpu_write_addr(x"F5",x"00000001"); 
 cpu_write_addr(x"F5",x"00000000"); 
 
 cpu_write_addr(x"F0",x"3E800000"); 
 cpu_write_addr(x"F1",x"3E800000"); 
 cpu_write_addr(x"F2",x"BE800000"); 
 cpu_write_addr(x"F3",x"3F800000");
 cpu_write_addr(x"F4",x"0003FFFF"); 
 cpu_write_addr(x"F5",x"00000001"); 
 cpu_write_addr(x"F5",x"00000000"); 
    --  wait ;
 cpu_write_addr(x"F0",x"3E800000"); 
 cpu_write_addr(x"F1",x"3E800000");
 cpu_write_addr(x"F2",x"BE800000");
 cpu_write_addr(x"F3",x"3F800000"); 
 cpu_write_addr(x"F4",x"0003FFFF"); 
 cpu_write_addr(x"F5",x"00000001");
 cpu_write_addr(x"F5",x"00000000");  
 cpu_write_addr(x"F0",x"3E800000");  
 cpu_write_addr(x"F1",x"BE800000"); 
 cpu_write_addr(x"F2",x"BE800000"); 
 cpu_write_addr(x"F3",x"3F800000"); 
 cpu_write_addr(x"F4",x"0003FFFF"); 
 cpu_write_addr(x"F5",x"00000001"); 
 cpu_write_addr(x"F5",x"00000000"); 
        wait ;
 cpu_write_addr(x"F0",x"3E800000");
 cpu_write_addr(x"F1",x"BE800000"); 
 cpu_write_addr(x"F2",x"BE800000"); 
 cpu_write_addr(x"F3",x"3F800000"); 
 cpu_write_addr(x"F4",x"0003FFFF"); 
 cpu_write_addr(x"F5",x"00000001");
 cpu_write_addr(x"F0",x"BE800000"); 
 cpu_write_addr(x"F1",x"BE800000"); 
 cpu_write_addr(x"F2",x"BE800000"); 
 cpu_write_addr(x"F3",x"3F800000"); 
 cpu_write_addr(x"F4",x"0003FFFF"); 
 cpu_write_addr(x"F5",x"00000001");
 cpu_write_addr(x"F0",x"BE800000");
 cpu_write_addr(x"F1",x"BE800000");
 cpu_write_addr(x"F2",x"BF400000");
 cpu_write_addr(x"F3",x"3F800000"); 
 cpu_write_addr(x"F4",x"0003FFFF"); 
 cpu_write_addr(x"F5",x"00000001"); 
 cpu_write_addr(x"F0",x"BE800000");
 cpu_write_addr(x"F1",x"3E800000"); 
 cpu_write_addr(x"F2",x"BF400000"); 
 cpu_write_addr(x"F3",x"3F800000"); 
 cpu_write_addr(x"F4",x"0003FFFF"); 
 cpu_write_addr(x"F5",x"00000001");
 cpu_write_addr(x"F0",x"BE800000");
 cpu_write_addr(x"F1",x"3E800000"); 
 cpu_write_addr(x"F2",x"BF400000");
 cpu_write_addr(x"F3",x"3F800000");
 cpu_write_addr(x"F4",x"0003FFFF");
 cpu_write_addr(x"F5",x"00000001");
 cpu_write_addr(x"F0",x"3E800000"); 
 cpu_write_addr(x"F1",x"3E800000"); 
 cpu_write_addr(x"F2",x"BF400000");
 cpu_write_addr(x"F3",x"3F800000"); 
 cpu_write_addr(x"F4",x"0003FFFF"); 
 cpu_write_addr(x"F5",x"00000001");
 cpu_write_addr(x"F0",x"3E800000");
 cpu_write_addr(x"F1",x"3E800000");
 cpu_write_addr(x"F2",x"BF400000");
 cpu_write_addr(x"F3",x"3F800000"); 
 cpu_write_addr(x"F4",x"0003FFFF"); 
 cpu_write_addr(x"F5",x"00000001"); 
 cpu_write_addr(x"F0",x"3E800000"); 
 cpu_write_addr(x"F1",x"BE800000"); 
 cpu_write_addr(x"F2",x"BF400000"); 
 cpu_write_addr(x"F3",x"3F800000"); 
 cpu_write_addr(x"F4",x"0003FFFF");
 cpu_write_addr(x"F5",x"00000001");
 cpu_write_addr(x"F0",x"3E800000");
 cpu_write_addr(x"F1",x"BE800000");
 cpu_write_addr(x"F2",x"BF400000"); 
 cpu_write_addr(x"F3",x"3F800000");
 cpu_write_addr(x"F4",x"0003FFFF"); 
 cpu_write_addr(x"F5",x"00000001");
 cpu_write_addr(x"F0",x"BE800000");
 cpu_write_addr(x"F1",x"BE800000");
 cpu_write_addr(x"F2",x"BF400000");
 cpu_write_addr(x"F3",x"3F800000");
 cpu_write_addr(x"F4",x"0003FFFF");
 cpu_write_addr(x"F5",x"00000001");
 cpu_write_addr(x"F0",x"BE800000");
 cpu_write_addr(x"F1",x"BE800000");
 cpu_write_addr(x"F2",x"BE800000");
 cpu_write_addr(x"F3",x"3F800000"); 
 cpu_write_addr(x"F4",x"0003FFFF");
 cpu_write_addr(x"F5",x"00000001"); 
 cpu_write_addr(x"F0",x"BE800000"); 
 cpu_write_addr(x"F1",x"BE800000"); 
 cpu_write_addr(x"F2",x"BF400000"); 
 cpu_write_addr(x"F3",x"3F800000"); 
 cpu_write_addr(x"F4",x"0003FFFF"); 
 cpu_write_addr(x"F5",x"00000001"); 
 cpu_write_addr(x"F0",x"BE800000"); 
 cpu_write_addr(x"F1",x"3E800000"); 
 cpu_write_addr(x"F2",x"BE800000"); 
 cpu_write_addr(x"F3",x"3F800000"); 
 cpu_write_addr(x"F4",x"0003FFFF"); 
 cpu_write_addr(x"F5",x"00000001"); 
 cpu_write_addr(x"F0",x"BE800000"); 
 cpu_write_addr(x"F1",x"3E800000"); 
 cpu_write_addr(x"F2",x"BF400000"); 
 cpu_write_addr(x"F3",x"3F800000"); 
 cpu_write_addr(x"F4",x"0003FFFF"); 
 cpu_write_addr(x"F5",x"00000001"); 
 cpu_write_addr(x"F0",x"3E800000"); 
 cpu_write_addr(x"F1",x"3E800000"); 
 cpu_write_addr(x"F2",x"BE800000"); 
 cpu_write_addr(x"F3",x"3F800000"); 
 cpu_write_addr(x"F4",x"0003FFFF"); 
 cpu_write_addr(x"F5",x"00000001"); 
 cpu_write_addr(x"F0",x"3E800000"); 
 cpu_write_addr(x"F1",x"3E800000");
 cpu_write_addr(x"F2",x"BF400000");
 cpu_write_addr(x"F3",x"3F800000");
 cpu_write_addr(x"F4",x"0003FFFF");
 cpu_write_addr(x"F5",x"00000001"); 
 cpu_write_addr(x"F0",x"3E800000"); 
 cpu_write_addr(x"F1",x"BE800000"); 
 cpu_write_addr(x"F2",x"BE800000"); 
 cpu_write_addr(x"F3",x"3F800000"); 
 cpu_write_addr(x"F4",x"0003FFFF");
 cpu_write_addr(x"F5",x"00000001");
 cpu_write_addr(x"F0",x"3E800000");
 cpu_write_addr(x"F1",x"BE800000");
 cpu_write_addr(x"F2",x"BF400000");
 cpu_write_addr(x"F3",x"3F800000");
 cpu_write_addr(x"F4",x"0003FFFF");
 cpu_write_addr(x"F5",x"00000001");
 --end loop; 
 wait;
 end process; 
 end architecture test;
 

