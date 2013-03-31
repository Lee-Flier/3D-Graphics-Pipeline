----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:14:46 06/02/2010 
-- Design Name: 
-- Module Name:    line_creator - Behavioral 
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

entity line_creator is
generic ( 
X_PIX_WIDTH : integer := 320; 
Y_PIX_WIDTH : integer := 240 
--X_PIX_WIDTH : integer := 20; 
--Y_PIX_WIDTH : integer := 14 
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
pix_data_o : out  std_logic_vector(96 downto 0);
-- v0_reg_o: out std_logic_vector(96 downto 0);
-- v1_reg_o: out std_logic_vector(96 downto 0);
-- v2_reg_o: out std_logic_vector(96 downto 0);
-- x0_out : out std_logic_vector(bit_width(X_PIX_WIDTH)-1 downto 0); 
-- y0_out : out std_logic_vector(bit_width(Y_PIX_WIDTH)-1 downto 0); 
-- x1_out : out std_logic_vector(bit_width(X_PIX_WIDTH)-1 downto 0); 
-- y1_out : out std_logic_vector(bit_width(Y_PIX_WIDTH)-1 downto 0); 
-- color_out : out std_logic_vector(17 downto 0); 
--color_out : out std_logic_vector(8 downto 0); 
valid_out : out std_logic; 
raster_rdy: in std_logic 
);

end line_creator;

architecture Behavioral of line_creator is

component fifo_linecreator is
 port (
 -- Clock and reset 
	 rst : in std_logic;
	 clk : in std_logic;
 -- Control signals 
	 wr_en : in std_logic;
	 rd_en : in std_logic;
 -- Read write data 
	 din : in std_logic_vector(149 downto 0);
	 dout : out std_logic_vector(149 downto 0);
 -- Status flags. 

	 prog_full : out std_logic;
	 prog_empty : out std_logic;
	 empty : out std_logic;
	 full : out std_logic; 
	 valid: OUT std_logic;
	 wr_ack: OUT std_logic
);
 end component;


component convers_float18_b is 
port ( 
     clk : in std_logic ;
     reset : in std_logic ;
		
-- input control signal 		
	 vector_avail  : in std_logic ;
    vector_data   : in std_logic_vector(53 downto 0);
	 vector_pop    : out std_logic;

-- output control signal 		
	 rslt_valid  : out std_logic;
    rslt_bp     : in std_logic ;
    rslt_data   : out std_logic_vector(32 downto 0) 

);
end component;

 signal vector_pop : std_logic;
 signal vector_data : std_logic_vector(18*3-1 downto 0);
 signal vector_avail : std_logic;
 signal pix_fifo_push : std_logic;
 signal pix_fifo_pop : std_logic;
 signal pix_fifo_wdata : std_logic_vector(149 downto 0);
 signal pix_fifo_rdata : std_logic_vector(149 downto 0);
 signal pix_fifo_afull : std_logic;
 signal pix_fifo_aempty : std_logic;
 signal pix_fifo_empty : std_logic;
 signal pix_fifo_full : std_logic;
 
 -- type color_pipe_dly_t is array (0 to 1) of std_logic_vector(17 downto 0);
 -- signal color_pipe_dly : color_pipe_dly_t;
 signal color_pipe_dly : std_logic_vector(31 downto 0);
 signal Tx_pipe_dly : std_logic_vector(31 downto 0);
 signal Ty_pipe_dly : std_logic_vector(31 downto 0);
 signal rslt_valid : std_logic;
 signal rslt_data : std_logic_vector(32 downto 0);
 signal rslt_bp : std_logic;
 
  type rslt_state_type is (first);
 signal rslt_state : rslt_state_type;
 
 signal rslt_x0_dely : std_logic_vector(8 downto 0);
 signal rslt_x1_dely : std_logic_vector(8 downto 0);
 signal rslt_x2_dely : std_logic_vector(8 downto 0);
 signal rslt_y0_dely : std_logic_vector(7 downto 0);
 signal rslt_y1_dely : std_logic_vector(7 downto 0);
 signal rslt_y2_dely : std_logic_vector(7 downto 0);
 signal rslt_z0_dely : std_logic_vector(15 downto 0);
 signal rslt_valid_delay : std_logic;
 signal valid_out_delay : std_logic;
 signal color_out : std_logic_vector(31 downto 0);
 signal Tx_out : std_logic_vector(31 downto 0);
 signal Ty_out : std_logic_vector(31 downto 0);

 signal   almost_empty:  std_logic;
 signal 	 almost_full :  std_logic;



begin

 pix_ready <= (not pix_fifo_afull);
 pix_fifo_push <= valid_in;
 pix_fifo_wdata <= Ty_in & Tx_in & color_in & z_in& y_in & x_in ;
 pix_fifo_pop <= vector_pop;
 vector_data <= pix_fifo_rdata(53 downto 0);
 vector_avail <= not pix_fifo_empty;

 prog_full <= pix_fifo_afull;
 prog_empty <= pix_fifo_aempty;
 empty <= pix_fifo_empty;
 full <= pix_fifo_full;
 
 -- test_fifo 
test_pop <= vector_pop;
test_data <= pix_fifo_rdata(18*2-1 downto 0);



pix_fifo_0 :  fifo_linecreator 
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



color_pipe_dly_prc : process (clk,reset) 
 begin 
 if (reset = '1') then 
       color_pipe_dly <=  (others => '0');
 elsif (clk = '1' and clk'event) then 
       color_pipe_dly <= pix_fifo_rdata(85 downto 18*3);
 end if;
 end process;

 Tx_pipe_dly_prc : process (clk,reset) 
 begin 
 if (reset = '1') then 
       Tx_pipe_dly <=  (others => '0');
 elsif (clk = '1' and clk'event) then 
       Tx_pipe_dly <= pix_fifo_rdata(117 downto 86);
 end if;
 end process;
 
 Ty_pipe_dly_prc : process (clk,reset) 
 begin 
 if (reset = '1') then 
       Ty_pipe_dly <=  (others => '0');
 elsif (clk = '1' and clk'event) then 
       Ty_pipe_dly <= pix_fifo_rdata(149 downto 118);
 end if;
 end process;

convers_float_0 : convers_float18_b 
port map ( 
 -- Clock, reset and enable signals 
	 clk => clk, 
	 reset => reset, 
 -- Vector Inputs. 
	 vector_avail => vector_avail, 
	 vector_pop => vector_pop, 
	 vector_data => vector_data, 
 -- I was born ready so I am always set. 
 -- Matrix Outputs. 
	 rslt_valid => rslt_valid, 
	 rslt_data => rslt_data, 
	 rslt_bp => rslt_bp 
 );
 
 rslt_bp <= not raster_rdy;



divc_pipe_dly_prc : process (clk ,reset) 
 begin 
 if (reset = '1') then 
  -- color_pipe_dly <=  (others => '0');
   rslt_state  <= first;
   rslt_x0_dely <= (others => '0');
	rslt_y0_dely <= (others => '0');
	rslt_z0_dely <= (others => '0');
	rslt_x1_dely <= (others => '0');
	rslt_y1_dely <= (others => '0');
	rslt_x2_dely <= (others => '0');
	rslt_y2_dely <= (others => '0');
	color_out <= (others => '0');
	rslt_valid_delay <= '0';

 elsif (clk = '1' and clk'event) then  
       	valid_out_delay <= '0';
 
    
     case  rslt_state is 
     
	  when first =>
  
		if ( rslt_valid = '1') then
		--if(raster_rdy='1') then
			rslt_x0_dely <= rslt_data(8 downto 0);
			rslt_y0_dely <= rslt_data(16 downto 9);	
			rslt_z0_dely <= rslt_data(32 downto 17);
			-- rslt_x0_dely<=b"001100100";
			-- rslt_y0_dely<=b"01100100";
		    rslt_state <= first;
			color_out <= color_pipe_dly;
			Tx_out <= Tx_pipe_dly;
			Ty_out <= Ty_pipe_dly;
			valid_out_delay <= '1';
		else 	valid_out_delay <= '0';
		end if;
	  			
	   -- when second =>
		-- if ( rslt_valid = '1') then
		-- --if(raster_rdy='1') then
			-- rslt_x1_dely <= rslt_data(8 downto 0);
			-- rslt_y1_dely <= rslt_data(16 downto 9);	
			-- -- rslt_x1_dely<=b"011001000";
			-- -- rslt_y1_dely<=b"01100100";
		  	-- valid_out_delay <= '0';
			-- rslt_state <= third;	 
		-- else	valid_out_delay <= '0';
       	-- end if;
		
		-- when third =>
		-- if ( rslt_valid = '1') then
		-- -- if(raster_rdy='1') then
			-- rslt_x2_dely <= rslt_data(8 downto 0);
			-- rslt_y2_dely <= rslt_data(16 downto 9);	
			-- -- rslt_x2_dely<=b"001100100";
			-- -- rslt_y2_dely<=b"11001000";
		  	-- valid_out_delay <= '1';
			-- rslt_state <= first;	 
		-- else 	valid_out_delay <= '0';
       	-- end if;
		end case ; 
 end if; 
end process ;
 
 
 -- v0_reg_o<=rslt_x0_dely&rslt_y0_dely&x"00000000000000000000";
 -- v1_reg_o<=rslt_x1_dely&rslt_y1_dely&x"00000000000000000000";
 -- v2_reg_o<=rslt_x2_dely&rslt_y2_dely&x"00000000000000000000";
 
 pix_data_o<=rslt_x0_dely&rslt_y0_dely&rslt_z0_dely&x"0000"&color_out&Tx_out(7 downto 0)&Ty_out(7 downto 0);  --x"0000";
 -- x0_out <= rslt_x0_dely;
 -- y0_out <= rslt_y0_dely;
 -- -- x1_out <= rslt_x1_dely;
 -- -- y1_out <= rslt_y1_dely;
 -- color_out <= color_pipe_dly;
 valid_out <= valid_out_delay;



end Behavioral;

