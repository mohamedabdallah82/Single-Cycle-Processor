
 LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
ENTITY data_Memory IS
	PORT (
		addr  : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		wr_Data : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		memory_Read   : IN STD_LOGIC;
		memory_Write  : IN STD_LOGIC;
		Data_out  : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END data_Memory;
ARCHITECTURE Behavioral OF data_Memory IS
	TYPE RAM_16_x_32 IS ARRAY(0 TO 15) OF std_logic_vector(31 DOWNTO 0);
	SIGNAL DM : RAM_16_x_32 := (
		x"00000000",  
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000",
		x"00000000"
	);
BEGIN
	PROCESS (memory_Write, memory_Read)  
 
	BEGIN
		IF (memory_Write = '1') THEN
			DM((to_integer(unsigned(addr)) - 268500992) / 4) <= wr_Data;
		END IF;
		IF (memory_Read = '1') THEN
			Data_out <= DM((to_integer(unsigned(addr)) - 268500992)/4);
		END IF;
		 
	END PROCESS;
END Behavioral;
