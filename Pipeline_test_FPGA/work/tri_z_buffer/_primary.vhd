library verilog;
use verilog.vl_types.all;
entity tri_z_buffer is
    port(
        clk_i           : in     vl_logic;
        reset_i         : in     vl_logic;
        ras_en_i        : in     vl_logic;
        pix_ready_o     : out    vl_logic;
        pix_valid_i     : in     vl_logic;
        pix_data_i      : in     vl_logic_vector(298 downto 0);
        valid_pix_o     : out    vl_logic;
        ready_pix_i     : in     vl_logic;
        pix_data_o      : out    vl_logic_vector(298 downto 0)
    );
end tri_z_buffer;
