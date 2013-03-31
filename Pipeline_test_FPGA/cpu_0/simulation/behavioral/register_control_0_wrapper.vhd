-------------------------------------------------------------------------------
-- register_control_0_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library register_control_v1_00_a;
use register_control_v1_00_a.all;

entity register_control_0_wrapper is
  port (
    video_enable_o : out std_logic;
    gpu_enable_o : out std_logic;
    background_o : out std_logic_vector(35 downto 0);
    eof_i : in std_logic;
    matrix_we : out std_logic;
    matrix_sel : out std_logic_vector(1 downto 0);
    matrix_waddr : out std_logic_vector(3 downto 0);
    matrix_wdata : out std_logic_vector(127 downto 0);
    x_in_o : out std_logic_vector(31 downto 0);
    y_in_o : out std_logic_vector(31 downto 0);
    z_in_o : out std_logic_vector(31 downto 0);
    w_in_o : out std_logic_vector(31 downto 0);
    color_in_o : out std_logic_vector(17 downto 0);
    point_trig_o : out std_logic;
    zbt_dcm_lock : in std_logic;
    zmax_o : out std_logic_vector(31 downto 0);
    zbt_mbox_sel : out std_logic;
    zbt_mbox_we : out std_logic;
    zbt_mbox_addr : out std_logic_vector(19 downto 0);
    zbt_mbox_wdata : out std_logic_vector(35 downto 0);
    zbt_mbox_rdata : in std_logic_vector(35 downto 0);
    zbt_mbox_wdone : in std_logic;
    zbt_mbox_dval : in std_logic;
    SPLB_Clk : in std_logic;
    SPLB_Rst : in std_logic;
    PLB_ABus : in std_logic_vector(0 to 31);
    PLB_UABus : in std_logic_vector(0 to 31);
    PLB_PAValid : in std_logic;
    PLB_SAValid : in std_logic;
    PLB_rdPrim : in std_logic;
    PLB_wrPrim : in std_logic;
    PLB_masterID : in std_logic_vector(0 to 0);
    PLB_abort : in std_logic;
    PLB_busLock : in std_logic;
    PLB_RNW : in std_logic;
    PLB_BE : in std_logic_vector(0 to 7);
    PLB_MSize : in std_logic_vector(0 to 1);
    PLB_size : in std_logic_vector(0 to 3);
    PLB_type : in std_logic_vector(0 to 2);
    PLB_lockErr : in std_logic;
    PLB_wrDBus : in std_logic_vector(0 to 63);
    PLB_wrBurst : in std_logic;
    PLB_rdBurst : in std_logic;
    PLB_wrPendReq : in std_logic;
    PLB_rdPendReq : in std_logic;
    PLB_wrPendPri : in std_logic_vector(0 to 1);
    PLB_rdPendPri : in std_logic_vector(0 to 1);
    PLB_reqPri : in std_logic_vector(0 to 1);
    PLB_TAttribute : in std_logic_vector(0 to 15);
    Sl_addrAck : out std_logic;
    Sl_SSize : out std_logic_vector(0 to 1);
    Sl_wait : out std_logic;
    Sl_rearbitrate : out std_logic;
    Sl_wrDAck : out std_logic;
    Sl_wrComp : out std_logic;
    Sl_wrBTerm : out std_logic;
    Sl_rdDBus : out std_logic_vector(0 to 63);
    Sl_rdWdAddr : out std_logic_vector(0 to 3);
    Sl_rdDAck : out std_logic;
    Sl_rdComp : out std_logic;
    Sl_rdBTerm : out std_logic;
    Sl_MBusy : out std_logic_vector(0 to 1);
    Sl_MWrErr : out std_logic_vector(0 to 1);
    Sl_MRdErr : out std_logic_vector(0 to 1);
    Sl_MIRQ : out std_logic_vector(0 to 1)
  );
end register_control_0_wrapper;

architecture STRUCTURE of register_control_0_wrapper is

  component register_control is
    generic (
      C_BASEADDR : std_logic_vector;
      C_HIGHADDR : std_logic_vector;
      C_SPLB_AWIDTH : INTEGER;
      C_SPLB_DWIDTH : INTEGER;
      C_SPLB_NUM_MASTERS : INTEGER;
      C_SPLB_MID_WIDTH : INTEGER;
      C_SPLB_NATIVE_DWIDTH : INTEGER;
      C_SPLB_P2P : INTEGER;
      C_SPLB_SUPPORT_BURSTS : INTEGER;
      C_SPLB_SMALLEST_MASTER : INTEGER;
      C_SPLB_CLK_PERIOD_PS : INTEGER;
      C_INCLUDE_DPHASE_TIMER : INTEGER;
      C_FAMILY : STRING
    );
    port (
      video_enable_o : out std_logic;
      gpu_enable_o : out std_logic;
      background_o : out std_logic_vector(35 downto 0);
      eof_i : in std_logic;
      matrix_we : out std_logic;
      matrix_sel : out std_logic_vector(1 downto 0);
      matrix_waddr : out std_logic_vector(3 downto 0);
      matrix_wdata : out std_logic_vector(127 downto 0);
      x_in_o : out std_logic_vector(31 downto 0);
      y_in_o : out std_logic_vector(31 downto 0);
      z_in_o : out std_logic_vector(31 downto 0);
      w_in_o : out std_logic_vector(31 downto 0);
      color_in_o : out std_logic_vector(17 downto 0);
      point_trig_o : out std_logic;
      zbt_dcm_lock : in std_logic;
      zmax_o : out std_logic_vector(31 downto 0);
      zbt_mbox_sel : out std_logic;
      zbt_mbox_we : out std_logic;
      zbt_mbox_addr : out std_logic_vector(19 downto 0);
      zbt_mbox_wdata : out std_logic_vector(35 downto 0);
      zbt_mbox_rdata : in std_logic_vector(35 downto 0);
      zbt_mbox_wdone : in std_logic;
      zbt_mbox_dval : in std_logic;
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to (C_SPLB_MID_WIDTH-1));
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to ((C_SPLB_DWIDTH/8)-1));
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to (C_SPLB_DWIDTH-1));
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to (C_SPLB_DWIDTH-1));
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to (C_SPLB_NUM_MASTERS-1));
      Sl_MWrErr : out std_logic_vector(0 to (C_SPLB_NUM_MASTERS-1));
      Sl_MRdErr : out std_logic_vector(0 to (C_SPLB_NUM_MASTERS-1));
      Sl_MIRQ : out std_logic_vector(0 to (C_SPLB_NUM_MASTERS-1))
    );
  end component;

begin

  register_control_0 : register_control
    generic map (
      C_BASEADDR => X"cac00000",
      C_HIGHADDR => X"cac0ffff",
      C_SPLB_AWIDTH => 32,
      C_SPLB_DWIDTH => 64,
      C_SPLB_NUM_MASTERS => 2,
      C_SPLB_MID_WIDTH => 1,
      C_SPLB_NATIVE_DWIDTH => 32,
      C_SPLB_P2P => 0,
      C_SPLB_SUPPORT_BURSTS => 0,
      C_SPLB_SMALLEST_MASTER => 32,
      C_SPLB_CLK_PERIOD_PS => 10000,
      C_INCLUDE_DPHASE_TIMER => 1,
      C_FAMILY => "virtex5"
    )
    port map (
      video_enable_o => video_enable_o,
      gpu_enable_o => gpu_enable_o,
      background_o => background_o,
      eof_i => eof_i,
      matrix_we => matrix_we,
      matrix_sel => matrix_sel,
      matrix_waddr => matrix_waddr,
      matrix_wdata => matrix_wdata,
      x_in_o => x_in_o,
      y_in_o => y_in_o,
      z_in_o => z_in_o,
      w_in_o => w_in_o,
      color_in_o => color_in_o,
      point_trig_o => point_trig_o,
      zbt_dcm_lock => zbt_dcm_lock,
      zmax_o => zmax_o,
      zbt_mbox_sel => zbt_mbox_sel,
      zbt_mbox_we => zbt_mbox_we,
      zbt_mbox_addr => zbt_mbox_addr,
      zbt_mbox_wdata => zbt_mbox_wdata,
      zbt_mbox_rdata => zbt_mbox_rdata,
      zbt_mbox_wdone => zbt_mbox_wdone,
      zbt_mbox_dval => zbt_mbox_dval,
      SPLB_Clk => SPLB_Clk,
      SPLB_Rst => SPLB_Rst,
      PLB_ABus => PLB_ABus,
      PLB_UABus => PLB_UABus,
      PLB_PAValid => PLB_PAValid,
      PLB_SAValid => PLB_SAValid,
      PLB_rdPrim => PLB_rdPrim,
      PLB_wrPrim => PLB_wrPrim,
      PLB_masterID => PLB_masterID,
      PLB_abort => PLB_abort,
      PLB_busLock => PLB_busLock,
      PLB_RNW => PLB_RNW,
      PLB_BE => PLB_BE,
      PLB_MSize => PLB_MSize,
      PLB_size => PLB_size,
      PLB_type => PLB_type,
      PLB_lockErr => PLB_lockErr,
      PLB_wrDBus => PLB_wrDBus,
      PLB_wrBurst => PLB_wrBurst,
      PLB_rdBurst => PLB_rdBurst,
      PLB_wrPendReq => PLB_wrPendReq,
      PLB_rdPendReq => PLB_rdPendReq,
      PLB_wrPendPri => PLB_wrPendPri,
      PLB_rdPendPri => PLB_rdPendPri,
      PLB_reqPri => PLB_reqPri,
      PLB_TAttribute => PLB_TAttribute,
      Sl_addrAck => Sl_addrAck,
      Sl_SSize => Sl_SSize,
      Sl_wait => Sl_wait,
      Sl_rearbitrate => Sl_rearbitrate,
      Sl_wrDAck => Sl_wrDAck,
      Sl_wrComp => Sl_wrComp,
      Sl_wrBTerm => Sl_wrBTerm,
      Sl_rdDBus => Sl_rdDBus,
      Sl_rdWdAddr => Sl_rdWdAddr,
      Sl_rdDAck => Sl_rdDAck,
      Sl_rdComp => Sl_rdComp,
      Sl_rdBTerm => Sl_rdBTerm,
      Sl_MBusy => Sl_MBusy,
      Sl_MWrErr => Sl_MWrErr,
      Sl_MRdErr => Sl_MRdErr,
      Sl_MIRQ => Sl_MIRQ
    );

end architecture STRUCTURE;

