
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:51:01 05/31/2010 
-- Design Name: 
-- Module Name:    float32_float18_conv_9 - Behavioral 
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

entity float32to18 is
generic (
NUM_OF_ENTRIES : integer :=9
);
port(
reset : in std_logic; 
clk : in std_logic;
operation_nd_9 : in std_logic_vector(NUM_OF_ENTRIES-1 downto 0); 
a_9 : in std_logic_vector(NUM_OF_ENTRIES*32-1 downto 0);
rdy_9 : out std_logic_vector(NUM_OF_ENTRIES-1 downto 0); 
result_9 : out std_logic_vector(NUM_OF_ENTRIES*18-1 downto 0); 
underflow_9 : out std_logic_vector(NUM_OF_ENTRIES-1 downto 0); 
overflow_9 : out std_logic_vector(NUM_OF_ENTRIES-1 downto 0) 
);
end float32to18;

architecture Behavioral of float32to18 is

signal operation_nd_9_i : std_logic_vector(NUM_OF_ENTRIES-1 downto 0); 
signal a_9_i : std_logic_vector(NUM_OF_ENTRIES*32-1 downto 0);
signal rdy_9_i : std_logic_vector(NUM_OF_ENTRIES-1 downto 0); 
signal result_9_i : std_logic_vector(NUM_OF_ENTRIES*18-1 downto 0); 
signal underflow_9_i : std_logic_vector(NUM_OF_ENTRIES-1 downto 0); 
signal overflow_9_i : std_logic_vector(NUM_OF_ENTRIES-1 downto 0);


component float32to18model
port (
sclr : in std_logic; 
clk : in std_logic;
operation_nd : in std_logic; 
a : in std_logic_vector(31 downto 0);
rdy : out std_logic; 
result : out std_logic_vector(17 downto 0); 
underflow : out std_logic; 
overflow : out std_logic 
);
end component;


begin

gen1 : for i in 0 to NUM_OF_ENTRIES-1 generate
float32_float18 : float32to18model 
port map(
sclr => reset,
clk => clk,
operation_nd => operation_nd_9_i(i),
a => a_9_i(32*(i+1)-1 downto 32*i),
rdy => rdy_9_i(i),
result => result_9_i(18*(i+1)-1 downto 18*i),
underflow => underflow_9_i(i),
overflow => overflow_9_i(i)
);
end generate gen1;

operation_nd_9_i <= operation_nd_9;
a_9_i <= a_9;
rdy_9 <= rdy_9_i;
result_9 <= result_9_i;
underflow_9 <= underflow_9_i;
overflow_9 <= overflow_9_i;

end Behavioral;

