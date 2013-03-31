----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:10:56 07/06/2010 
-- Design Name: 
-- Module Name:    convers_float18_b - Behavioral 
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

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library work;
use work.gpu_pkg.all;


 entity  convers_float18_b is 
 port( -- Clock, reset and enable signals
 clk : in std_logic;
 reset : in std_logic;
 -- Vector Inputs. 
 vector_avail : in std_logic;
 vector_pop : out std_logic;
 vector_data : in std_logic_vector(18*3-1 downto 0);
 -- Outputs.
 rslt_valid : out std_logic;
 rslt_data : out std_logic_vector(32 downto 0);
 rslt_bp : in std_logic 
 );
 end  convers_float18_b;

 architecture hdl of  convers_float18_b is

component float18_fix_conv_x 
-- generic ( 
--DOUT_WIDTH : 10
--  );
port (
sclr : in std_logic; 
clk : in std_logic;
ce: IN std_logic;
operation_nd : in std_logic; 
operation_rfd: out std_logic;
a : in std_logic_vector(17 downto 0);
rdy : out std_logic; 
result : out std_logic_vector(9  downto 0); 
overflow : out std_logic;
invalid_op: out std_logic
);
end component;

component float18_fix_conv_y 
-- generic ( 
--DOUT_WIDTH : 9
--  );
port (
sclr : in std_logic; 
clk : in std_logic;
ce: IN std_logic;
operation_nd : in std_logic; 
operation_rfd: out std_logic;
a : in std_logic_vector(17 downto 0);
rdy : out std_logic; 
result : out std_logic_vector(8  downto 0); 
overflow : out std_logic;
invalid_op: out std_logic
);
end component;

component float18_fix_conv_z 
-- generic ( 
--DOUT_WIDTH : 9
--  );
port (
sclr : in std_logic; 
clk : in std_logic;
ce: IN std_logic;
operation_nd : in std_logic; 
operation_rfd: out std_logic;
a : in std_logic_vector(17 downto 0);
rdy : out std_logic; 
result : out std_logic_vector(12  downto 0); 
overflow : out std_logic;
invalid_op: out std_logic
);
end component;

 --type vector_state_type is (IDLE,MULT_VAL);
 --signal vector_state : vector_state_type;
 --signal vector_pop_cnt : std_logic_vector(1 downto 0);
 signal fifo_rdy : std_logic;
 signal fifo_rdy_dly : std_logic;

 signal flo_to_fix0_en : std_logic;
 signal flo_to_fix0_data : std_logic_vector(17 downto 0);
 signal flo_to_fix0_rslt : std_logic_vector(9 downto 0);
 signal flo_to_fix0_underflow : std_logic;
 signal flo_to_fix0_overflow : std_logic;
 signal flo_to_fix0_invalid_op : std_logic;
 signal flo_to_fix0_rdy : std_logic;



 signal flo_to_fix1_en : std_logic;
 signal flo_to_fix1_data : std_logic_vector(17 downto 0);
 signal flo_to_fix1_rslt : std_logic_vector(8 downto 0);
 signal flo_to_fix1_underflow : std_logic;
 signal flo_to_fix1_overflow : std_logic;
 signal flo_to_fix1_invalid_op : std_logic;
 signal flo_to_fix1_rdy : std_logic;
 
 signal flo_to_fix2_en : std_logic;
 signal flo_to_fix2_data : std_logic_vector(17 downto 0);
 signal flo_to_fix2_rslt : std_logic_vector(12 downto 0);
 signal flo_to_fix2_underflow : std_logic;
 signal flo_to_fix2_overflow : std_logic;
 signal flo_to_fix2_invalid_op : std_logic;
 signal flo_to_fix2_rdy : std_logic;
 
 type vector_state_type is ( first,second );
 signal vector_state : vector_state_type ;
 

 signal rslt_cnt : std_logic_vector(1 downto 0);
 signal rslt_data_i_y : std_logic_vector(15 downto 0);
 signal rslt_data_i_x : std_logic_vector(17 downto 0);
 

begin
 
float18_fix_convx : float18_fix_conv_x
--generic map(
--      DOUT_WIDTH => 10
--           )
port map(
		sclr => reset,
		clk => clk,
		ce => '1',
		operation_nd => flo_to_fix0_en,
		operation_rfd => open,
		a => flo_to_fix0_data,
		rdy => flo_to_fix0_rdy,
		result => flo_to_fix0_rslt,
		overflow => open,
		invalid_op => open
);


float18_fix_convy : float18_fix_conv_y
--generic map(
--        DOUT_WIDTH => 9
--           )
port map(
			sclr => reset,
			clk => clk,
			ce => '1',
			operation_nd => flo_to_fix1_en,
			operation_rfd => open,
			a => flo_to_fix1_data,
			rdy => flo_to_fix1_rdy,
			result => flo_to_fix1_rslt,
			overflow => open,
			invalid_op => open
);

float18_fix_convz : float18_fix_conv_z
--generic map(
--        DOUT_WIDTH => 8
--           )
port map(
			sclr => reset,
			clk => clk,
			ce => '1',
			operation_nd => flo_to_fix2_en,
			operation_rfd => open,
			a => flo_to_fix2_data,
			rdy => flo_to_fix2_rdy,
			result => flo_to_fix2_rslt,
			overflow => open,
			invalid_op => open
);
 
 -- Generate Multipliers. 


 
 ctrl_prc : process(clk,reset) 
 begin 
		 if (reset = '1')  then 
		 vector_pop <= '0';
		 fifo_rdy <= '0';
		 fifo_rdy_dly <= '0';
  
	 
  elsif (clk = '1' and clk'event)  then 
			
			vector_pop <= '0';
			 fifo_rdy <= '0';
			 fifo_rdy_dly <= fifo_rdy;
 
      case vector_state is 
		
		when first => 
		 if (vector_avail = '1' and rslt_bp = '0')  then 
			 vector_pop <= '1';
			 fifo_rdy <= '1';	
      	 vector_state <= second ;
			 	     	end if;
		  
      when second => 
            vector_state <= first ;	
		end case;	
      end if;
 end process;





flo_to_fix_stage0_prc : process(clk,reset) 
begin 
		if (reset = '1') then
		flo_to_fix0_en <= '0';
		flo_to_fix0_data <= (others => '0'); 
		flo_to_fix1_en <= '0';
		flo_to_fix1_data <= (others => '0');
		flo_to_fix2_en <= '0';
		flo_to_fix2_data <= (others => '0');
		
 elsif (clk = '1' and clk'event)  then 
			flo_to_fix0_en <= '0';
			flo_to_fix1_en <= '0';
			flo_to_fix2_en <= '0';

 if (fifo_rdy_dly = '1') then 
  
			flo_to_fix0_en <= '1';
			flo_to_fix0_data <= vector_data(17 downto 0);
			flo_to_fix1_en <= '1';
			flo_to_fix1_data <= vector_data(35 downto 18);
			flo_to_fix2_en <= '1';
			flo_to_fix2_data <= vector_data(53 downto 36);
	
   end if;
  end if;
 end process;
 
 
 rslt_valid <= flo_to_fix0_rdy ;
 
 
 
 
 rslt_data(8 downto 0) <= flo_to_fix0_rslt(8 downto 0);
 rslt_data(16 downto 9) <= flo_to_fix1_rslt(7 downto 0);
 rslt_data(32 downto 17) <= x"0"&flo_to_fix2_rslt(11 downto 0);
 
 
 end hdl;








