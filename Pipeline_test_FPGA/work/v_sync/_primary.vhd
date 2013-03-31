library verilog;
use verilog.vl_types.all;
entity v_sync is
    generic(
        PULSE_LENGTH    : integer := 2;
        BACK_PORCH      : integer := 31;
        ACTIVE_VIDEO    : integer := 480;
        FRONT_PORCH     : integer := 11;
        IDLE            : integer := 1;
        Sp              : integer := 2;
        Bp              : integer := 4;
        Ap              : integer := 8;
        Fp              : integer := 16
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        v_en            : in     vl_logic;
        clk_hsync       : in     vl_logic;
        v_sync          : out    vl_logic;
        v_de            : out    vl_logic;
        gate            : out    vl_logic;
        pixcel_row      : out    vl_logic_vector(9 downto 0)
    );
end v_sync;
