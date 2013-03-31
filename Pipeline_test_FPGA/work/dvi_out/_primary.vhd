library verilog;
use verilog.vl_types.all;
entity dvi_out is
    port(
        h_sync          : in     vl_logic;
        v_sync          : in     vl_logic;
        dvi_de_in       : in     vl_logic;
        clk_pix         : in     vl_logic;
        red             : in     vl_logic_vector(7 downto 0);
        green           : in     vl_logic_vector(7 downto 0);
        blue            : in     vl_logic_vector(7 downto 0);
        dvi_h           : out    vl_logic;
        dvi_v           : out    vl_logic;
        dvi_de_out      : out    vl_logic;
        dvi_xclk_p      : out    vl_logic;
        dvi_xclk_n      : out    vl_logic;
        dvi_d           : out    vl_logic_vector(11 downto 0)
    );
end dvi_out;
