library verilog;
use verilog.vl_types.all;
entity user_logic is
    generic(
        C_SLV_DWIDTH    : integer := 32;
        C_NUM_REG       : integer := 32
    );
    port(
        zbt_mbox_sel    : out    vl_logic;
        zbt_mbox_we     : out    vl_logic;
        zbt_mbox_addr   : out    vl_logic_vector(19 downto 0);
        zbt_mbox_wdata  : out    vl_logic_vector(35 downto 0);
        zbt_mbox_rdata  : in     vl_logic_vector(35 downto 0);
        zbt_mbox_wdone  : in     vl_logic;
        zbt_mbox_dval   : in     vl_logic;
        zbt_dcm_lock    : in     vl_logic;
        video_enable_o  : out    vl_logic;
        gpu_enable_o    : out    vl_logic;
        background_o    : out    vl_logic_vector(35 downto 0);
        zmax_o          : out    vl_logic_vector(31 downto 0);
        color_in_o      : out    vl_logic_vector(31 downto 0);
        x_in_o          : out    vl_logic_vector(31 downto 0);
        y_in_o          : out    vl_logic_vector(31 downto 0);
        z_in_o          : out    vl_logic_vector(31 downto 0);
        w_in_o          : out    vl_logic_vector(31 downto 0);
        point_trig_o    : out    vl_logic;
        Tx_in_o         : out    vl_logic_vector(31 downto 0);
        Ty_in_o         : out    vl_logic_vector(31 downto 0);
        matrix_we       : out    vl_logic;
        matrix_sel      : out    vl_logic_vector(1 downto 0);
        matrix_waddr    : out    vl_logic_vector(3 downto 0);
        matrix_wdata    : out    vl_logic_vector(127 downto 0);
        pix_valid       : in     vl_logic;
        eof_i           : in     vl_logic;
        Bus2IP_Clk      : in     vl_logic;
        Bus2IP_Reset    : in     vl_logic;
        Bus2IP_Data     : in     vl_logic_vector;
        Bus2IP_BE       : in     vl_logic_vector;
        Bus2IP_RdCE     : in     vl_logic_vector;
        Bus2IP_WrCE     : in     vl_logic_vector;
        IP2Bus_Data     : out    vl_logic_vector;
        IP2Bus_RdAck    : out    vl_logic;
        IP2Bus_WrAck    : out    vl_logic;
        IP2Bus_Error    : out    vl_logic
    );
end user_logic;
