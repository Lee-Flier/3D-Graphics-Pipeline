
--C.4 MATRIX MULTIPLIER WITH BUFFERING AND NORMILIZATION 
--This VHDL file adds a input fifo for data buffering and dividers for division by w. 
----------------------------------------------------------- 
-- Filename : matrix_transformation.vhd 
-- 
-- Date : Febuary 27 2008 
-- 
-- Author : James Warner 
-- 
-- Desc : This block attaches a input fifo to a 
-- 4x4 matrix multiplication. An options 
-- normilzation can be enable through 
-- generics. 
-- 
-- 
----------------------------------------------------------- 
 library ieee;
 use ieee.std_logic_1164.all;
 use ieee.std_logic_arith.all;
 use ieee.std_logic_unsigned.all;
 library work;

use work.gpu_pkg.all;
 entity matrix_transformation is 
 generic 
 ( 
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
 Ty_in: in std_logic_vector(31 downto 0);
 valid_in : in std_logic;
 pix_ready : out std_logic;
 -- Matrix Access (18 bit floating point). 
 matrix_we : in std_logic;
 matrix_waddr : in std_logic_vector(3 downto 0);
 matrix_wdata : in std_logic_vector(71 downto 0);
 -- Control 
 enable : in std_logic;
 eof : in std_logic;
 -- test 
 test_pop : out std_logic;
 test_data : out std_logic_vector(71 downto 0);


 -- Status flags. 
 prog_full : out std_logic;
 prog_empty : out std_logic;
 empty : out std_logic;
 full : out std_logic; 
 
 wr_ack : out std_logic; 
 valid : out std_logic; 

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
 end matrix_transformation;
 
 
 architecture hdl of matrix_transformation is 
 
 component matrix_mult4x4 
 port( 
 -- Clock, reset and enable signals 
 clk : in std_logic;
 reset : in std_logic;
 -- Vector Inputs. 
 vector_avail : in std_logic;
 vector_pop : out std_logic;
 
 vector_data : in std_logic_vector(18*4-1 downto 0);
 -- Matrix Inputs. 
 matrix_we : in std_logic;
 matrix_waddr : in std_logic_vector(3 downto 0);
 matrix_wdata : in std_logic_vector(18*4-1 downto 0);
 matrix_ready : in std_logic;
 -- Matrix Outputs. 
 
 rslt_valid : out std_logic;
 rslt_data : out std_logic_vector(18*4-1 downto 0);
 rslt_bp : in std_logic );
 end component;
 -- Floating point Division. 
 component float18_div_translation is 
 port ( 
	 a : in std_logic_vector(17 downto 0);
	 b : in std_logic_vector(17 downto 0);
	 operation_nd : in std_logic;
	 operation_rfd : out std_logic;
	 clk : in std_logic;
	 result : out std_logic_vector(17 downto 0);
	 underflow : out std_logic;
	 overflow : out std_logic;
	 invalid_op : out std_logic;
	 divide_by_zero : out std_logic;
	 rdy : out std_logic
 );
 end component;
 -- Single fifo clk. 
 

 component fifo_translation is
 port (
	 -- Clock and reset 
	 rst : in std_logic;
	 clk : in std_logic;
	 -- Control signals 
	 wr_en : in std_logic;
	 rd_en : in std_logic;
	 -- Read write data 
	 din : in std_logic_vector(167 downto 0);
	 dout : out std_logic_vector(167 downto 0);
	 -- Status flags. 
	 prog_full : out std_logic;
	 prog_empty : out std_logic;
	 empty : out std_logic;
	 full : out std_logic;
	 valid: OUT std_logic;
	 wr_ack: OUT std_logic 
);
 end component;
 
 
 
 
 
 signal vector_pop : std_logic;
 signal vector_data : std_logic_vector(18*4-1 downto 0);
 signal vector_avail : std_logic;
 signal pix_fifo_push : std_logic;
 signal pix_fifo_pop : std_logic;
 signal pix_fifo_wdata : std_logic_vector(167 downto 0); --18*4+32
 signal pix_fifo_rdata : std_logic_vector(167 downto 0);
 signal pix_fifo_afull : std_logic;
 signal pix_fifo_aempty : std_logic;
 signal pix_fifo_empty : std_logic;
 signal pix_fifo_full : std_logic;
 type color_pipe_dly_t is array (0 to MATRIX_MULT_LATENCY-1) of std_logic_vector(31 downto 0);
 signal color_pipe_dly : color_pipe_dly_t;
  type Tx_pipe_dly_t is array (0 to MATRIX_MULT_LATENCY-1) of std_logic_vector(31 downto 0);
 signal Tx_pipe_dly : Tx_pipe_dly_t;
  type Ty_pipe_dly_t is array (0 to MATRIX_MULT_LATENCY-1) of std_logic_vector(31 downto 0);
 signal Ty_pipe_dly : Ty_pipe_dly_t;
 signal divx_rslt : std_logic_vector(17 downto 0);
 signal divx_underflow : std_logic;
 signal divx_overflow : std_logic;
 signal divx_invalid_op : std_logic;
 signal divx_divide_by_zero: std_logic;
 signal divx_rdy : std_logic;
 signal divy_rslt : std_logic_vector(17 downto 0);
 signal divy_underflow : std_logic;
 signal divy_overflow : std_logic;
 signal divy_invalid_op : std_logic;
 signal divy_divide_by_zero: std_logic;
 signal divy_rdy : std_logic;
 signal divz_rslt : std_logic_vector(17 downto 0);
 signal divz_underflow : std_logic;
 signal divz_overflow : std_logic;
 signal divz_invalid_op : std_logic;
 signal divz_divide_by_zero: std_logic;
 signal divz_rdy : std_logic;
 signal divw_rslt : std_logic_vector(17 downto 0);
 signal divc_rslt : std_logic_vector(31 downto 0);
 signal divTx_rslt : std_logic_vector(31 downto 0);
 signal divTy_rslt : std_logic_vector(31 downto 0);
 type divc_pipe_dly_t is array (0 to DIV_LATENCY-1) of std_logic_vector(31 downto 0);
 signal divc_pipe_dly : divc_pipe_dly_t;
 signal rslt_valid : std_logic;
 signal rslt_data : std_logic_vector(18*4-1 downto 0);
 signal rslt_bp : std_logic; 
 
 
 
 begin 
 -- Handle input fifo. 
 
  -- Status flags. 
 prog_full <= pix_fifo_afull;
 prog_empty <= pix_fifo_aempty;
 empty <= pix_fifo_empty;
 full <= pix_fifo_full;

 
 pix_ready <= (not pix_fifo_afull);
 
 pix_fifo_push <= valid_in;
 --pix_fifo_wdata <= color_in & x_in & y_in & z_in & w_in;
 pix_fifo_wdata <= Ty_in & Tx_in & color_in & w_in & z_in & y_in & x_in;
 pix_fifo_pop <= vector_pop;
 vector_data <= pix_fifo_rdata(18*4-1 downto 0);
 vector_avail <= not pix_fifo_empty;
 -- test_fifo 
test_pop <= vector_pop;
test_data <= pix_fifo_rdata(18*4-1 downto 0);
 
 
 -- Input fifo that buffers incomming vertices. 
pix_fifo_0 : fifo_translation 
port map ( 
-- Clock and reset 
		rst => reset, 
		clk => clk, 
		-- Control signals 
		wr_en => pix_fifo_push, 
		rd_en => pix_fifo_pop, 
		-- Read write data 
		din => pix_fifo_wdata, 
		dout => pix_fifo_rdata, 
		-- Status flags. 
		prog_full => pix_fifo_afull, 
		prog_empty => pix_fifo_aempty, 
		empty => pix_fifo_empty, 
		full => pix_fifo_full,
		valid => valid,
		wr_ack => wr_ack
);
 -- Pipeline delay register for color. 
 
 
 color_pipe_dly_prc : process (clk,reset) 
  begin 
 if (reset = '1') then 
 color_pipe_dly <= (others => (others => '0'));
 elsif (clk = '1' and clk'event) then 
 color_pipe_dly(0) <= pix_fifo_rdata(103 downto 18*4);
 for i in 1 to MATRIX_MULT_LATENCY-1 loop color_pipe_dly(i) <= color_pipe_dly(i-1);
 end loop;
 end if;
 end process;
 
  Tx_pipe_dly_prc : process (clk,reset) 
  begin 
 if (reset = '1') then 
 Tx_pipe_dly <= (others => (others => '0'));
 elsif (clk = '1' and clk'event) then 
 Tx_pipe_dly(0) <= pix_fifo_rdata(135 downto 104);
 for i in 1 to MATRIX_MULT_LATENCY-1 loop Tx_pipe_dly(i) <= Tx_pipe_dly(i-1);
 end loop;
 end if;
 end process;
 
  Ty_pipe_dly_prc : process (clk,reset) 
  begin 
 if (reset = '1') then 
 Ty_pipe_dly <= (others => (others => '0'));
 elsif (clk = '1' and clk'event) then 
 Ty_pipe_dly(0) <= pix_fifo_rdata(167 downto 136);
 for i in 1 to MATRIX_MULT_LATENCY-1 loop Ty_pipe_dly(i) <= Ty_pipe_dly(i-1);
 end loop;
 end if;
 end process;
 
 
 
 translation_matrix : matrix_mult4x4
 port  map ( 
 -- Clock, reset and enable signals 
 clk => clk, 
 reset => reset, 
 -- Vector Inputs. 
 vector_avail => vector_avail, 
 vector_pop => vector_pop, 
 vector_data => vector_data, 
 -- Matrix Inputs. 
 matrix_we => matrix_we, 
 matrix_waddr => matrix_waddr, 
 matrix_wdata => matrix_wdata, 
 matrix_ready => '1', 
 -- I was born ready so I am always set. 
 -- Matrix Outputs. 
 rslt_valid => rslt_valid, 
 rslt_data => rslt_data, 
 rslt_bp => rslt_bp );
 
 rslt_bp <= not raster_rdy;

disable_normalization : if (NORMALIZE = 0) generate 
-- X result. 
 divx_rslt <= rslt_data(18*4-1 downto 18*3);
 divx_underflow <= '0';
 divx_overflow <= '0';
 divx_invalid_op <= '0';
 divx_divide_by_zero <= '0';
 divx_rdy <= rslt_valid;
 -- Y result. 
 divy_rslt <= rslt_data(18*3-1 downto 18*2);
 divy_underflow <= '0';
 divy_overflow <= '0';
 divy_invalid_op <= '0';
 divy_divide_by_zero <= '0';
 divy_rdy <= rslt_valid;
 -- Z result. 
 divz_rslt <= rslt_data(18*2-1 downto 18*1);
 divz_underflow <= '0';
 divz_overflow <= '0';
 divz_invalid_op <= '0';
 divz_divide_by_zero <= '0';
 divz_rdy <= rslt_valid;
 -- W result. 
 divw_rslt <= rslt_data(18*1-1 downto 18*0);
 -- C result. 
 divc_rslt <= color_pipe_dly(MATRIX_MULT_LATENCY-1);
 divTx_rslt <= Tx_pipe_dly(MATRIX_MULT_LATENCY-1);
 divTy_rslt <= Ty_pipe_dly(MATRIX_MULT_LATENCY-1);
 divc_pipe_dly <= (others => (others => '0'));
 end generate;
 
 
 enable_normalization : if (NORMALIZE = 1) generate 
 -- Floating point Division, x/w. 
 normalize_x : float18_div_translation 
 port  map ( 
 a => rslt_data(18*4-1 downto 18*3), 
 b => rslt_data(18*1-1 downto 18*0), -- w 
 operation_nd => rslt_valid, 
 operation_rfd => open, 
 clk => clk, 
 result => divx_rslt, 
 underflow => divx_underflow, 
 overflow => divx_overflow, 
 invalid_op => divx_invalid_op, 
 divide_by_zero => divx_divide_by_zero, 
 rdy => divx_rdy );
 -- Floating point Division, y/w. 
 normalize_y : float18_div_translation
 port map ( 
 a => rslt_data(18*3-1 downto 18*2), -- y 
 b => rslt_data(18*1-1 downto 18*0), -- w 
 operation_nd => rslt_valid, 
 operation_rfd => open, 
 clk => clk, 
 result => divy_rslt, 
 underflow => divy_underflow, 
 overflow => divy_overflow, 
 invalid_op => divy_invalid_op, 
 divide_by_zero => divy_divide_by_zero, 
 rdy => divy_rdy 
 );

 -- Floating point Division, z/w. 
 normalize_z : float18_div_translation 
 port map ( 
 a => rslt_data(18*2-1 downto 18*1), -- z 
 b => rslt_data(18*1-1 downto 18*0), -- w 
 operation_nd => rslt_valid, 
 operation_rfd => open, 
 clk => clk, 
 result => divz_rslt, 
 underflow => divz_underflow, 
 overflow => divz_overflow, 
 invalid_op => divz_invalid_op, 
 divide_by_zero => divz_divide_by_zero, 
 rdy => divz_rdy );
 
 
 -- w/w This should always be 1, you are dividing a number by istelf. 
 divw_rslt <= "00" & x"F000";
 
 
 -- Delay the color to match up with the normalized result. 
 divc_pipe_dly_prc : process (clk,reset) 
 begin 
 if (reset = '1') then 
 divc_pipe_dly <= (others => (others => '0'));
 elsif (clk = '1' and clk'event) then 
 divc_pipe_dly(0) <= color_pipe_dly(MATRIX_MULT_LATENCY-1);
 for i in 1 to DIV_LATENCY-1 loop 
 divc_pipe_dly(i) <= divc_pipe_dly(i-1);
 end loop;
 end if;
 end process;
 

 
 divc_rslt <= divc_pipe_dly(DIV_LATENCY-1);
 
 end generate;
 
 
 
 
 
 -- Wire up outputs. 
 x_out <= divx_rslt;
 y_out <= divy_rslt;
 z_out <= divz_rslt;
 w_out <= divw_rslt;
 color_out <= divc_rslt;
 Tx_out <= divTx_rslt;
 Ty_out <= divTy_rslt;
 valid_out <= divx_rdy;
 end hdl;
