----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:12:28 09/19/2010 
-- Design Name: 
-- Module Name:    FIFOTODVI - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library work; 
use work.gpu_pkg.all;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FIFOTODVI is
port (
	reset : in std_logic; -- Async Reset. 
	sys_clk_pin : in std_logic;
	clk : out std_logic; -- System clock. 
	-- zbt_clk : in std_logic; -- ZBT memory clock. 
	-- vga_clk : in std_logic; -- Vga clock.

   vga_enable : in std_logic;
-- New frame trigger signals. 
   gpu_enable : in std_logic;
-- Background 
   background : in std_logic_vector(35 downto 0);
-- End of file 
   eof : out std_logic;   -- yong yu gei cpu de xiang guang xin hao 

-- Matrix Memory access.
	matrix_we : in std_logic; 
	matrix_sel : in std_logic_vector(1 downto 0); 
	matrix_waddr : in std_logic_vector(3 downto 0); 
	matrix_wdata : in std_logic_vector(127 downto 0);

-- Pixel Pipe.
	x_in : in std_logic_vector(31 downto 0); 
	y_in : in std_logic_vector(31 downto 0); 
	z_in : in std_logic_vector(31 downto 0); 
	w_in : in std_logic_vector(31 downto 0); 
	color : in std_logic_vector(31 downto 0); 
	Tx : in std_logic_vector(31 downto 0);
	Ty : in std_logic_vector(31 downto 0);
	Ver_Tex : in std_logic;
	Clc_scr : in std_logic;
	pix_valid : in std_logic; 
	pix_ready : out std_logic;
	

-- Clipping Maximum 
   zmax : in std_logic_vector(31 downto 0);

-- CPU Interface port. 
	-- cpu_sel : in std_logic; 
	-- cpu_we : in std_logic; 
	-- cpu_addr : in std_logic_vector(19 downto 0); 
	-- cpu_wdata : in std_logic_vector(35 downto 0); 
	-- cpu_wdone : out std_logic; 
	-- cpu_dval : out std_logic; 
	-- cpu_rdata : out std_logic_vector(35 downto 0);

-- ZBT interface 
	-- zbt_cen : out std_logic; 
	-- zbt_wen : out std_logic; 
	-- zbt_oen : out std_logic; 
	-- zbt_ts : out std_logic; 
	-- zbt_wdata : out std_logic_vector(35 downto 0); 
	-- zbt_addr : out std_logic_vector(17 downto 0); 
	-- zbt_rdata : in std_logic_vector(35 downto 0); 

-- Dvi interface signals. 
	sda_pin : out std_logic;
	scl_pin : out std_logic;
	done : out std_logic;
	
	dvi_d : out std_logic_vector(11 downto 0);
	dvi_h : out std_logic;
	dvi_v : out std_logic;
	dvi_de : out std_logic;
	dvi_xclk_n : out std_logic;
	dvi_xclk_p : out std_logic
);
end FIFOTODVI;

architecture Behavioral of FIFOTODVI is

component float32to18 is
generic (
NUM_OF_ENTRIES : integer := 1
);
port (
		-- Reset/Clock
		reset : in std_logic;  
		clk : in std_logic;
		operation_nd_9 : in std_logic_vector(NUM_OF_ENTRIES-1 downto 0); 
		a_9 : in std_logic_vector(NUM_OF_ENTRIES*32-1 downto 0);
		rdy_9 : out std_logic_vector(NUM_OF_ENTRIES-1 downto 0); 
		result_9 : out std_logic_vector(NUM_OF_ENTRIES*18-1 downto 0); 
		underflow_9 : out std_logic_vector(NUM_OF_ENTRIES-1 downto 0); 
		overflow_9 : out std_logic_vector(NUM_OF_ENTRIES-1 downto 0) 
);
end component;


-- component dvi_intf is 
-- port(
		-- -- Clock, reset and enable signals
		-- clk : in std_logic;
		-- reset_n : in std_logic;
		-- enable : in std_logic;
		-- -- VGA input signals.
		-- vga_vsync_n : in std_logic;
		-- vga_hsync_n : in std_logic;
		-- vga_red : in std_logic_vector(7 downto 0);
		-- vga_green : in std_logic_vector(7 downto 0);
		-- vga_blue : in std_logic_vector(7 downto 0);
		-- vga_valid : in std_logic;
		-- -- Display driver and fifo status
		-- dvi_hsync_n : out std_logic;
		-- dvi_vsync_n : out std_logic;
		-- dvi_data_en : out std_logic;
		-- dvi_data1 : out std_logic_vector(11 downto 0);
		-- dvi_data2 : out std_logic_vector(11 downto 0)
-- );
-- end component ;

-- component vga_ctrl is 
-- generic(
		-- -- Number of bits per color
		 -- NUM_COLOR_BITS : natural := 8;
		-- -- Video timing Generics.
		-- H_ACTIVE_VIDEO : integer := 640;
		-- H_PULSE_LENGTH : integer := 96;
		-- H_FRONT_PORCH : integer := 16;
		-- H_BACK_PORCH : integer := 48;
		-- V_ACTIVE_VIDEO : integer := 480;
		-- V_PULSE_LENGTH : integer := 2;
		-- V_FRONT_PORCH : integer := 11;
		-- V_BACK_PORCH : integer := 31;
		-- -- Pixel Fifo Generics
		-- FIFO_DEPTH : integer := 16;
		-- FIFO_AFULL_THRESH : integer := 9;
		-- FIFO_AEMPTY_THRESH: integer := 8
-- );
-- port(
		-- -- Clock, reset and enable signals
		-- vga_clk : in std_logic;
		-- reset_n : in std_logic;
		-- vga_enable : in std_logic;
		-- -- Input pixel data.
		-- pixel_data_in : in std_logic_vector((NUM_COLOR_BITS * 3)-1 downto
		-- 0);
		-- pixel_wr_req : in std_logic;
		-- -- Signals to the display
		-- vsync_n : out std_logic;
		-- hsync_n : out std_logic;
		-- red_value : out std_logic_vector(NUM_COLOR_BITS-1 downto 0);
		-- green_value : out std_logic_vector(NUM_COLOR_BITS-1 downto 0);
		-- blue_value : out std_logic_vector(NUM_COLOR_BITS-1 downto 0);
		-- vga_valid : out std_logic;
		-- -- Display driver and fifo status
		-- pixel_fifo_full : out std_logic;
		-- pixel_fifo_empty : out std_logic;
		-- pixel_fifo_afull : out std_logic;
		-- pixel_fifo_aempty: out std_logic;
		-- pixel_eof : out std_logic
-- );
-- end component;


-- component vga_frame_reader is
-- port(
		-- -- Clock, reset and enable signals
		-- vga_clk : in std_logic; 
		-- reset_n : in std_logic;
		-- -- Vga controller interface.
		-- vga_fifo_afull : in std_logic; 
		-- vga_data_val : out std_logic; 
		-- vga_data : out std_logic_vector(23 downto 0); 
		-- vga_eof : in std_logic;
		-- -- ZBt memory interface.
		-- mem_req : out std_logic; 
		-- mem_afull : in std_logic; 
		-- mem_addr : out std_logic_vector(18 downto 0); 
		-- mem_rpop : out std_logic; 
		-- mem_rdata : in std_logic_vector(35 downto 0); 
		-- mem_rempty : in std_logic; 
		-- mem_rafull : in std_logic
-- );
-- end component;

-- component zbt_frame_intf is
-- generic ( 
		-- ADDR_WIDTH : integer := 20; 
		-- BYTE_WIDTH : integer := 9; 
		-- DATA_WIDTH : integer := 36 
-- );
-- port (
		-- -- Reset/Clock
		-- reset : in std_logic; 
		-- -- Async Reset. 
		-- sys_clk : in std_logic; -- System clock. 
		-- zbt_clk : in std_logic; -- ZBT memory clock. 
		-- vga_clk : in std_logic; -- Vga clock.
		-- -- New frame trigger signals. 
		-- gpu_enable : in std_logic;
		-- vga_eof : in std_logic;
		-- -- VGA Read Only Port 
		-- vga_req : in std_logic; 
		-- vga_afull : out std_logic; 
		-- vga_addr : in std_logic_vector(ADDR_WIDTH-2 downto 0); 
		-- vga_rpop : in std_logic; 
		-- vga_rdata : out std_logic_vector(DATA_WIDTH-1 downto 0); 
		-- vga_rempty : out std_logic; 
		-- vga_rafull : out std_logic;
		-- -- GPU Interface port 
		-- gpu_req : in std_logic; 
		-- gpu_afull : out std_logic; 
		-- gpu_size : in std_logic_vector(1 downto 0); 
		-- gpu_addr : in std_logic_vector(ADDR_WIDTH-2 downto 0); 
		-- gpu_rnw : in std_logic; 
		-- gpu_wpush : in std_logic; 
		-- gpu_wdata : in std_logic_vector(DATA_WIDTH-1 downto 0); 
		-- gpu_wafull : out std_logic; 
		-- gpu_rpop : in std_logic; 
		-- gpu_rdata : out std_logic_vector(DATA_WIDTH-1 downto 0); 
		-- gpu_rdwdaddr : out std_logic_vector(1 downto 0); 
		-- gpu_rempty : out std_logic;
		-- -- CPU Interface port. 
		-- cpu_sel : in std_logic; 
		-- cpu_we : in std_logic; 
		-- cpu_addr : in std_logic_vector(ADDR_WIDTH-1 downto 0); 
		-- cpu_wdata : in std_logic_vector(DATA_WIDTH-1 downto 0); 
		-- cpu_wdone : out std_logic; 
		-- cpu_dval : out std_logic; 
		-- cpu_rdata : out std_logic_vector(DATA_WIDTH-1 downto 0); 
		-- -- ZBT interface 
		-- zbt_cen : out std_logic; 
		-- zbt_wen : out std_logic; 
		-- zbt_oen : out std_logic; 
		-- zbt_ts : out std_logic; 
		-- zbt_wdata : out std_logic_vector(DATA_WIDTH-1 downto 0); 
		-- zbt_addr : out std_logic_vector(ADDR_WIDTH-bit_width(DATA_WIDTH/BYTE_WIDTH)-1 downto 0); 
		-- zbt_rdata : in std_logic_vector(DATA_WIDTH-1 downto 0) 
-- );
-- end component; 


component matrix_transformation is 
generic ( 
		NORMALIZE : integer := 0; 
		MATRIX_MULT_LATENCY : integer := 4; 
		DIV_LATENCY : integer := 16; 
		FIFO_WIDTH : integer := 32; 
		FIFO_DEPTH : integer := 16; 
		FIFO_AFULL_THRESH : integer := 8; 
		FIFO_AEMPTY_THRESH : integer := 7; 
		FIFO_FALL_THROUGH : integer := 0 
);
port (
-- Reset/Clock
		reset : in std_logic;
		clk : in std_logic;
		-- Incomint points (18 bit floating point).
		x_in : in std_logic_vector(17 downto 0); 
		y_in : in std_logic_vector(17 downto 0); 
		z_in : in std_logic_vector(17 downto 0); 
		w_in : in std_logic_vector(17 downto 0); 
		color_in : in std_logic_vector(31 downto 0); 
		Tx_in : in std_logic_vector(31 downto 0); 
		Ty_in : in std_logic_vector(31 downto 0); 
		valid_in : in std_logic; 
		pix_ready : out std_logic;
		-- Matrix Access (18 bit floating point). 
		matrix_we : in std_logic; 
		matrix_waddr : in std_logic_vector(3 downto 0); 
		matrix_wdata : in std_logic_vector(71 downto 0);
		-- Control 
		enable : in std_logic; 
		eof : in std_logic;
		
		test_pop : out std_logic;
      test_data : out std_logic_vector(71 downto 0);
		
		prog_full : out std_logic;
      prog_empty : out std_logic;
      empty : out std_logic;
      full : out std_logic; 
		
      wr_ack : out std_logic; 
      valid :  out std_logic;		
		 
		-- Output Integers, a line or edge. 
		x_out : out std_logic_vector(17 downto 0); 
		y_out : out std_logic_vector(17 downto 0); 
		z_out : out std_logic_vector(17 downto 0); 
		w_out : out std_logic_vector(17 downto 0); 
		color_out : out std_logic_vector(31 downto 0); 
		Tx_out : out std_logic_vector(31 downto 0); 
		Ty_out : out std_logic_vector(31 downto 0); 
		valid_out : out std_logic; 
		raster_rdy: in std_logic
);
end component;


component line_creator is
generic ( 
X_PIX_WIDTH : integer := 320; 
Y_PIX_WIDTH : integer := 240 
);
port (
-- Reset/Clock 
	reset : in std_logic; 
	clk : in std_logic;
	-- Incomint points (18 bit floating point).
	x_in : in std_logic_vector(17 downto 0); 
	y_in : in std_logic_vector(17 downto 0); 
	z_in : in std_logic_vector(17 downto 0);
	color_in : in std_logic_vector(31 downto 0); 
	Tx_in : in std_logic_vector(31 downto 0); 
	Ty_in : in std_logic_vector(31 downto 0); 
	valid_in : in std_logic; 
	pix_ready : out std_logic;
	-- Control 
	enable : in std_logic;
	eof : in std_logic;
	
		test_pop : out std_logic;
      test_data : out std_logic_vector(35 downto 0);
		
		prog_full : out std_logic;
      prog_empty : out std_logic;
      empty : out std_logic;
      full : out std_logic; 
		
      wr_ack : out std_logic; 
      valid :  out std_logic;	
	
	-- Output Integers, a line or edge. 
	pix_data_o : out std_logic_vector(96 downto 0);
	-- v0_reg_o: out std_logic_vector(96 downto 0);
	-- v1_reg_o: out std_logic_vector(96 downto 0);
	-- v2_reg_o: out std_logic_vector(96 downto 0);
	-- x0_out : out std_logic_vector(bit_width(X_PIX_WIDTH)-1 downto 0); 
	-- y0_out : out std_logic_vector(bit_width(Y_PIX_WIDTH)-1 downto 0); 
	-- x1_out : out std_logic_vector(bit_width(X_PIX_WIDTH)-1 downto 0); 
	-- y1_out : out std_logic_vector(bit_width(Y_PIX_WIDTH)-1 downto 0); 
	-- color_out : out std_logic_vector(17 downto 0); 
	valid_out : out std_logic; 
	raster_rdy: in std_logic 
);
end component;

--- hua xian brashen model 


-- component line_drawler is
-- generic ( 
	 -- X_PIX_WIDTH : integer := 320; 
	 -- Y_PIX_WIDTH : integer := 240 
-- );
-- port (
-- -- Reset/Clock
	-- reset : in std_logic; 
	-- clk : in std_logic;
	-- -- Line Inputs.
	-- x0 : in std_logic_vector(bit_width(X_PIX_WIDTH)-1 downto 0); 
	-- x1 : in std_logic_vector(bit_width(X_PIX_WIDTH)-1 downto 0); 
	-- y0 : in std_logic_vector(bit_width(Y_PIX_WIDTH)-1 downto 0); 
	-- y1 : in std_logic_vector(bit_width(Y_PIX_WIDTH)-1 downto 0); 
	-- color : in std_logic_vector(17 downto 0); 
	-- pix_valid : in std_logic; 
	-- pix_ready : out std_logic;
	-- -- Control
	-- background : in std_logic_vector(35 downto 0); 
	-- enable : in std_logic; 
	-- eof : in std_logic;
	-- -- Memory Outputs
	-- gpu_req : out std_logic; 
	-- gpu_rnw : out std_logic; 
	-- gpu_afull : in std_logic; 
	-- gpu_addr : out std_logic_vector(18 downto 0); 
	-- gpu_wpush : out std_logic; 
	-- gpu_wdata : out std_logic_vector(35 downto 0); 
   -- gpu_wafull : in std_logic
-- );
-- end component;

component raster_sys is
port (
-- Reset/Clock
	sys_clk_pin : in std_logic;
	clk : out std_logic;
	-- vga_clk : in std_logic;
	nrst_done : in std_logic; 
	Ver_Tex : in std_logic;
	Clc_scr : in std_logic;
	-- Line Inputs.
	pix_valid : in std_logic; 
	pix_ready : out std_logic;
	pix_data : in std_logic_vector(96 downto 0);
	-- v0_reg_i : in std_logic_vector(96 downto 0);
	-- v1_reg_i : in std_logic_vector(96 downto 0);
	-- v2_reg_i : in std_logic_vector(96 downto 0);
	-- x0 : in std_logic_vector(8 downto 0); 
	-- y0 : in std_logic_vector(7 downto 0); 
	-- color : in std_logic_vector(17 downto 0); 

	-- Control
	background : in std_logic_vector(35 downto 0); 
	enable : in std_logic; 
	eof : out std_logic;
	
	sda_pin : out std_logic;
	scl_pin : out	std_logic;
	done : out	std_logic;
	
	dvi_d : out std_logic_vector(11 downto 0);
	dvi_h : out std_logic;
	dvi_v : out std_logic;
	dvi_de : out std_logic;
	dvi_xclk_n : out std_logic;
	dvi_xclk_p : out std_logic
);
end component;


-- component clipping_2d is
-- port (
		-- -- Reset/Clock
		-- reset : in std_logic; 
		-- clk : in std_logic;
		-- -- Control
		-- enable : in std_logic; 
		-- eof : in std_logic;
		-- -- Incomint points (18 bit floating point). 
		-- x_in : in std_logic_vector(17 downto 0); 
		-- y_in : in std_logic_vector(17 downto 0); 
		-- z_in : in std_logic_vector(17 downto 0); 
		-- color_in : in std_logic_vector(17 downto 0); 
		-- valid_in : in std_logic; 
		-- pix_in_ready : out std_logic;
		-- -- Window singals. 
		-- zmax : in std_logic_vector(17 downto 0);
		-- -- Output Integers, a line or edge. 
		-- x_out : out std_logic_vector(17 downto 0); 
		-- y_out : out std_logic_vector(17 downto 0); 
		-- z_out : out std_logic_vector(17 downto 0); 
		-- color_out : out std_logic_vector(17 downto 0); 
		-- valid_out : out std_logic; 
		-- pix_out_rdy : in std_logic
-- );
-- end component;


-- component icon is
  -- port (

    -- CONTROL0 : inout STD_LOGIC_VECTOR ( 35 downto 0 ); 
    -- CONTROL1 : inout STD_LOGIC_VECTOR ( 35 downto 0 )     
  -- );
-- end component ;

-- component ila is 
  -- port (
    -- CLK : in STD_LOGIC := 'X'; 
    -- CONTROL : inout STD_LOGIC_VECTOR ( 35 downto 0 ); 
    -- TRIG0 : in STD_LOGIC_VECTOR ( 19 downto 0 ); 
    -- DATA : in STD_LOGIC_VECTOR ( 35 downto 0 ) 
  -- );
-- end component ;

--component ila_a is 
--  port (
--    CLK : in STD_LOGIC := 'X'; 
--    CONTROL : inout STD_LOGIC_VECTOR ( 35 downto 0 ); 
--    TRIG0 : in STD_LOGIC_VECTOR ( 113 downto 0 ) 
--  );
--end component;
--
--component ila_line is 
--  port (
--    CLK : in STD_LOGIC := 'X'; 
--    CONTROL : inout STD_LOGIC_VECTOR ( 35 downto 0 ); 
--    TRIG0 : in STD_LOGIC_VECTOR ( 56 downto 0 ) 
--  );
--end component;


signal monitor_data0: STD_LOGIC_VECTOR ( 151 downto 0 );
signal monitor_data1: STD_LOGIC_VECTOR ( 151 downto 0 );
signal monitor_data2: STD_LOGIC_VECTOR ( 151 downto 0 );
signal monitor_data3: STD_LOGIC_VECTOR ( 151 downto 0 );
signal monitor_data4: STD_LOGIC_VECTOR ( 151 downto 0 );
signal monitor_data5: STD_LOGIC_VECTOR ( 113 downto 0 );
signal monitor_data6: STD_LOGIC_VECTOR ( 56 downto 0 );
signal jiance : STD_LOGIC_VECTOR ( 19 downto 0 );
signal MONITOR_GPU : STD_LOGIC_VECTOR ( 19 downto 0 );

signal ila_0_trig0 : STD_LOGIC_VECTOR ( 0 downto 0 ); 
signal ila_0_trig1 : STD_LOGIC_VECTOR ( 0 downto 0 ); 
signal ila_0_trig2 : STD_LOGIC_VECTOR ( 0 downto 0 ); 
signal ila_0_trig3 : STD_LOGIC_VECTOR ( 0 downto 0 ); 
--signal monitor_data1: STD_LOGIC_VECTOR ( 71 downto 0 );

signal test_pop0 : std_logic; 
signal test_pop1 : std_logic; 
signal test_pop2 : std_logic; 
signal test_pop3 : std_logic; 
signal test_pop4 : std_logic; 

signal test_data0: STD_LOGIC_VECTOR ( 71 downto 0 );
signal test_data1: STD_LOGIC_VECTOR ( 71 downto 0 );
signal test_data2: STD_LOGIC_VECTOR ( 71 downto 0 );
signal test_data3: STD_LOGIC_VECTOR ( 71 downto 0 );
signal test_data4: STD_LOGIC_VECTOR ( 35 downto 0 );

signal prog_full0 : std_logic;
signal prog_full1 : std_logic;		
signal prog_full2 : std_logic;
signal prog_full3 : std_logic;
signal prog_full4 : std_logic;

signal prog_empty0 : std_logic;
signal prog_empty1 : std_logic;
signal prog_empty2 : std_logic;
signal prog_empty3 : std_logic;
signal prog_empty4 : std_logic;

signal empty0 : std_logic;
signal empty1 : std_logic;
signal empty2 : std_logic;
signal empty3 : std_logic;
signal empty4 : std_logic;

signal full0 : std_logic;
signal full1 : std_logic;
signal full2 : std_logic;
signal full3 : std_logic;
signal full4 : std_logic;

signal wr_ack0 : std_logic;
signal wr_ack1 : std_logic;
signal wr_ack2 : std_logic;
signal wr_ack3 : std_logic;
signal wr_ack4 : std_logic;

signal valid0 : std_logic;
signal valid1 : std_logic;
signal valid2 : std_logic;
signal valid3 : std_logic;
signal valid4 : std_logic;



-- signal CONTROL0 : STD_LOGIC_VECTOR ( 35 downto 0 ); 
-- signal CONTROL1 : STD_LOGIC_VECTOR ( 35 downto 0 ); 
-- signal CONTROL2 : STD_LOGIC_VECTOR ( 35 downto 0 ); 
-- signal CONTROL3 : STD_LOGIC_VECTOR ( 35 downto 0 ); 
-- signal CONTROL4 : STD_LOGIC_VECTOR ( 35 downto 0 ); 
-- signal CONTROL5 : STD_LOGIC_VECTOR ( 35 downto 0 ); 
-- signal CONTROL6 : STD_LOGIC_VECTOR ( 35 downto 0 ); 


signal reset_n : std_logic; 
signal vga_req : std_logic; 
signal vga_afull : std_logic; 
signal vga_addr : std_logic_vector(18 downto 0); 
signal vga_rpop : std_logic; 
signal vga_rdata : std_logic_vector(35 downto 0); 
signal vga_rempty : std_logic; 
signal vga_rafull : std_logic; 
signal vga_fifo_afull : std_logic; 
signal vga_data_val : std_logic; 
signal vga_data : std_logic_vector(23 downto 0); 
signal vga_eof : std_logic; 
signal vga_vsync_n : std_logic; 
signal vga_hsync_n : std_logic; 
signal vga_red : std_logic_vector(7 downto 0); 
signal vga_green : std_logic_vector(7 downto 0); 
signal vga_blue : std_logic_vector(7 downto 0); 
signal vga_valid : std_logic; 
signal ground : std_logic_vector(35 downto 0) := (others => '0');

signal vga_eof_meta : std_logic; 
signal vga_eof_sync : std_logic; 
signal vga_eof_sync_d : std_logic; 
signal sys_eof : std_logic; 

signal gpu_req : std_logic; 
signal gpu_rnw : std_logic; 
signal gpu_afull : std_logic; 
signal gpu_addr : std_logic_vector(18 downto 0); 
signal gpu_wpush : std_logic; 
signal gpu_wdata : std_logic_vector(35 downto 0); 
signal gpu_wafull : std_logic; 

signal float32_in_val_i : std_logic_vector(8 downto 0); 
signal float32_in_data_i : std_logic_vector((9*32)-1 downto 0); 
signal float18_out_val_i : std_logic_vector(8 downto 0); 
signal float18_out_data_i : std_logic_vector((9*18)-1 downto 0); 

signal zmax_float18 : std_logic_vector(17 downto 0); 
signal matrix_wdata_float18 : std_logic_vector(71 downto 0); 
signal y_in_float18 : std_logic_vector(17 downto 0); 
signal x_in_float18 : std_logic_vector(17 downto 0); 
signal z_in_float18 : std_logic_vector(17 downto 0); 
signal w_in_float18 : std_logic_vector(17 downto 0);

signal matrix_we_dly : std_logic_vector(2 downto 0); 
type matrix_sel_dly_t is array (0 to 2) of std_logic_vector(1 downto 0); 
signal matrix_sel_dly : matrix_sel_dly_t;
type matrix_waddr_dly_t is array (0 to 2) of std_logic_vector(3 downto 0); 
signal matrix_waddr_dly : matrix_waddr_dly_t; 
signal matrix_world_we : std_logic; 
--signal matrix_world_we :std_logic_vector(0 downto 0); 
signal matrix_view_we : std_logic; 
signal matrix_projection_we : std_logic; 
signal matrix_screen_we : std_logic;

signal pix_valid_dly : std_logic_vector(2 downto 0); 
type color_dly_t is array (0 to 2) of std_logic_vector(31 downto 0); 
signal color_dly : color_dly_t;

type Tx_dly_t is array (0 to 2) of std_logic_vector(31 downto 0); 
signal Tx_dly : Tx_dly_t;
type Ty_dly_t is array (0 to 2) of std_logic_vector(31 downto 0); 
signal Ty_dly : Ty_dly_t;

signal x_world : std_logic_vector(17 downto 0); 
signal y_world : std_logic_vector(17 downto 0); 
signal z_world : std_logic_vector(17 downto 0); 
signal w_world : std_logic_vector(17 downto 0); 
signal color_world : std_logic_vector(31 downto 0); 
signal Tx_world : std_logic_vector(31 downto 0);
signal Ty_world : std_logic_vector(31 downto 0);
signal valid_world : std_logic; 
signal pix_ready_world : std_logic;

signal x_view : std_logic_vector(17 downto 0); 
signal y_view : std_logic_vector(17 downto 0); 
signal z_view : std_logic_vector(17 downto 0); 
signal w_view : std_logic_vector(17 downto 0); 
signal color_view : std_logic_vector(31 downto 0); 
signal Tx_view : std_logic_vector(31 downto 0);
signal Ty_view : std_logic_vector(31 downto 0);
signal valid_view : std_logic; 
signal pix_ready_view : std_logic;

signal x_projection : std_logic_vector(17 downto 0); 
signal y_projection : std_logic_vector(17 downto 0); 
signal z_projection : std_logic_vector(17 downto 0); 
signal w_projection : std_logic_vector(17 downto 0); 
signal color_projection : std_logic_vector(31 downto 0); 
signal Tx_projection : std_logic_vector(31 downto 0);
signal Ty_projection : std_logic_vector(31 downto 0);
signal valid_projection : std_logic; 
signal pix_ready_projection : std_logic;

signal x_clipping : std_logic_vector(17 downto 0); 
signal y_clipping : std_logic_vector(17 downto 0); 
signal z_clipping : std_logic_vector(17 downto 0); 
signal w_clipping : std_logic_vector(17 downto 0); 
signal color_clipping : std_logic_vector(31 downto 0); 
signal Tx_clipping : std_logic_vector(31 downto 0);
signal Ty_clipping : std_logic_vector(31 downto 0);
signal valid_clipping : std_logic; 
signal pix_ready_clipping : std_logic;

signal x_screen : std_logic_vector(17 downto 0); 
signal y_screen : std_logic_vector(17 downto 0); 
signal z_screen : std_logic_vector(17 downto 0); 
signal w_screen : std_logic_vector(17 downto 0); 
signal color_screen : std_logic_vector(31 downto 0); 
signal Tx_screen : std_logic_vector(31 downto 0);
signal Ty_screen : std_logic_vector(31 downto 0);
signal valid_screen : std_logic; 
signal pix_ready_screen : std_logic;

signal pix_data : std_logic_vector(96 downto 0);
-- signal v0_reg : std_logic_vector(96 downto 0);
-- signal v1_reg : std_logic_vector(96 downto 0);
-- signal v2_reg : std_logic_vector(96 downto 0);
signal x0_line_creator : std_logic_vector(8 downto 0); 
signal x1_line_creator : std_logic_vector(8 downto 0); 
signal y0_line_creator : std_logic_vector(7 downto 0); 
signal y1_line_creator : std_logic_vector(7 downto 0); 
signal color_line_creator : std_logic_vector(31 downto 0); 
signal Tx_line_creator : std_logic_vector(31 downto 0);
signal Ty_line_creator : std_logic_vector(31 downto 0);
signal valid_line_creator : std_logic; 
signal pix_ready_line_creator : std_logic;

signal pix_ready_line : std_logic;




signal vsync_n_d : std_logic;
signal hsync_n_d : std_logic;
signal red_value_d : std_logic_vector(7 downto 0);
signal green_value_d : std_logic_vector(7 downto 0);
signal blue_value_d : std_logic_vector(7 downto 0);
signal vga_valid_d : std_logic;

signal pixel_full_d : std_logic;
signal pixel_empty_d : std_logic;
signal pixel_afull_d : std_logic;
signal pixel_aempty_d : std_logic;


-- signal	clk : std_logic;
signal	sys_clk : std_logic;





begin
reset_n <= not reset;
clk<=sys_clk;
 
-- sys_eof_sync : process(sys_clk,reset)  --wei xi tong shi zhong 
-- begin
-- if (reset = '1') then 
		-- vga_eof_meta <= '0'; 
		-- vga_eof_sync <= '0'; 
		-- vga_eof_sync_d <= '0'; 
		-- sys_eof <= '0';
-- elsif (sys_clk='1' and sys_clk'event) then
		-- vga_eof_meta <= vga_eof; 
		-- vga_eof_sync <= vga_eof_meta; 
		-- vga_eof_sync_d <= vga_eof_sync; 
		-- sys_eof <= '0'; 
-- if (vga_eof_sync = '1' and vga_eof_sync_d = '0') then 
      -- sys_eof <= '1';
   -- end if;
  -- end if;
-- end process;

-- eof_gen: process
-- begin
	-- sys_eof<='0';
	-- wait for 3000 ns;
	-- sys_eof<='1';
	-- wait for 50 ns;
	-- sys_eof<='0';
	-- wait;
-- end process;

eof <= sys_eof;

-- This process decodes the selects from the matrix address 
-- and sets the proper write enable for the matrix being edited. 
-- I don't think this needs to be register, logic should be fast enough 
-- at 100Mhz.
matrix_we_sel_dec : process(matrix_we_dly(2),matrix_sel_dly(2))
begin
		matrix_world_we <= '0'; 
		matrix_view_we <= '0'; 
		matrix_projection_we <= '0'; 
		matrix_screen_we <= '0';
		if (matrix_we_dly(2) = '1') then
			case matrix_sel_dly(2) is
				when "00" => matrix_world_we <= '1'; 
				when "01" => matrix_view_we <= '1'; 
				when "10" => matrix_projection_we <= '1'; 
				when "11" => matrix_screen_we <= '1';
				when others => NULL;
         end case;
     end if; 
end process;

pix_valid_dly_prc : process(sys_clk,reset)
begin 
  if (reset = '1') then 
		 pix_valid_dly <= (others => '0'); 
		 color_dly <= (others => (others => '0'));
		 Tx_dly <= (others => (others => '0'));
		 Ty_dly <= (others => (others => '0'));
		 matrix_we_dly <= (others => '0'); 
		 matrix_waddr_dly <= (others => (others => '0')); 
		 matrix_sel_dly <= (others => (others => '0')); 
  elsif (sys_clk = '1' and sys_clk'event) then 
		 pix_valid_dly(0) <= pix_valid; 
		 color_dly(0) <= color; 
		 Tx_dly(0) <= Tx;
		 Ty_dly(0) <= Ty;
		 matrix_we_dly(0) <= matrix_we; 
		 matrix_waddr_dly(0) <= matrix_waddr; 
		 matrix_sel_dly(0) <= matrix_sel; 
		 for i in 1 to 2 loop 
			 pix_valid_dly(i) <= pix_valid_dly(i-1); 
			 color_dly(i) <= color_dly(i-1); 
			 Tx_dly(i) <= Tx_dly(i-1);
			 Ty_dly(i) <= Ty_dly(i-1);
			 matrix_we_dly(i) <= matrix_we_dly(i-1); 
			 matrix_waddr_dly(i) <= matrix_waddr_dly(i-1); 
			 matrix_sel_dly(i) <= matrix_sel_dly(i-1); 
       end loop; 
    end if; 
end process; 


float32_float18_conv_0 : float32to18
generic map (
 NUM_OF_ENTRIES => 9 
 )
 port map (
		 reset => reset, 
		 clk => sys_clk, 
		 operation_nd_9 => float32_in_val_i, 
		 a_9 => float32_in_data_i, 
		 rdy_9 => float18_out_val_i, 
		 result_9 => float18_out_data_i, 
		 underflow_9 => open, 
		 overflow_9 => open
 );

 float32_in_val_i <= (others => '1'); 
 float32_in_data_i <= zmax & matrix_wdata & w_in & z_in & y_in & x_in;
 
 
 
 
 zmax_float18 <= float18_out_data_i((9*18)-1 downto 8*18); 
 matrix_wdata_float18 <= float18_out_data_i((8*18)-1 downto 4*18); 
 
 
 w_in_float18 <= float18_out_data_i((4*18)-1 downto 3*18); 
 z_in_float18 <= float18_out_data_i((3*18)-1 downto 2*18); 
 y_in_float18 <= float18_out_data_i((2*18)-1 downto 1*18); 
 x_in_float18 <= float18_out_data_i((1*18)-1 downto 0*18);

 
    





-- instance_dvi_intf : dvi_intf
-- port map 
-- (
	-- clk => vga_clk,
	-- reset_n => reset_n,
	-- enable => vga_enable,
	-- -- VGA input signals.
	-- vga_vsync_n => vsync_n_d,
	-- vga_hsync_n => hsync_n_d,
	-- vga_red => red_value_d,
	-- vga_green => green_value_d,
	-- vga_blue => blue_value_d,
	-- vga_valid => vga_valid_d,
	-- -- Display driver and fifo status
	-- dvi_hsync_n => dvi_hsync_n,
	-- dvi_vsync_n => dvi_vsync_n,
	-- dvi_data_en => dvi_data_en,
	-- dvi_data1 => dvi_data1,
	-- dvi_data2 => dvi_data2
-- );


-- instance_vga_ctrl : vga_ctrl
-- port map (
	-- -- Clock, reset and enable signals
	-- vga_clk => vga_clk,
	-- reset_n => reset_n,
	-- vga_enable => vga_enable,
	-- -- Input pixel data.
	-- pixel_data_in => vga_data,
	-- pixel_wr_req => vga_data_val,
	-- -- Signals to the display
	-- vsync_n => vsync_n_d,
	-- hsync_n => hsync_n_d,
	-- red_value => red_value_d,
	-- green_value => green_value_d,
	-- blue_value => blue_value_d,
	-- vga_valid => vga_valid_d,
	-- -- Display driver and fifo status
	-- pixel_fifo_full => open,--pixel_fifo_full,
	-- pixel_fifo_empty => open,--pixel_fifo_empty,
	-- pixel_fifo_afull => vga_fifo_afull,
	-- pixel_fifo_aempty => open,--pixel_fifo_aempty,
	-- pixel_eof => vga_eof --pixel_eof
-- );


 -- u_vga_frame_reader_0 : vga_frame_reader 
 -- port map (
	 -- vga_clk => vga_clk, 
	 -- reset_n => reset_n, 
	 -- vga_fifo_afull => vga_fifo_afull, 
	 -- vga_data_val => vga_data_val, 
	 -- vga_data => vga_data, 
	 -- vga_eof => vga_eof, 
	 -- mem_req => vga_req, 
	 -- mem_afull => vga_afull, 
	 -- mem_addr => vga_addr, 
	 -- mem_rpop => vga_rpop, 
	 -- mem_rdata =>  vga_rdata, 
	 -- mem_rempty => vga_rempty, 
	 -- mem_rafull => vga_rafull 
 -- );
 
  -- Send ready signal back to cpu.
 pix_ready <= pix_ready_world;

 world_translation_0 : matrix_transformation 
 generic map ( 
	 NORMALIZE => 0, 
	 MATRIX_MULT_LATENCY => 4, 
	 DIV_LATENCY => 16, 
	 FIFO_WIDTH => 18*5, 
	 FIFO_DEPTH => 16, 
	 FIFO_AFULL_THRESH => 8, 
	 FIFO_AEMPTY_THRESH => 7, 
	 FIFO_FALL_THROUGH => 0 
 )
 port map ( 
	 reset => reset, 
	 clk => sys_clk, 
	 x_in => x_in_float18, 
	 y_in => y_in_float18, 
	 z_in => z_in_float18, 
	 w_in => w_in_float18, 
	 color_in => color_dly(2), 
	 Tx_in => Tx_dly(2),
	 Ty_in => Ty_dly(2),
	 valid_in => pix_valid_dly(2), 
	 pix_ready => pix_ready_world,
	 matrix_we => matrix_world_we, 
	 matrix_waddr => matrix_waddr_dly(2), 
	 matrix_wdata => matrix_wdata_float18, 
	 enable => gpu_enable, 
	 eof => sys_eof, 
	 
	 test_pop  => test_pop0,
    test_data => test_data0,
	 prog_full => prog_full0,
    prog_empty => prog_empty0,
    empty => empty0,
    full => full0,
	 wr_ack => wr_ack0,
    valid => valid0, 

	 x_out => x_world, 
	 y_out => y_world, 
	 z_out => z_world, 
	 w_out => w_world, 
	 color_out => color_world, 
	 Tx_out => Tx_world,
	 Ty_out => Ty_world,
	 valid_out => valid_world,
	 raster_rdy => pix_ready_view
 );
 
 
 view_translation_0 : matrix_transformation 
 generic map (
		 NORMALIZE => 0, 
		 MATRIX_MULT_LATENCY => 4, 
		 DIV_LATENCY => 16, 
		 FIFO_WIDTH => 18*5, 
		 FIFO_DEPTH => 16, 
		 FIFO_AFULL_THRESH => 8, 
		 FIFO_AEMPTY_THRESH => 7, 
		 FIFO_FALL_THROUGH => 0
 )
 
 port map (
		 reset => reset, 
		 clk => sys_clk,
		 x_in => x_world, 
		 y_in => y_world, 
		 z_in => z_world, 
		 w_in => w_world, 
		 color_in => color_world, 
		 Tx_in => Tx_world,
		 Ty_in => Ty_world,
		 valid_in => valid_world, 
		 pix_ready => pix_ready_view, 
		 matrix_we => matrix_view_we, 
		 matrix_waddr => matrix_waddr_dly(2), 
		 matrix_wdata => matrix_wdata_float18,
		 enable => gpu_enable, 
		 eof => sys_eof, 
		 
		 test_pop => test_pop1,
       test_data => test_data1,
		 prog_full => prog_full1,
       prog_empty => prog_empty1,
       empty => empty1,
       full => full1,
	    wr_ack => wr_ack1,
       valid => valid1,  

 
 
		 x_out => x_view, 
		 y_out => y_view, 
		 z_out => z_view, 
		 w_out => w_view, 
		 Tx_out => Tx_view,
		 Ty_out => Ty_view,
		 color_out => color_view, 
		 valid_out => valid_view, 
		 raster_rdy => pix_ready_projection
 );


 -- clipping_logic_0 : clipping_2d
 -- port map (
		 -- reset => reset, 
		 -- clk => sys_clk, 
		 -- enable => gpu_enable, 
		 -- eof => sys_eof, 
		 -- x_in => x_view, 
		 -- y_in => y_view, 
		 -- z_in => z_view, 
		 -- color_in => color_view, 
		 -- valid_in => valid_view, 
		 -- pix_in_ready => pix_ready_clipping, 
		 -- zmax => zmax_float18, 
		 -- x_out => x_clipping,
		 -- y_out => y_clipping, 
		 -- z_out => z_clipping, 
		 -- color_out => color_clipping, 
		 -- valid_out => valid_clipping, 
		 -- pix_out_rdy => pix_ready_projection
 -- );
 -- w_clipping <= "00" & x"F000";


w_clipping <= "00" & x"F000";
projection_translation_0 : matrix_transformation
 generic map ( 
		 NORMALIZE => 0, 
		 MATRIX_MULT_LATENCY => 4, 
		 DIV_LATENCY => 16, 
		 FIFO_WIDTH => 18*5, 
		 FIFO_DEPTH => 16, 
		 FIFO_AFULL_THRESH => 8, 
		 FIFO_AEMPTY_THRESH => 7, 
		 FIFO_FALL_THROUGH => 0 
 )
  port map (
		 reset => reset, 
		 clk => sys_clk, 
		 x_in => x_view, 
		 y_in => y_view, 
		 z_in => z_view, 
		 w_in => w_clipping, 
		 color_in => color_view, 
		 Tx_in => Tx_view,
		 Ty_in => Ty_view,
		 valid_in => valid_view, 
		 pix_ready => pix_ready_projection, 
		 matrix_we => matrix_projection_we, 
		 matrix_waddr => matrix_waddr_dly(2), 
		 matrix_wdata => matrix_wdata_float18, 
		 enable => gpu_enable, 
		 eof => sys_eof, 
		 
		 test_pop => test_pop2,
       test_data => test_data2,
		 prog_full => prog_full2,
       prog_empty => prog_empty2,
       empty => empty2,
       full => full2,
	    wr_ack => wr_ack2,
       valid => valid2, 
 
		 x_out => x_projection, 
		 y_out => y_projection, 
		 z_out => z_projection, 
		 w_out => w_projection, 
		 color_out => color_projection, 
		 Tx_out => Tx_projection,
		 Ty_out => Ty_projection,
		 valid_out => valid_projection, 
		 raster_rdy => pix_ready_screen 
 );
 
 
screen_translation_0 : matrix_transformation 
generic map (
		 NORMALIZE => 0, 
		 MATRIX_MULT_LATENCY => 4, 
		 DIV_LATENCY => 16, 
		 FIFO_WIDTH => 18*5, 
		 FIFO_DEPTH => 16, 
		 FIFO_AFULL_THRESH => 8, 
		 FIFO_AEMPTY_THRESH => 7, 
		 FIFO_FALL_THROUGH => 0 
 ) 
 port map ( 
		 reset => reset, 
		 clk => sys_clk, 
		 x_in =>x_projection, -- x_in_float18, --
		 y_in => y_projection, --y_in_float18, --
		 z_in => z_projection, --z_in_float18, --
		 w_in =>w_projection, -- w_in_float18, --
		 color_in => color_projection, --color_dly(2), --
		 Tx_in => Tx_projection,--Tx_dly(2), --
		 Ty_in => Ty_projection,--ty_dly(2), --
		 valid_in => valid_projection, --pix_valid_dly(2), --
		 pix_ready => pix_ready_screen, --pix_ready_world, --
		 matrix_we => matrix_screen_we, 
		 matrix_waddr => matrix_waddr_dly(2), 
		 matrix_wdata => matrix_wdata_float18, 
		 enable => gpu_enable, 
		 eof => sys_eof, 
		 
		 test_pop => test_pop3,
       test_data => test_data3,
		 prog_full => prog_full3,
       prog_empty => prog_empty3,
       empty => empty3,
       full => full3,
	    wr_ack => wr_ack3,
       valid => valid3, 
		 
		 x_out => x_screen, 
		 y_out => y_screen, 
		 z_out => z_screen, 
		 w_out => w_screen, 
		 color_out => color_screen, 
		 Tx_out => Tx_screen,
		 Ty_out => Ty_screen,
		 valid_out => valid_screen, 
		 raster_rdy => pix_ready_line_creator 
 );



 line_creator_0 : line_creator 
 generic map (
	 X_PIX_WIDTH => 320, 
	 Y_PIX_WIDTH => 240 
 ) 
 port map (
	 reset => reset, 
	 clk => sys_clk, 
	 x_in => x_screen, 
	 y_in => y_screen, 
	 z_in => z_screen,
	 color_in => color_screen, 
	 Tx_in => Tx_screen,
	 Ty_in => Ty_screen,
	 valid_in => valid_screen, 
	 pix_ready => pix_ready_line_creator, 
	 enable => gpu_enable, 
    eof => sys_eof, 
	 
	 test_pop => test_pop4,
    test_data => test_data4,
	 prog_full => prog_full4,
    prog_empty => prog_empty4,
    empty => empty4,
    full => full4,
	 wr_ack => wr_ack4,
    valid => valid4, 
	 
	 pix_data_o=>pix_data,
	 -- v0_reg_o=>v0_reg,
	 -- v1_reg_o=>v1_reg,
	 -- v2_reg_o=>v2_reg,
	 -- x0_out => x0_line_creator, 
	 -- y0_out => y0_line_creator, 
	 -- x1_out => x1_line_creator, 
	 -- y1_out => y1_line_creator, 
	 -- color_out => color_line_creator, 
	 valid_out => valid_line_creator, 
	 raster_rdy => pix_ready_line 
 );




-- line_drawler_0 : line_drawler 
 -- generic map ( 
		 -- X_PIX_WIDTH => 320, 
		 -- Y_PIX_WIDTH => 240 
 -- ) 
 -- port map (
 -- -- Reset/Clock 
		 -- reset => reset, 
		 -- clk => sys_clk,
 -- -- Line Inputs. 
		 -- x0 => x0_line_creator, 
		 -- x1 => x1_line_creator, 
		 -- y0 => y0_line_creator, 
		 -- y1 => y1_line_creator, 
	    -- color => color_line_creator, 
	 -- -- color => b"11_1111_1111_1111_1111",
		 -- pix_valid => valid_line_creator, 
		 -- pix_ready => pix_ready_line, 
 -- -- Control
		-- background => background, 
		-- enable => gpu_enable, 
		-- eof => sys_eof, 
-- -- Memory Outputs 
		-- gpu_req => gpu_req, 
		-- gpu_rnw => gpu_rnw, 
		-- gpu_afull => gpu_afull, 
		-- gpu_addr => gpu_addr, 
		-- gpu_wpush => gpu_wpush, 
		-- gpu_wdata => gpu_wdata, 
		-- gpu_wafull => gpu_wafull 
-- );

raster_sys_0 : raster_sys 
 port map (
 -- Reset/Clock 
		sys_clk_pin=>sys_clk_pin,
		clk => sys_clk,
		-- vga_clk =>vga_clk,
		nrst_done => reset_n, 
		Ver_Tex => Ver_Tex,
		Clc_scr => Clc_scr,
		 
 -- Line Inputs. 
		-- v0_reg_i=>v0_reg,
		-- v1_reg_i=>v1_reg,
		-- v2_reg_i=>v2_reg,
		 -- x0 => x0_line_creator, 
		 -- y0 => y0_line_creator, 
	    -- color => color_line_creator, 
	 -- color => b"11_1111_1111_1111_1111",
		 pix_valid => valid_line_creator, 
		 pix_ready => pix_ready_line, 
		 pix_data => pix_data,
 -- Control
		background => background, 
		enable => gpu_enable, 
		eof => sys_eof, 
-- Memory Outputs 
		sda_pin =>sda_pin,
		scl_pin => scl_pin,
		done => done,
		dvi_d => dvi_d,
		dvi_h => dvi_h,
		dvi_v => dvi_v,
		dvi_de => dvi_de,
		dvi_xclk_n=>dvi_xclk_n,
		dvi_xclk_p=>dvi_xclk_p		
);


-- u_zbt_frame_intf_0 : zbt_frame_intf 
-- generic map (
	 -- ADDR_WIDTH => 20, 
	 -- BYTE_WIDTH => 9, 
	 -- DATA_WIDTH => 36 
 -- ) 
-- port map (
	 -- reset => reset, 
	 -- sys_clk => sys_clk, -- port_clk
	 -- zbt_clk => zbt_clk, 
	 -- vga_clk => vga_clk,
 -- -- New frame trigger signals. 
	 -- gpu_enable => gpu_enable, 
	 -- vga_eof => sys_eof, 
 -- -- VGA Read Only Port 
	 -- vga_req => vga_req, 
	 -- vga_afull => vga_afull, 
	 -- vga_addr => vga_addr, 
	 -- vga_rpop => vga_rpop, 
	 -- vga_rdata => vga_rdata, 
	 -- vga_rempty => vga_rempty, 
	 -- vga_rafull => vga_rafull,
 
 -- -- GPU Interface port 
	 -- gpu_req => gpu_req, 
	 -- gpu_afull => gpu_afull, 
	 -- gpu_size => ground(1 downto 0), 
	 -- gpu_addr => gpu_addr, 
	 -- gpu_rnw => gpu_rnw, 
	 -- gpu_wpush => gpu_wpush, 
	 -- gpu_wdata => gpu_wdata, 
	 -- gpu_wafull => gpu_wafull, 
	 -- gpu_rpop => '0', 
	 -- gpu_rdata => open, 
	 -- gpu_rdwdaddr => open, 
	 -- gpu_rempty => open,
 
 -- -- CPU Interface port.
	 -- cpu_sel => cpu_sel, 
	 -- cpu_we => cpu_we, 
	 -- cpu_addr => cpu_addr, 
	 -- cpu_wdata => cpu_wdata, 
	 -- cpu_wdone => cpu_wdone, 
	 -- cpu_dval => cpu_dval, 
	 -- cpu_rdata => cpu_rdata,
-- -- ZBT interface 
	-- zbt_cen => zbt_cen, 
	-- zbt_wen => zbt_wen, 
	-- zbt_oen => zbt_oen, 
	-- zbt_ts => zbt_ts, 
	-- zbt_wdata => zbt_wdata, 
	-- zbt_addr => zbt_addr, 
	-- zbt_rdata => zbt_rdata 
-- ); 

-- icon_first : icon 
-- port map (
    -- CONTROL0  => CONTROL0,
    -- CONTROL1  => CONTROL1

 -- );
 

 
--monitor_data0 <= matrix_wdata_float18 & w_in_float18 & z_in_float18 & y_in_float18 & x_in_float18 & w_world & z_world & y_world & x_world;
--monitor_data0 <= pix_valid_dly(2) & test_pop0 & prog_full0 & prog_empty0 & empty0 & full0 & wr_ack0 & valid0 & w_in_float18 & z_in_float18 & y_in_float18 & x_in_float18 & test_data0;--& w_world & z_world & y_world & x_world;

-- jiance <= vga_req & vga_addr;
-- MONITOR_GPU <= gpu_req & gpu_addr;
-- monitor_data0 <= pix_valid_dly(2) & valid_world & prog_full0 & prog_empty0 & empty0 & full0 & wr_ack0 & valid0 & w_in_float18 & z_in_float18 & y_in_float18 & x_in_float18 & w_world & z_world & y_world & x_world;
-- monitor_data1 <= valid_world & valid_view & prog_full1 & prog_empty1 & empty1 & full1 & wr_ack1 & valid1 & w_world & z_world & y_world & x_world & w_view & z_view & y_view & x_view;
-- monitor_data2 <= valid_view & valid_clipping & '1' & '1' & '1' & '1' & '1' & '1' & w_view & z_view & y_view & x_view & w_clipping & z_clipping & y_clipping & x_clipping;
-- monitor_data3 <= valid_clipping & valid_projection & prog_full2 & prog_empty2 & empty2 & full2 & wr_ack2 & valid2 & w_clipping & z_clipping & y_clipping & x_clipping  & w_projection & z_projection & y_projection & x_projection;
-- monitor_data4 <= valid_projection & valid_screen & prog_full3 & prog_empty3 & empty3 & full3 & wr_ack3 & valid3 & w_projection & z_projection & y_projection & x_projection & w_screen & z_screen & y_screen & x_screen;
-- monitor_data5 <= valid_screen & valid_line_creator & prog_full4 & prog_empty4 & empty4 & full4 & wr_ack4 & valid4 & w_screen & z_screen & y_screen & x_screen & x0_line_creator & y0_line_creator & x1_line_creator & y1_line_creator;
-- monitor_data6 <= gpu_req & gpu_rnw & gpu_addr & gpu_wdata;


 
-- ila_0 : ila 
-- port map (
    -- CLK  =>  vga_clk,
    -- CONTROL => CONTROL0,
	 -- TRIG0 =>  jiance,  
    -- DATA => vga_rdata
 -- );
 
-- --
-- ila_1 : ila 
-- port map (
    -- CLK  =>  sys_clk,
    -- CONTROL => CONTROL1,
    -- TRIG0 =>  MONITOR_GPU,
    -- DATA => gpu_wdata	 --pix_valid_dly(2),
 -- );
----
--ila_2 : ila 
--port map (
--    CLK  =>  sys_clk,
--    CONTROL => CONTROL2,
--    TRIG0 =>  monitor_data2  --pix_valid_dly(2),
-- );
---- 
--ila_3 : ila 
--port map (
--    CLK  =>  sys_clk,
--    CONTROL => CONTROL3,
--    TRIG0 =>  monitor_data3  --pix_valid_dly(2),
-- );
---- 
--ila_4 : ila 
--port map (
--    CLK  =>  sys_clk,
--    CONTROL => CONTROL4,
--    TRIG0 =>  monitor_data4  --pix_valid_dly(2),
-- );
----
--ila_5 : ila_a 
--port map (
--    CLK  =>  sys_clk,
--    CONTROL => CONTROL5,
--    TRIG0 =>  monitor_data5  --pix_valid_dly(2),
-- );
--
--ila_6 : ila_line
--port map (
--    CLK  =>  sys_clk,
--    CONTROL => CONTROL6,
--    TRIG0 =>  monitor_data6  --pix_valid_dly(2),
-- );



end Behavioral;

