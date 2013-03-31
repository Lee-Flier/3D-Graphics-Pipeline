library ieee;
use ieee.std_logic_1164.all;
package zbt_ctrl_pkg is 
 constant MAX_NUM_INTF : integer := 4;
 constant DEFAULT_ADDR_WIDTH : integer := 20;
 constant DEFAULT_MEMORY_WIDTH : integer := 18;
 constant DEFAULT_BYTE_WIDTH : integer := 8;
 constant DEFAULT_DATA_DELAY : integer := 2;
 type integer_array_t is array (0 to MAX_NUM_INTF-1) of integer;
 constant DEFAULT_DATA_WIDTH : integer_array_t := (others => 18);
 constant DEFAULT_MAX_BURST_SIZE : integer_array_t := (others => 4);
 constant DEFAULT_CMD_FIFO_DEPTH : integer_array_t := (others => 16);
 constant DEFAULT_WRITE_FIFO_DEPTH : integer_array_t := (others => 64);
 constant DEFAULT_READ_FIFO_DEPTH : integer_array_t := (others => 64);
 constant DEFAULT_CMD_FIFO_AFULL_THRESH : integer_array_t := (others => 8);
 constant DEFAULT_WRITE_FIFO_AFULL_THRESH : integer_array_t := (others => 32);
 constant DEFAULT_READ_FIFO_AFULL_THRESH : integer_array_t := (others => 32);
 constant DEFAULT_FIFO_DUAL_CLOCK : integer_array_t := (others => 0);
function bit_width (value : integer range 0 to 65535) return integer;
 function max_size (value : integer_array_t;
                    nports: integer ) return integer;
 function total_size (value : integer_array_t;
                      nports: integer ) return integer;
 function top_index (index : integer;
                     value : integer_array_t) return integer;
 function top_index (index : integer;
                     value : integer) return integer;
 function bottom_index (index : integer;
                        value : integer_array_t) return integer;
 function bottom_index (index : integer;
                        value : integer) return integer;
 function conv_array_bit_width ( value : integer_array_t;
                                nports : integer ) return integer_array_t;
 end zbt_ctrl_pkg;
 package body zbt_ctrl_pkg is 
 function bit_width (value : integer range 0 to 65535) 
 return integer is 
 begin 
 for i in 0 to 65535 loop 
 if (value <= 2**i) then 
 if (i = 0) then return 1;
 end if;
 return i;
 end if;
end loop;
 return 65535;
 end function bit_width;
 function max_size (value : integer_array_t;
                    nports: integer) 
 return integer is 
 variable max : integer := 0;
 begin 
 for i in 0 to nports-1 loop 
 if value(i) > max then max := value(i);
 end if;
 end loop;
 return max;
 end function;
 function total_size (value : integer_array_t;
                      nports: integer)
 return integer is 
 variable total : integer := 0;
 begin 
 for i in 0 to nports-1 loop 
 total := value(i) + total;
 end loop;
 return total;
 end function;
 function top_index (index : integer;
                     value : integer_array_t) 
 return integer is 
 variable total : integer := 0;
 begin 
 for i in 0 to index loop 
 total := value(i) + total;
 end loop;
 return total - 1;
 end function;
 function top_index (index : integer;
                     value : integer) 
 return integer is 
 variable total : integer := 0;
 begin 
 for i in 0 to index loop 
 total := value + total;
 end loop;
 return total - 1;
 end function;
 function bottom_index (index : integer;
                        value : integer_array_t) 
 return integer is 
 variable total : integer := 0;
 begin 
 total := top_index(index,value);
 return ((total+1) - value(index));
 end function;
 function bottom_index (index : integer;
                        value : integer) 
 return integer is 
 variable total : integer := 0;
 begin 
 total := top_index(index,value);
 return ((total+1) - value);
end function;
 function conv_array_bit_width( value : integer_array_t;
                                nports: integer ) 
 return integer_array_t is 
 variable temp : integer_array_t;
 begin 
 for i in 0 to value'length-1 loop 
 if (i > nports-1) then 
 temp(i) := 0;
 else 
 temp(i) := bit_width(value(i));
 end if;
 end loop;
 return temp;
 end function;
 end zbt_ctrl_pkg;



