--C.3 MATRIX MULTPLIER 
--This VHDL file implements a 4x4 18bit floating point matrix multiplication. 
--It outputs a 18 bit 4x1 floating point vector every four clock cycles. 
----------------------------------------------------------- 
-- Filename : matrix_mult4x4.vhd 
-- 
-- Date : January 6th 2008 
-- 
-- Author : James Warner 
-- 
-- Desc : Matrix multiply of Nbit vector by NxN matrix. --
-- 
------ ---------------------- 
-- | N1 | | M11 M21 . . MX1 | 
-- | N2 | | M12 M22 . . MX2 | 
-- | . | * | . . . . . | 
-- | . | | . . . . . | 
-- | NX | | M1Y M2Y . . . | 
-- ------ ---------------------- 
-----------------------------------------------------------
 library ieee;
 use ieee.std_logic_1164.all;
 use ieee.std_logic_arith.all;
 use ieee.std_logic_unsigned.all;
 library work;
use work.gpu_pkg.all;
 entity matrix_mult4x4 is port( -- Clock, reset and enable signals
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
 end matrix_mult4x4;
 architecture hdl of matrix_mult4x4 is

 constant MATRIX_SIZE : integer := 4;
 -- Small distributed ram to store matrix.
 component dist_ram_2port_1clk_translation is 
-- generic ( 
-- MEM_WIDTH : integer := 18;
-- MEM_SIZE : integer := MATRIX_SIZE*MATRIX_SIZE );
 port ( -- Clock 
 clk : in std_logic;
 -- Control signals 
 we : in std_logic;
 a : in std_logic_vector(3 downto 0);
 d : in std_logic_vector(71 downto 0);
 dpra : in std_logic_vector(3 downto 0);
 spo : out std_logic_vector(71 downto 0);
 dpo: OUT std_logic_VECTOR(71 downto 0) );
 end component;
 -- Floating point multiply. 
 component float18_mult_translation IS 
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
 rdy : out std_logic );
 end component;
 -- Floating point addition. 
 component float18_add_translation IS 
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
 rdy : out std_logic );
 end component;
 
 type vector_state_type is (IDLE,MULT_VAL);
 signal vector_state : vector_state_type;
 signal vector_pop_cnt : std_logic_vector(bit_width(MATRIX_SIZE)-1 downto 0);
 signal fifo_rdy : std_logic;
 signal fifo_rdy_dly : std_logic;
 signal matrix_raddr : std_logic_vector(3 downto 0);
 signal matrix_rdata : std_logic_vector(MATRIX_SIZE*18-1 downto 0);
 signal mult0_en : std_logic;
 signal mult0_data1 : std_logic_vector(17 downto 0);
 signal mult0_data2 : std_logic_vector(17 downto 0);
 signal mult0_rslt : std_logic_vector(17 downto 0);
 signal mult0_underflow : std_logic;
 signal mult0_overflow : std_logic;
 signal mult0_invalid_op : std_logic;
 signal mult0_rdy : std_logic;
 signal mult1_en : std_logic;
 signal mult1_data1 : std_logic_vector(17 downto 0);
 signal mult1_data2 : std_logic_vector(17 downto 0);
 signal mult1_rslt : std_logic_vector(17 downto 0);
 signal mult1_underflow : std_logic;
 signal mult1_overflow : std_logic;
 signal mult1_invalid_op : std_logic;
 signal mult1_rdy : std_logic;
 signal mult2_en : std_logic;
 signal mult2_data1 : std_logic_vector(17 downto 0);
 signal mult2_data2 : std_logic_vector(17 downto 0);
 signal mult2_rslt : std_logic_vector(17 downto 0);
 signal mult2_underflow : std_logic;
 signal mult2_overflow : std_logic;
 signal mult2_invalid_op : std_logic;
 signal mult2_rdy : std_logic;
 signal mult3_en : std_logic;
 signal mult3_data1 : std_logic_vector(17 downto 0);
 signal mult3_data2 : std_logic_vector(17 downto 0);
 signal mult3_rslt : std_logic_vector(17 downto 0);
 signal mult3_underflow : std_logic;
 signal mult3_overflow : std_logic;
 signal mult3_invalid_op : std_logic;
 signal mult3_rdy : std_logic;
 signal add_0_1_en : std_logic;
 signal add_0_1_data1 : std_logic_vector(17 downto 0);
 signal add_0_1_data2 : std_logic_vector(17 downto 0);
 signal add_0_1_rslt : std_logic_vector(17 downto 0);
 signal add_0_1_underflow : std_logic;
 signal add_0_1_overflow : std_logic;
 signal add_0_1_invalid_op : std_logic;
 signal add_0_1_rdy : std_logic;
 signal add_2_3_en : std_logic; 
 signal add_2_3_data1 : std_logic_vector(17 downto 0);
 signal add_2_3_data2 : std_logic_vector(17 downto 0);
 signal add_2_3_rslt : std_logic_vector(17 downto 0);
 signal add_2_3_underflow : std_logic;
 signal add_2_3_overflow : std_logic;
 signal add_2_3_invalid_op : std_logic;
 signal add_2_3_rdy : std_logic;
 signal add_0_1_2_3_en : std_logic;
 signal add_0_1_2_3_data1 : std_logic_vector(17 downto 0);
 signal add_0_1_2_3_data2 : std_logic_vector(17 downto 0);
 signal add_0_1_2_3_rslt : std_logic_vector(17 downto 0);
 signal add_0_1_2_3_underflow : std_logic;
 signal add_0_1_2_3_overflow : std_logic;
 signal add_0_1_2_3_invalid_op : std_logic;
 signal add_0_1_2_3_rdy : std_logic;
 signal rslt_cnt : std_logic_vector(bit_width(MATRIX_SIZE)-1 downto 0);
 signal rslt_data_i : std_logic_vector(MATRIX_SIZE*18-1 downto 0);
 signal sdata : std_logic_vector(MATRIX_SIZE*18-1 downto 0);
 
 begin -- Small distributed ram to store matrix. 
 matrix_ram_0 : dist_ram_2port_1clk_translation 
-- generic map ( 
-- MEM_WIDTH => 18*MATRIX_SIZE, 
-- MEM_SIZE => MATRIX_SIZE ) 
 port map ( 
 clk => clk, 
 we => matrix_we, 
 a => matrix_waddr, 
 d => matrix_wdata, 
 dpra => matrix_raddr, 
 dpo => matrix_rdata,
 spo =>  sdata
 );
 -- Generate Multipliers. 
 mult_0 : float18_mult_translation
 port map ( 
 a => mult0_data1, 
 b => mult0_data2, 
 operation_nd => mult0_en, 
 operation_rfd => open, 
 clk => clk, 
 result => mult0_rslt, 
 underflow => mult0_underflow, 
 overflow => mult0_overflow, 
 invalid_op => mult0_invalid_op, 
 rdy => mult0_rdy );
 -- Generate Multipliers. 
 mult_1 : float18_mult_translation
 port map ( 
 a => mult1_data1, 
 b => mult1_data2, 
 operation_nd => mult1_en, 
 operation_rfd => open, 
 clk => clk, 
 result => mult1_rslt, 
 underflow => mult1_underflow, 
 overflow => mult1_overflow,
invalid_op => mult1_invalid_op, 
rdy => mult1_rdy );
 -- Generate Multipliers. 
 mult_2 : float18_mult_translation
 port map ( 
 a => mult2_data1, 
 b => mult2_data2, 
 operation_nd => mult2_en, 
 operation_rfd => open, 
 clk => clk, 
 result => mult2_rslt, 
 underflow => mult2_underflow, 
 overflow => mult2_overflow, 
 invalid_op => mult2_invalid_op, 
 rdy => mult2_rdy );
 -- Generate Multipliers. 
 mult_3 : float18_mult_translation
 port map ( 
 a => mult3_data1, 
 b => mult3_data2, 
 operation_nd => mult3_en, 
 operation_rfd => open, 
 clk => clk, 
 result => mult3_rslt, 
 underflow => mult3_underflow, 
 overflow => mult3_overflow, 
 invalid_op => mult3_invalid_op, 
 rdy => mult3_rdy );
 -- Generate Adders. 
 adder_0_1 : float18_add_translation 
 port map ( 
 a => add_0_1_data1, 
 b => add_0_1_data2, 
 operation_nd => add_0_1_en, 
 operation_rfd => open, 
 clk => clk, 
 result => add_0_1_rslt, 
 underflow => add_0_1_underflow, 
 overflow => add_0_1_overflow, 
 invalid_op => add_0_1_invalid_op, 
 rdy => add_0_1_rdy );
 -- Generate Adders. 
 adder_2_3 : float18_add_translation 
 port map ( 
 a => add_2_3_data1, 
 b => add_2_3_data2, 
 operation_nd => add_2_3_en, 
 operation_rfd => open, 
 clk => clk, 
 result => add_2_3_rslt, 
 underflow => add_2_3_underflow, 
 overflow => add_2_3_overflow, 
 invalid_op => add_2_3_invalid_op, 
 rdy => add_2_3_rdy );
--196 
-- Generate Adders. 
adder_0_1_2_3 : float18_add_translation 
port map ( 
a => add_0_1_2_3_data1, 
b => add_0_1_2_3_data2, 
operation_nd => add_0_1_2_3_en, 
operation_rfd => open, 
clk => clk, 
result => add_0_1_2_3_rslt, 
underflow => add_0_1_2_3_underflow, 
overflow => add_0_1_2_3_overflow, 
invalid_op => add_0_1_2_3_invalid_op, 
rdy => add_0_1_2_3_rdy );

 ctrl_prc : process(clk,reset) 
 begin 
 if (reset = '1') 
 then 
 vector_pop <= '0';
 vector_pop_cnt <= (others => '0');
 vector_state <= IDLE;
 fifo_rdy <= '0';
 fifo_rdy_dly <= '0';
 elsif (clk = '1' and clk'event) 
 then 
 vector_pop <= '0';
 fifo_rdy <= '0';
 fifo_rdy_dly <= fifo_rdy;
 case vector_state is 
 when IDLE => 
 if (vector_avail = '1' and matrix_ready = '1' and rslt_bp = '0') 
 then 
 vector_pop <= '1';
 fifo_rdy <= '1';
 vector_pop_cnt <= (others => '0');
 vector_state <= MULT_VAL;
 end if;
 when  MULT_VAL => 
     fifo_rdy <= '1';
 if (vector_pop_cnt = MATRIX_SIZE-1)  then 
     vector_pop_cnt <= (others => '0');
 if (vector_avail = '1' and matrix_ready = '1' and rslt_bp = '0')  then 
      vector_pop <= '1';
 else vector_state <= IDLE;
 fifo_rdy <= '0';
 end if;
 else vector_pop_cnt <= vector_pop_cnt + 1;
 end if;
 end case;
 end if;
 end process;
--197 
matrix_mult_stage0_prc : process(clk,reset) 
begin 
if (reset = '1') then
 mult0_en <= '0';
 mult0_data1 <= (others => '0');
 mult0_data2 <= (others => '0');
 mult1_en <= '0';
 mult1_data1 <= (others => '0');
 mult1_data2 <= (others => '0');
 mult2_en <= '0';
 mult2_data1 <= (others => '0');
 mult2_data2 <= (others => '0');
 mult3_en <= '0';
 mult3_data1 <= (others => '0');
 mult3_data2 <= (others => '0');
 matrix_raddr <= (others => '0');
 elsif (clk = '1' and clk'event) then mult0_en <= '0';
 mult1_en <= '0';
 mult2_en <= '0';
 mult3_en <= '0';
 if (fifo_rdy_dly = '1') then 
 mult0_en <= '1';
 mult0_data1 <= vector_data(17 downto 0);
 mult0_data2 <= matrix_rdata(17 downto 0);
 mult1_en <= '1';
 mult1_data1 <= vector_data(35 downto 18);
 mult1_data2 <= matrix_rdata(35 downto 18);
 mult2_en <= '1';
 mult2_data1 <= vector_data(53 downto 36);
 mult2_data2 <= matrix_rdata(53 downto 36);
 mult3_en <= '1';
 mult3_data1 <= vector_data(71 downto 54);
 mult3_data2 <= matrix_rdata(71 downto 54);
 if (matrix_raddr = MATRIX_SIZE-1) then 
 matrix_raddr <= (others => '0');
 else 
 matrix_raddr <= matrix_raddr + 1;
 end if;
 end if;
 end if;
 end process;
 matrix_add_0_1_stage0_prc : process(clk,reset) 
 begin 
 if (reset = '1') then 
 add_0_1_en <= '0';
 add_0_1_data1 <= (others => '0');
 add_0_1_data2 <= (others => '0');
 elsif (clk = '1' and clk'event) then 
 add_0_1_en <= '0';

if (mult0_rdy = '1' and mult1_rdy = '1') then 
 add_0_1_en <= '1';
 add_0_1_data1 <= mult0_rslt;
 add_0_1_data2 <= mult1_rslt;
 end if;
 end if;
 end process;
 matrix_add_2_3_stage0_prc : process(clk,reset) 
 begin 
 if (reset = '1') then 
 add_2_3_en <= '0';
 add_2_3_data1 <= (others => '0');
 add_2_3_data2 <= (others => '0');
 elsif (clk = '1' and clk'event) then 
 add_2_3_en <= '0';
 if (mult2_rdy = '1' and mult3_rdy = '1') then 
 add_2_3_en <= '1';
 add_2_3_data1 <= mult2_rslt;
 add_2_3_data2 <= mult3_rslt;
 end if;
 end if;
 end process;
 matrix_add_0_1_2_3_stage0_prc : process(clk,reset) 
 begin 
 if (reset = '1') then 
 add_0_1_2_3_en <= '0';
 add_0_1_2_3_data1 <= (others => '0');
 add_0_1_2_3_data2 <= (others => '0');
 elsif (clk = '1' and clk'event) then 
 add_0_1_2_3_en <= '0';
 if (add_0_1_rdy = '1' and add_2_3_rdy = '1') then 
 add_0_1_2_3_en <= '1';
 add_0_1_2_3_data1 <= add_0_1_rslt;
 add_0_1_2_3_data2 <= add_2_3_rslt;
 end if;
 end if;
 end process;
 rslt_out_prc : process(clk,reset) 
 begin 
 if (reset = '1') then 
 rslt_valid <= '0';
 rslt_data_i <= (others => '0');
 
rslt_cnt <= (others => '0');
 elsif (clk = '1' and clk'event) then 
 rslt_valid <= '0';
 if (add_0_1_2_3_rdy = '1') then 
 rslt_data_i(17 downto 0) <= add_0_1_2_3_rslt;
 for i in 1 to MATRIX_SIZE-1 
 loop rslt_data_i((18*(i+1))-1 downto 18*(i)) <= rslt_data_i((18*i)-1 downto 18*(i-1));
 end loop;
 if (rslt_cnt = MATRIX_SIZE-1) then 
 rslt_cnt <= (others => '0');
 rslt_valid <= '1';
 else rslt_cnt <= rslt_cnt + 1;
 end if;
 end if;
 end if;
 end process;
 rslt_data <= rslt_data_i;
 end hdl;

