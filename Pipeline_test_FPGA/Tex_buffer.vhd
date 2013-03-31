--------------------------------------------------------------------------------
--     This file is owned and controlled by Xilinx and must be used           --
--     solely for design, simulation, implementation and creation of          --
--     design files limited to Xilinx devices or technologies. Use            --
--     with non-Xilinx devices or technologies is expressly prohibited        --
--     and immediately terminates your license.                               --
--                                                                            --
--     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"          --
--     SOLELY FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR                --
--     XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION        --
--     AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, APPLICATION            --
--     OR STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS              --
--     IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,                --
--     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE       --
--     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY               --
--     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE                --
--     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR         --
--     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF        --
--     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS        --
--     FOR A PARTICULAR PURPOSE.                                              --
--                                                                            --
--     Xilinx products are not intended for use in life support               --
--     appliances, devices, or systems. Use in such applications are          --
--     expressly prohibited.                                                  --
--                                                                            --
--     (c) Copyright 1995-2007 Xilinx, Inc.                                   --
--     All rights reserved.                                                   --
--------------------------------------------------------------------------------
-- You must compile the wrapper file Tex_buffer.vhd when simulating
-- the core, Tex_buffer. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synthesis directives "translate_off/translate_on" specified
-- below are supported by Xilinx, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synthesis translate_off
Library XilinxCoreLib;
-- synthesis translate_on
ENTITY Tex_buffer IS
	port (
	clka: IN std_logic;
	dina: IN std_logic_VECTOR(23 downto 0);
	addra: IN std_logic_VECTOR(11 downto 0);
	wea: IN std_logic_VECTOR(0 downto 0);
	clkb: IN std_logic;
	addrb: IN std_logic_VECTOR(11 downto 0);
	doutb: OUT std_logic_VECTOR(23 downto 0));
END Tex_buffer;

ARCHITECTURE Tex_buffer_a OF Tex_buffer IS
-- synthesis translate_off
component wrapped_Tex_buffer
	port (
	clka: IN std_logic;
	dina: IN std_logic_VECTOR(23 downto 0);
	addra: IN std_logic_VECTOR(11 downto 0);
	wea: IN std_logic_VECTOR(0 downto 0);
	clkb: IN std_logic;
	addrb: IN std_logic_VECTOR(11 downto 0);
	doutb: OUT std_logic_VECTOR(23 downto 0));
end component;

-- Configuration specification 
	for all : wrapped_Tex_buffer use entity XilinxCoreLib.blk_mem_gen_v2_8(behavioral)
		generic map(
			c_has_regceb => 0,
			c_has_regcea => 0,
			c_mem_type => 1,
			c_prim_type => 1,
			c_sinita_val => "0",
			c_read_width_b => 24,
			c_family => "virtex5",
			c_read_width_a => 24,
			c_disable_warn_bhv_coll => 0,
			c_write_mode_b => "READ_FIRST",
			c_init_file_name => "Tex_buffer.mif",
			c_write_mode_a => "READ_FIRST",
			c_mux_pipeline_stages => 0,
			c_has_mem_output_regs_b => 0,
			c_load_init_file => 1,
			c_xdevicefamily => "virtex5",
			c_has_mem_output_regs_a => 0,
			c_write_depth_b => 4096,
			c_write_depth_a => 4096,
			c_has_ssrb => 0,
			c_has_mux_output_regs_b => 0,
			c_has_ssra => 0,
			c_has_mux_output_regs_a => 0,
			c_addra_width => 12,
			c_addrb_width => 12,
			c_default_data => "0",
			c_use_ecc => 0,
			c_algorithm => 1,
			c_disable_warn_bhv_range => 0,
			c_write_width_b => 24,
			c_write_width_a => 24,
			c_read_depth_b => 4096,
			c_read_depth_a => 4096,
			c_byte_size => 9,
			c_sim_collision_check => "ALL",
			c_use_ramb16bwer_rst_bhv => 0,
			c_common_clk => 0,
			c_wea_width => 1,
			c_has_enb => 0,
			c_web_width => 1,
			c_has_ena => 0,
			c_sinitb_val => "0",
			c_use_byte_web => 0,
			c_use_byte_wea => 0,
			c_use_default_data => 0);
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_Tex_buffer
		port map (
			clka => clka,
			dina => dina,
			addra => addra,
			wea => wea,
			clkb => clkb,
			addrb => addrb,
			doutb => doutb);
-- synthesis translate_on

END Tex_buffer_a;

