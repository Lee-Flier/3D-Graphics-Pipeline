library verilog;
use verilog.vl_types.all;
entity tri_raster is
    port(
        clk_i           : in     vl_logic;
        reset_i         : in     vl_logic;
        pix_ready_o     : out    vl_logic;
        pix_valid_i     : in     vl_logic;
        v0_reg_i        : in     vl_logic_vector(96 downto 0);
        v1_reg_i        : in     vl_logic_vector(96 downto 0);
        v2_reg_i        : in     vl_logic_vector(96 downto 0);
        area_reg_i      : in     vl_logic_vector(16 downto 0);
        valid_pix_o     : out    vl_logic;
        ready_pix_i     : in     vl_logic;
        pix_data_o      : out    vl_logic_vector(298 downto 0)
    );
end tri_raster;
