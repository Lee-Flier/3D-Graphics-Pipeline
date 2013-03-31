library verilog;
use verilog.vl_types.all;
entity h_sync is
    generic(
        PULSE_LENGTH    : integer := 96;
        BACK_PORCH      : integer := 48;
        ACTIVE_VIDEO    : integer := 640;
        FRONT_PORCH     : integer := 16;
        IDLE            : integer := 1;
        Sp              : integer := 2;
        Bp              : integer := 4;
        Ap              : integer := 8;
        Fp              : integer := 16
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        vsync_rst       : out    vl_logic;
        h_sync          : out    vl_logic;
        h_de            : out    vl_logic;
        gate            : out    vl_logic;
        pixcel_col      : out    vl_logic_vector(9 downto 0)
    );
end h_sync;
