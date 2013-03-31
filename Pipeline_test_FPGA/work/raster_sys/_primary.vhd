library verilog;
use verilog.vl_types.all;
entity raster_sys is
    port(
        sys_clk_pin     : in     vl_logic;
        clk             : out    vl_logic;
        nrst_done       : in     vl_logic;
        Ver_Tex         : in     vl_logic;
        Clc_scr         : in     vl_logic;
        pix_valid       : in     vl_logic;
        pix_ready       : out    vl_logic;
        pix_data        : in     vl_logic_vector(96 downto 0);
        background      : in     vl_logic_vector(35 downto 0);
        enable          : in     vl_logic;
        eof             : out    vl_logic;
        sda_pin         : out    vl_logic;
        scl_pin         : out    vl_logic;
        done            : out    vl_logic;
        dvi_d           : out    vl_logic_vector(11 downto 0);
        dvi_h           : out    vl_logic;
        dvi_v           : out    vl_logic;
        dvi_de          : out    vl_logic;
        dvi_xclk_n      : out    vl_logic;
        dvi_xclk_p      : out    vl_logic
    );
end raster_sys;
