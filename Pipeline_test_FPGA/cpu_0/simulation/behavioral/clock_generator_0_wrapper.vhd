-------------------------------------------------------------------------------
-- clock_generator_0_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library clock_generator_v2_01_a;
use clock_generator_v2_01_a.all;

entity clock_generator_0_wrapper is
  port (
    CLKIN : in std_logic;
    CLKFBIN : in std_logic;
    CLKOUT0 : out std_logic;
    CLKOUT1 : out std_logic;
    CLKOUT2 : out std_logic;
    CLKOUT3 : out std_logic;
    CLKOUT4 : out std_logic;
    CLKOUT5 : out std_logic;
    CLKOUT6 : out std_logic;
    CLKOUT7 : out std_logic;
    CLKOUT8 : out std_logic;
    CLKOUT9 : out std_logic;
    CLKOUT10 : out std_logic;
    CLKOUT11 : out std_logic;
    CLKOUT12 : out std_logic;
    CLKOUT13 : out std_logic;
    CLKOUT14 : out std_logic;
    CLKOUT15 : out std_logic;
    CLKFBOUT : out std_logic;
    RST : in std_logic;
    LOCKED : out std_logic
  );
end clock_generator_0_wrapper;

architecture STRUCTURE of clock_generator_0_wrapper is

  component clock_generator is
    generic (
      C_FAMILY : STRING;
      C_EXT_RESET_HIGH : INTEGER;
      C_CLK_GEN : INTEGER;
      C_NUM_PLL : INTEGER;
      C_NUM_DCM : INTEGER;
      C_CLKOUT0_MODULE : STRING;
      C_CLKOUT0_PORT : STRING;
      C_CLKOUT1_MODULE : STRING;
      C_CLKOUT1_PORT : STRING;
      C_CLKOUT2_MODULE : STRING;
      C_CLKOUT2_PORT : STRING;
      C_CLKOUT3_MODULE : STRING;
      C_CLKOUT3_PORT : STRING;
      C_CLKOUT4_MODULE : STRING;
      C_CLKOUT4_PORT : STRING;
      C_CLKOUT5_MODULE : STRING;
      C_CLKOUT5_PORT : STRING;
      C_CLKOUT6_MODULE : STRING;
      C_CLKOUT6_PORT : STRING;
      C_CLKOUT7_MODULE : STRING;
      C_CLKOUT7_PORT : STRING;
      C_CLKOUT8_MODULE : STRING;
      C_CLKOUT8_PORT : STRING;
      C_CLKOUT9_MODULE : STRING;
      C_CLKOUT9_PORT : STRING;
      C_CLKOUT10_MODULE : STRING;
      C_CLKOUT10_PORT : STRING;
      C_CLKOUT11_MODULE : STRING;
      C_CLKOUT11_PORT : STRING;
      C_CLKOUT12_MODULE : STRING;
      C_CLKOUT12_PORT : STRING;
      C_CLKOUT13_MODULE : STRING;
      C_CLKOUT13_PORT : STRING;
      C_CLKOUT14_MODULE : STRING;
      C_CLKOUT14_PORT : STRING;
      C_CLKOUT15_MODULE : STRING;
      C_CLKOUT15_PORT : STRING;
      C_CLKFBOUT_MODULE : STRING;
      C_CLKFBOUT_PORT : STRING;
      C_PLL0_DIVCLK_DIVIDE : INTEGER;
      C_PLL0_CLKFBOUT_MULT : INTEGER;
      C_PLL0_CLKFBOUT_PHASE : REAL;
      C_PLL0_CLKIN1_PERIOD : REAL;
      C_PLL0_CLKOUT0_DIVIDE : INTEGER;
      C_PLL0_CLKOUT0_DUTY_CYCLE : REAL;
      C_PLL0_CLKOUT0_PHASE : REAL;
      C_PLL0_CLKOUT1_DIVIDE : INTEGER;
      C_PLL0_CLKOUT1_DUTY_CYCLE : REAL;
      C_PLL0_CLKOUT1_PHASE : REAL;
      C_PLL0_CLKOUT2_DIVIDE : INTEGER;
      C_PLL0_CLKOUT2_DUTY_CYCLE : REAL;
      C_PLL0_CLKOUT2_PHASE : REAL;
      C_PLL0_CLKOUT3_DIVIDE : INTEGER;
      C_PLL0_CLKOUT3_DUTY_CYCLE : REAL;
      C_PLL0_CLKOUT3_PHASE : REAL;
      C_PLL0_CLKOUT4_DIVIDE : INTEGER;
      C_PLL0_CLKOUT4_DUTY_CYCLE : REAL;
      C_PLL0_CLKOUT4_PHASE : REAL;
      C_PLL0_CLKOUT5_DIVIDE : INTEGER;
      C_PLL0_CLKOUT5_DUTY_CYCLE : REAL;
      C_PLL0_CLKOUT5_PHASE : REAL;
      C_PLL0_BANDWIDTH : STRING;
      C_PLL0_COMPENSATION : STRING;
      C_PLL0_REF_JITTER : REAL;
      C_PLL0_RESET_ON_LOSS_OF_LOCK : BOOLEAN;
      C_PLL0_RST_DEASSERT_CLK : STRING;
      C_PLL0_EXT_RESET_HIGH : INTEGER;
      C_PLL0_FAMILY : STRING;
      C_PLL0_CLKOUT0_DESKEW_ADJUST : STRING;
      C_PLL0_CLKOUT1_DESKEW_ADJUST : STRING;
      C_PLL0_CLKOUT2_DESKEW_ADJUST : STRING;
      C_PLL0_CLKOUT3_DESKEW_ADJUST : STRING;
      C_PLL0_CLKOUT4_DESKEW_ADJUST : STRING;
      C_PLL0_CLKOUT5_DESKEW_ADJUST : STRING;
      C_PLL0_CLKFBOUT_DESKEW_ADJUST : STRING;
      C_PLL0_CLKIN1_BUF : BOOLEAN;
      C_PLL0_CLKFBOUT_BUF : BOOLEAN;
      C_PLL0_CLKOUT0_BUF : BOOLEAN;
      C_PLL0_CLKOUT1_BUF : BOOLEAN;
      C_PLL0_CLKOUT2_BUF : BOOLEAN;
      C_PLL0_CLKOUT3_BUF : BOOLEAN;
      C_PLL0_CLKOUT4_BUF : BOOLEAN;
      C_PLL0_CLKOUT5_BUF : BOOLEAN;
      C_PLL0_CLKIN1_MODULE : STRING;
      C_PLL0_CLKIN1_PORT : STRING;
      C_PLL0_CLKFBIN_MODULE : STRING;
      C_PLL0_CLKFBIN_PORT : STRING;
      C_PLL0_RST_MODULE : STRING;
      C_PLL1_DIVCLK_DIVIDE : INTEGER;
      C_PLL1_CLKFBOUT_MULT : INTEGER;
      C_PLL1_CLKFBOUT_PHASE : REAL;
      C_PLL1_CLKIN1_PERIOD : REAL;
      C_PLL1_CLKOUT0_DIVIDE : INTEGER;
      C_PLL1_CLKOUT0_DUTY_CYCLE : REAL;
      C_PLL1_CLKOUT0_PHASE : REAL;
      C_PLL1_CLKOUT1_DIVIDE : INTEGER;
      C_PLL1_CLKOUT1_DUTY_CYCLE : REAL;
      C_PLL1_CLKOUT1_PHASE : REAL;
      C_PLL1_CLKOUT2_DIVIDE : INTEGER;
      C_PLL1_CLKOUT2_DUTY_CYCLE : REAL;
      C_PLL1_CLKOUT2_PHASE : REAL;
      C_PLL1_CLKOUT3_DIVIDE : INTEGER;
      C_PLL1_CLKOUT3_DUTY_CYCLE : REAL;
      C_PLL1_CLKOUT3_PHASE : REAL;
      C_PLL1_CLKOUT4_DIVIDE : INTEGER;
      C_PLL1_CLKOUT4_DUTY_CYCLE : REAL;
      C_PLL1_CLKOUT4_PHASE : REAL;
      C_PLL1_CLKOUT5_DIVIDE : INTEGER;
      C_PLL1_CLKOUT5_DUTY_CYCLE : REAL;
      C_PLL1_CLKOUT5_PHASE : REAL;
      C_PLL1_BANDWIDTH : STRING;
      C_PLL1_COMPENSATION : STRING;
      C_PLL1_REF_JITTER : REAL;
      C_PLL1_RESET_ON_LOSS_OF_LOCK : BOOLEAN;
      C_PLL1_RST_DEASSERT_CLK : STRING;
      C_PLL1_EXT_RESET_HIGH : INTEGER;
      C_PLL1_FAMILY : STRING;
      C_PLL1_CLKOUT0_DESKEW_ADJUST : STRING;
      C_PLL1_CLKOUT1_DESKEW_ADJUST : STRING;
      C_PLL1_CLKOUT2_DESKEW_ADJUST : STRING;
      C_PLL1_CLKOUT3_DESKEW_ADJUST : STRING;
      C_PLL1_CLKOUT4_DESKEW_ADJUST : STRING;
      C_PLL1_CLKOUT5_DESKEW_ADJUST : STRING;
      C_PLL1_CLKFBOUT_DESKEW_ADJUST : STRING;
      C_PLL1_CLKIN1_BUF : BOOLEAN;
      C_PLL1_CLKFBOUT_BUF : BOOLEAN;
      C_PLL1_CLKOUT0_BUF : BOOLEAN;
      C_PLL1_CLKOUT1_BUF : BOOLEAN;
      C_PLL1_CLKOUT2_BUF : BOOLEAN;
      C_PLL1_CLKOUT3_BUF : BOOLEAN;
      C_PLL1_CLKOUT4_BUF : BOOLEAN;
      C_PLL1_CLKOUT5_BUF : BOOLEAN;
      C_PLL1_CLKIN1_MODULE : STRING;
      C_PLL1_CLKIN1_PORT : STRING;
      C_PLL1_CLKFBIN_MODULE : STRING;
      C_PLL1_CLKFBIN_PORT : STRING;
      C_PLL1_RST_MODULE : STRING;
      C_DCM0_DFS_FREQUENCY_MODE : STRING;
      C_DCM0_DLL_FREQUENCY_MODE : STRING;
      C_DCM0_DUTY_CYCLE_CORRECTION : BOOLEAN;
      C_DCM0_CLKIN_DIVIDE_BY_2 : BOOLEAN;
      C_DCM0_CLK_FEEDBACK : STRING;
      C_DCM0_CLKOUT_PHASE_SHIFT : STRING;
      C_DCM0_DSS_MODE : STRING;
      C_DCM0_STARTUP_WAIT : BOOLEAN;
      C_DCM0_PHASE_SHIFT : INTEGER;
      C_DCM0_CLKFX_MULTIPLY : INTEGER;
      C_DCM0_CLKFX_DIVIDE : INTEGER;
      C_DCM0_CLKDV_DIVIDE : REAL;
      C_DCM0_CLKIN_PERIOD : REAL;
      C_DCM0_DESKEW_ADJUST : STRING;
      C_DCM0_CLKIN_BUF : BOOLEAN;
      C_DCM0_CLKFB_BUF : BOOLEAN;
      C_DCM0_CLK0_BUF : BOOLEAN;
      C_DCM0_CLK90_BUF : BOOLEAN;
      C_DCM0_CLK180_BUF : BOOLEAN;
      C_DCM0_CLK270_BUF : BOOLEAN;
      C_DCM0_CLKDV_BUF : BOOLEAN;
      C_DCM0_CLKDV180_BUF : BOOLEAN;
      C_DCM0_CLK2X_BUF : BOOLEAN;
      C_DCM0_CLK2X180_BUF : BOOLEAN;
      C_DCM0_CLKFX_BUF : BOOLEAN;
      C_DCM0_CLKFX180_BUF : BOOLEAN;
      C_DCM0_EXT_RESET_HIGH : INTEGER;
      C_DCM0_FAMILY : STRING;
      C_DCM0_CLKIN_MODULE : STRING;
      C_DCM0_CLKIN_PORT : STRING;
      C_DCM0_CLKFB_MODULE : STRING;
      C_DCM0_CLKFB_PORT : STRING;
      C_DCM0_RST_MODULE : STRING;
      C_DCM1_DFS_FREQUENCY_MODE : STRING;
      C_DCM1_DLL_FREQUENCY_MODE : STRING;
      C_DCM1_DUTY_CYCLE_CORRECTION : BOOLEAN;
      C_DCM1_CLKIN_DIVIDE_BY_2 : BOOLEAN;
      C_DCM1_CLK_FEEDBACK : STRING;
      C_DCM1_CLKOUT_PHASE_SHIFT : STRING;
      C_DCM1_DSS_MODE : STRING;
      C_DCM1_STARTUP_WAIT : BOOLEAN;
      C_DCM1_PHASE_SHIFT : INTEGER;
      C_DCM1_CLKFX_MULTIPLY : INTEGER;
      C_DCM1_CLKFX_DIVIDE : INTEGER;
      C_DCM1_CLKDV_DIVIDE : REAL;
      C_DCM1_CLKIN_PERIOD : REAL;
      C_DCM1_DESKEW_ADJUST : STRING;
      C_DCM1_CLKIN_BUF : BOOLEAN;
      C_DCM1_CLKFB_BUF : BOOLEAN;
      C_DCM1_CLK0_BUF : BOOLEAN;
      C_DCM1_CLK90_BUF : BOOLEAN;
      C_DCM1_CLK180_BUF : BOOLEAN;
      C_DCM1_CLK270_BUF : BOOLEAN;
      C_DCM1_CLKDV_BUF : BOOLEAN;
      C_DCM1_CLKDV180_BUF : BOOLEAN;
      C_DCM1_CLK2X_BUF : BOOLEAN;
      C_DCM1_CLK2X180_BUF : BOOLEAN;
      C_DCM1_CLKFX_BUF : BOOLEAN;
      C_DCM1_CLKFX180_BUF : BOOLEAN;
      C_DCM1_EXT_RESET_HIGH : INTEGER;
      C_DCM1_FAMILY : STRING;
      C_DCM1_CLKIN_MODULE : STRING;
      C_DCM1_CLKIN_PORT : STRING;
      C_DCM1_CLKFB_MODULE : STRING;
      C_DCM1_CLKFB_PORT : STRING;
      C_DCM1_RST_MODULE : STRING;
      C_DCM2_DFS_FREQUENCY_MODE : STRING;
      C_DCM2_DLL_FREQUENCY_MODE : STRING;
      C_DCM2_DUTY_CYCLE_CORRECTION : BOOLEAN;
      C_DCM2_CLKIN_DIVIDE_BY_2 : BOOLEAN;
      C_DCM2_CLK_FEEDBACK : STRING;
      C_DCM2_CLKOUT_PHASE_SHIFT : STRING;
      C_DCM2_DSS_MODE : STRING;
      C_DCM2_STARTUP_WAIT : BOOLEAN;
      C_DCM2_PHASE_SHIFT : INTEGER;
      C_DCM2_CLKFX_MULTIPLY : INTEGER;
      C_DCM2_CLKFX_DIVIDE : INTEGER;
      C_DCM2_CLKDV_DIVIDE : REAL;
      C_DCM2_CLKIN_PERIOD : REAL;
      C_DCM2_DESKEW_ADJUST : STRING;
      C_DCM2_CLKIN_BUF : BOOLEAN;
      C_DCM2_CLKFB_BUF : BOOLEAN;
      C_DCM2_CLK0_BUF : BOOLEAN;
      C_DCM2_CLK90_BUF : BOOLEAN;
      C_DCM2_CLK180_BUF : BOOLEAN;
      C_DCM2_CLK270_BUF : BOOLEAN;
      C_DCM2_CLKDV_BUF : BOOLEAN;
      C_DCM2_CLKDV180_BUF : BOOLEAN;
      C_DCM2_CLK2X_BUF : BOOLEAN;
      C_DCM2_CLK2X180_BUF : BOOLEAN;
      C_DCM2_CLKFX_BUF : BOOLEAN;
      C_DCM2_CLKFX180_BUF : BOOLEAN;
      C_DCM2_EXT_RESET_HIGH : INTEGER;
      C_DCM2_FAMILY : STRING;
      C_DCM2_CLKIN_MODULE : STRING;
      C_DCM2_CLKIN_PORT : STRING;
      C_DCM2_CLKFB_MODULE : STRING;
      C_DCM2_CLKFB_PORT : STRING;
      C_DCM2_RST_MODULE : STRING;
      C_DCM3_DFS_FREQUENCY_MODE : STRING;
      C_DCM3_DLL_FREQUENCY_MODE : STRING;
      C_DCM3_DUTY_CYCLE_CORRECTION : BOOLEAN;
      C_DCM3_CLKIN_DIVIDE_BY_2 : BOOLEAN;
      C_DCM3_CLK_FEEDBACK : STRING;
      C_DCM3_CLKOUT_PHASE_SHIFT : STRING;
      C_DCM3_DSS_MODE : STRING;
      C_DCM3_STARTUP_WAIT : BOOLEAN;
      C_DCM3_PHASE_SHIFT : INTEGER;
      C_DCM3_CLKFX_MULTIPLY : INTEGER;
      C_DCM3_CLKFX_DIVIDE : INTEGER;
      C_DCM3_CLKDV_DIVIDE : REAL;
      C_DCM3_CLKIN_PERIOD : REAL;
      C_DCM3_DESKEW_ADJUST : STRING;
      C_DCM3_CLKIN_BUF : BOOLEAN;
      C_DCM3_CLKFB_BUF : BOOLEAN;
      C_DCM3_CLK0_BUF : BOOLEAN;
      C_DCM3_CLK90_BUF : BOOLEAN;
      C_DCM3_CLK180_BUF : BOOLEAN;
      C_DCM3_CLK270_BUF : BOOLEAN;
      C_DCM3_CLKDV_BUF : BOOLEAN;
      C_DCM3_CLKDV180_BUF : BOOLEAN;
      C_DCM3_CLK2X_BUF : BOOLEAN;
      C_DCM3_CLK2X180_BUF : BOOLEAN;
      C_DCM3_CLKFX_BUF : BOOLEAN;
      C_DCM3_CLKFX180_BUF : BOOLEAN;
      C_DCM3_EXT_RESET_HIGH : INTEGER;
      C_DCM3_FAMILY : STRING;
      C_DCM3_CLKIN_MODULE : STRING;
      C_DCM3_CLKIN_PORT : STRING;
      C_DCM3_CLKFB_MODULE : STRING;
      C_DCM3_CLKFB_PORT : STRING;
      C_DCM3_RST_MODULE : STRING
    );
    port (
      CLKIN : in std_logic;
      CLKFBIN : in std_logic;
      CLKOUT0 : out std_logic;
      CLKOUT1 : out std_logic;
      CLKOUT2 : out std_logic;
      CLKOUT3 : out std_logic;
      CLKOUT4 : out std_logic;
      CLKOUT5 : out std_logic;
      CLKOUT6 : out std_logic;
      CLKOUT7 : out std_logic;
      CLKOUT8 : out std_logic;
      CLKOUT9 : out std_logic;
      CLKOUT10 : out std_logic;
      CLKOUT11 : out std_logic;
      CLKOUT12 : out std_logic;
      CLKOUT13 : out std_logic;
      CLKOUT14 : out std_logic;
      CLKOUT15 : out std_logic;
      CLKFBOUT : out std_logic;
      RST : in std_logic;
      LOCKED : out std_logic
    );
  end component;

begin

  clock_generator_0 : clock_generator
    generic map (
      C_FAMILY => "virtex5",
      C_EXT_RESET_HIGH => 1,
      C_CLK_GEN => 1,
      C_NUM_PLL => 1,
      C_NUM_DCM => 0,
      C_CLKOUT0_MODULE => "PLL0",
      C_CLKOUT0_PORT => "CLKOUT2B",
      C_CLKOUT1_MODULE => "PLL0",
      C_CLKOUT1_PORT => "CLKOUT0B",
      C_CLKOUT2_MODULE => "PLL0",
      C_CLKOUT2_PORT => "CLKOUT1B",
      C_CLKOUT3_MODULE => "NONE",
      C_CLKOUT3_PORT => "NONE",
      C_CLKOUT4_MODULE => "NONE",
      C_CLKOUT4_PORT => "NONE",
      C_CLKOUT5_MODULE => "NONE",
      C_CLKOUT5_PORT => "NONE",
      C_CLKOUT6_MODULE => "NONE",
      C_CLKOUT6_PORT => "NONE",
      C_CLKOUT7_MODULE => "NONE",
      C_CLKOUT7_PORT => "NONE",
      C_CLKOUT8_MODULE => "NONE",
      C_CLKOUT8_PORT => "NONE",
      C_CLKOUT9_MODULE => "NONE",
      C_CLKOUT9_PORT => "NONE",
      C_CLKOUT10_MODULE => "NONE",
      C_CLKOUT10_PORT => "NONE",
      C_CLKOUT11_MODULE => "NONE",
      C_CLKOUT11_PORT => "NONE",
      C_CLKOUT12_MODULE => "NONE",
      C_CLKOUT12_PORT => "NONE",
      C_CLKOUT13_MODULE => "NONE",
      C_CLKOUT13_PORT => "NONE",
      C_CLKOUT14_MODULE => "NONE",
      C_CLKOUT14_PORT => "NONE",
      C_CLKOUT15_MODULE => "NONE",
      C_CLKOUT15_PORT => "NONE",
      C_CLKFBOUT_MODULE => "NONE",
      C_CLKFBOUT_PORT => "NONE",
      C_PLL0_DIVCLK_DIVIDE => 1,
      C_PLL0_CLKFBOUT_MULT => 10,
      C_PLL0_CLKFBOUT_PHASE => 0.0,
      C_PLL0_CLKIN1_PERIOD => 10.000,
      C_PLL0_CLKOUT0_DIVIDE => 5,
      C_PLL0_CLKOUT0_DUTY_CYCLE => 0.5,
      C_PLL0_CLKOUT0_PHASE => 0.0,
      C_PLL0_CLKOUT1_DIVIDE => 5,
      C_PLL0_CLKOUT1_DUTY_CYCLE => 0.5,
      C_PLL0_CLKOUT1_PHASE => 90.0,
      C_PLL0_CLKOUT2_DIVIDE => 10,
      C_PLL0_CLKOUT2_DUTY_CYCLE => 0.5,
      C_PLL0_CLKOUT2_PHASE => 0.0,
      C_PLL0_CLKOUT3_DIVIDE => 1,
      C_PLL0_CLKOUT3_DUTY_CYCLE => 0.5,
      C_PLL0_CLKOUT3_PHASE => 0.0,
      C_PLL0_CLKOUT4_DIVIDE => 1,
      C_PLL0_CLKOUT4_DUTY_CYCLE => 0.5,
      C_PLL0_CLKOUT4_PHASE => 0.0,
      C_PLL0_CLKOUT5_DIVIDE => 1,
      C_PLL0_CLKOUT5_DUTY_CYCLE => 0.5,
      C_PLL0_CLKOUT5_PHASE => 0.0,
      C_PLL0_BANDWIDTH => "OPTIMIZED",
      C_PLL0_COMPENSATION => "SYSTEM_SYNCHRONOUS",
      C_PLL0_REF_JITTER => 0.100,
      C_PLL0_RESET_ON_LOSS_OF_LOCK => FALSE,
      C_PLL0_RST_DEASSERT_CLK => "CLKIN1",
      C_PLL0_EXT_RESET_HIGH => 1,
      C_PLL0_FAMILY => "virtex5",
      C_PLL0_CLKOUT0_DESKEW_ADJUST => "NONE",
      C_PLL0_CLKOUT1_DESKEW_ADJUST => "NONE",
      C_PLL0_CLKOUT2_DESKEW_ADJUST => "NONE",
      C_PLL0_CLKOUT3_DESKEW_ADJUST => "PPC",
      C_PLL0_CLKOUT4_DESKEW_ADJUST => "PPC",
      C_PLL0_CLKOUT5_DESKEW_ADJUST => "PPC",
      C_PLL0_CLKFBOUT_DESKEW_ADJUST => "PPC",
      C_PLL0_CLKIN1_BUF => FALSE,
      C_PLL0_CLKFBOUT_BUF => TRUE,
      C_PLL0_CLKOUT0_BUF => TRUE,
      C_PLL0_CLKOUT1_BUF => TRUE,
      C_PLL0_CLKOUT2_BUF => TRUE,
      C_PLL0_CLKOUT3_BUF => FALSE,
      C_PLL0_CLKOUT4_BUF => FALSE,
      C_PLL0_CLKOUT5_BUF => FALSE,
      C_PLL0_CLKIN1_MODULE => "CLKGEN",
      C_PLL0_CLKIN1_PORT => "CLKIN",
      C_PLL0_CLKFBIN_MODULE => "PLL0",
      C_PLL0_CLKFBIN_PORT => "CLKFBOUT",
      C_PLL0_RST_MODULE => "CLKGEN",
      C_PLL1_DIVCLK_DIVIDE => 1,
      C_PLL1_CLKFBOUT_MULT => 1,
      C_PLL1_CLKFBOUT_PHASE => 0.000000,
      C_PLL1_CLKIN1_PERIOD => 0.000000,
      C_PLL1_CLKOUT0_DIVIDE => 1,
      C_PLL1_CLKOUT0_DUTY_CYCLE => 0.500000,
      C_PLL1_CLKOUT0_PHASE => 0.000000,
      C_PLL1_CLKOUT1_DIVIDE => 1,
      C_PLL1_CLKOUT1_DUTY_CYCLE => 0.500000,
      C_PLL1_CLKOUT1_PHASE => 0.000000,
      C_PLL1_CLKOUT2_DIVIDE => 1,
      C_PLL1_CLKOUT2_DUTY_CYCLE => 0.500000,
      C_PLL1_CLKOUT2_PHASE => 0.000000,
      C_PLL1_CLKOUT3_DIVIDE => 1,
      C_PLL1_CLKOUT3_DUTY_CYCLE => 0.500000,
      C_PLL1_CLKOUT3_PHASE => 0.000000,
      C_PLL1_CLKOUT4_DIVIDE => 1,
      C_PLL1_CLKOUT4_DUTY_CYCLE => 0.500000,
      C_PLL1_CLKOUT4_PHASE => 0.000000,
      C_PLL1_CLKOUT5_DIVIDE => 1,
      C_PLL1_CLKOUT5_DUTY_CYCLE => 0.500000,
      C_PLL1_CLKOUT5_PHASE => 0.000000,
      C_PLL1_BANDWIDTH => "OPTIMIZED",
      C_PLL1_COMPENSATION => "SYSTEM_SYNCHRONOUS",
      C_PLL1_REF_JITTER => 0.100000,
      C_PLL1_RESET_ON_LOSS_OF_LOCK => false,
      C_PLL1_RST_DEASSERT_CLK => "CLKIN1",
      C_PLL1_EXT_RESET_HIGH => 1,
      C_PLL1_FAMILY => "virtex5",
      C_PLL1_CLKOUT0_DESKEW_ADJUST => "NONE",
      C_PLL1_CLKOUT1_DESKEW_ADJUST => "NONE",
      C_PLL1_CLKOUT2_DESKEW_ADJUST => "PPC",
      C_PLL1_CLKOUT3_DESKEW_ADJUST => "PPC",
      C_PLL1_CLKOUT4_DESKEW_ADJUST => "PPC",
      C_PLL1_CLKOUT5_DESKEW_ADJUST => "PPC",
      C_PLL1_CLKFBOUT_DESKEW_ADJUST => "PPC",
      C_PLL1_CLKIN1_BUF => false,
      C_PLL1_CLKFBOUT_BUF => false,
      C_PLL1_CLKOUT0_BUF => false,
      C_PLL1_CLKOUT1_BUF => false,
      C_PLL1_CLKOUT2_BUF => false,
      C_PLL1_CLKOUT3_BUF => false,
      C_PLL1_CLKOUT4_BUF => false,
      C_PLL1_CLKOUT5_BUF => false,
      C_PLL1_CLKIN1_MODULE => "NONE",
      C_PLL1_CLKIN1_PORT => "NONE",
      C_PLL1_CLKFBIN_MODULE => "NONE",
      C_PLL1_CLKFBIN_PORT => "NONE",
      C_PLL1_RST_MODULE => "NONE",
      C_DCM0_DFS_FREQUENCY_MODE => "LOW",
      C_DCM0_DLL_FREQUENCY_MODE => "LOW",
      C_DCM0_DUTY_CYCLE_CORRECTION => true,
      C_DCM0_CLKIN_DIVIDE_BY_2 => false,
      C_DCM0_CLK_FEEDBACK => "1X",
      C_DCM0_CLKOUT_PHASE_SHIFT => "NONE",
      C_DCM0_DSS_MODE => "NONE",
      C_DCM0_STARTUP_WAIT => false,
      C_DCM0_PHASE_SHIFT => 0,
      C_DCM0_CLKFX_MULTIPLY => 4,
      C_DCM0_CLKFX_DIVIDE => 1,
      C_DCM0_CLKDV_DIVIDE => 2.000000,
      C_DCM0_CLKIN_PERIOD => 0.000000,
      C_DCM0_DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS",
      C_DCM0_CLKIN_BUF => false,
      C_DCM0_CLKFB_BUF => false,
      C_DCM0_CLK0_BUF => false,
      C_DCM0_CLK90_BUF => false,
      C_DCM0_CLK180_BUF => false,
      C_DCM0_CLK270_BUF => false,
      C_DCM0_CLKDV_BUF => false,
      C_DCM0_CLKDV180_BUF => false,
      C_DCM0_CLK2X_BUF => false,
      C_DCM0_CLK2X180_BUF => false,
      C_DCM0_CLKFX_BUF => false,
      C_DCM0_CLKFX180_BUF => false,
      C_DCM0_EXT_RESET_HIGH => 1,
      C_DCM0_FAMILY => "virtex5",
      C_DCM0_CLKIN_MODULE => "NONE",
      C_DCM0_CLKIN_PORT => "NONE",
      C_DCM0_CLKFB_MODULE => "NONE",
      C_DCM0_CLKFB_PORT => "NONE",
      C_DCM0_RST_MODULE => "NONE",
      C_DCM1_DFS_FREQUENCY_MODE => "LOW",
      C_DCM1_DLL_FREQUENCY_MODE => "LOW",
      C_DCM1_DUTY_CYCLE_CORRECTION => true,
      C_DCM1_CLKIN_DIVIDE_BY_2 => false,
      C_DCM1_CLK_FEEDBACK => "1X",
      C_DCM1_CLKOUT_PHASE_SHIFT => "NONE",
      C_DCM1_DSS_MODE => "NONE",
      C_DCM1_STARTUP_WAIT => false,
      C_DCM1_PHASE_SHIFT => 0,
      C_DCM1_CLKFX_MULTIPLY => 4,
      C_DCM1_CLKFX_DIVIDE => 1,
      C_DCM1_CLKDV_DIVIDE => 2.000000,
      C_DCM1_CLKIN_PERIOD => 0.000000,
      C_DCM1_DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS",
      C_DCM1_CLKIN_BUF => false,
      C_DCM1_CLKFB_BUF => false,
      C_DCM1_CLK0_BUF => false,
      C_DCM1_CLK90_BUF => false,
      C_DCM1_CLK180_BUF => false,
      C_DCM1_CLK270_BUF => false,
      C_DCM1_CLKDV_BUF => false,
      C_DCM1_CLKDV180_BUF => false,
      C_DCM1_CLK2X_BUF => false,
      C_DCM1_CLK2X180_BUF => false,
      C_DCM1_CLKFX_BUF => false,
      C_DCM1_CLKFX180_BUF => false,
      C_DCM1_EXT_RESET_HIGH => 1,
      C_DCM1_FAMILY => "virtex5",
      C_DCM1_CLKIN_MODULE => "NONE",
      C_DCM1_CLKIN_PORT => "NONE",
      C_DCM1_CLKFB_MODULE => "NONE",
      C_DCM1_CLKFB_PORT => "NONE",
      C_DCM1_RST_MODULE => "NONE",
      C_DCM2_DFS_FREQUENCY_MODE => "LOW",
      C_DCM2_DLL_FREQUENCY_MODE => "LOW",
      C_DCM2_DUTY_CYCLE_CORRECTION => true,
      C_DCM2_CLKIN_DIVIDE_BY_2 => false,
      C_DCM2_CLK_FEEDBACK => "1X",
      C_DCM2_CLKOUT_PHASE_SHIFT => "NONE",
      C_DCM2_DSS_MODE => "NONE",
      C_DCM2_STARTUP_WAIT => false,
      C_DCM2_PHASE_SHIFT => 0,
      C_DCM2_CLKFX_MULTIPLY => 4,
      C_DCM2_CLKFX_DIVIDE => 1,
      C_DCM2_CLKDV_DIVIDE => 2.000000,
      C_DCM2_CLKIN_PERIOD => 0.000000,
      C_DCM2_DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS",
      C_DCM2_CLKIN_BUF => false,
      C_DCM2_CLKFB_BUF => false,
      C_DCM2_CLK0_BUF => false,
      C_DCM2_CLK90_BUF => false,
      C_DCM2_CLK180_BUF => false,
      C_DCM2_CLK270_BUF => false,
      C_DCM2_CLKDV_BUF => false,
      C_DCM2_CLKDV180_BUF => false,
      C_DCM2_CLK2X_BUF => false,
      C_DCM2_CLK2X180_BUF => false,
      C_DCM2_CLKFX_BUF => false,
      C_DCM2_CLKFX180_BUF => false,
      C_DCM2_EXT_RESET_HIGH => 1,
      C_DCM2_FAMILY => "virtex5",
      C_DCM2_CLKIN_MODULE => "NONE",
      C_DCM2_CLKIN_PORT => "NONE",
      C_DCM2_CLKFB_MODULE => "NONE",
      C_DCM2_CLKFB_PORT => "NONE",
      C_DCM2_RST_MODULE => "NONE",
      C_DCM3_DFS_FREQUENCY_MODE => "LOW",
      C_DCM3_DLL_FREQUENCY_MODE => "LOW",
      C_DCM3_DUTY_CYCLE_CORRECTION => true,
      C_DCM3_CLKIN_DIVIDE_BY_2 => false,
      C_DCM3_CLK_FEEDBACK => "1X",
      C_DCM3_CLKOUT_PHASE_SHIFT => "NONE",
      C_DCM3_DSS_MODE => "NONE",
      C_DCM3_STARTUP_WAIT => false,
      C_DCM3_PHASE_SHIFT => 0,
      C_DCM3_CLKFX_MULTIPLY => 4,
      C_DCM3_CLKFX_DIVIDE => 1,
      C_DCM3_CLKDV_DIVIDE => 2.000000,
      C_DCM3_CLKIN_PERIOD => 0.000000,
      C_DCM3_DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS",
      C_DCM3_CLKIN_BUF => false,
      C_DCM3_CLKFB_BUF => false,
      C_DCM3_CLK0_BUF => false,
      C_DCM3_CLK90_BUF => false,
      C_DCM3_CLK180_BUF => false,
      C_DCM3_CLK270_BUF => false,
      C_DCM3_CLKDV_BUF => false,
      C_DCM3_CLKDV180_BUF => false,
      C_DCM3_CLK2X_BUF => false,
      C_DCM3_CLK2X180_BUF => false,
      C_DCM3_CLKFX_BUF => false,
      C_DCM3_CLKFX180_BUF => false,
      C_DCM3_EXT_RESET_HIGH => 1,
      C_DCM3_FAMILY => "virtex5",
      C_DCM3_CLKIN_MODULE => "NONE",
      C_DCM3_CLKIN_PORT => "NONE",
      C_DCM3_CLKFB_MODULE => "NONE",
      C_DCM3_CLKFB_PORT => "NONE",
      C_DCM3_RST_MODULE => "NONE"
    )
    port map (
      CLKIN => CLKIN,
      CLKFBIN => CLKFBIN,
      CLKOUT0 => CLKOUT0,
      CLKOUT1 => CLKOUT1,
      CLKOUT2 => CLKOUT2,
      CLKOUT3 => CLKOUT3,
      CLKOUT4 => CLKOUT4,
      CLKOUT5 => CLKOUT5,
      CLKOUT6 => CLKOUT6,
      CLKOUT7 => CLKOUT7,
      CLKOUT8 => CLKOUT8,
      CLKOUT9 => CLKOUT9,
      CLKOUT10 => CLKOUT10,
      CLKOUT11 => CLKOUT11,
      CLKOUT12 => CLKOUT12,
      CLKOUT13 => CLKOUT13,
      CLKOUT14 => CLKOUT14,
      CLKOUT15 => CLKOUT15,
      CLKFBOUT => CLKFBOUT,
      RST => RST,
      LOCKED => LOCKED
    );

end architecture STRUCTURE;

