----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:40:03 11/25/2019 
-- Design Name: 
-- Module Name:    mine_selector - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mine_selector is
    Port ( selector : in  STD_LOGIC_VECTOR (2 downto 0);
           selected : out  STD_LOGIC_VECTOR (7 downto 0));
end mine_selector;

architecture Behavioral of mine_selector is


--decoder takes 3 bit input maps it int equivalent + 1 8 bit 
begin
	process begin
		if selector = "000" then selected <= "00000001";
			
		elsif selector = "001" then selected <= "00000010";
			
		elsif selector = "010" then selected <= "00000100";
			
		elsif selector = "011" then selected <= "00001000";
		
		elsif selector = "100" then selected <= "00010000";
		
		elsif selector = "101" then selected <= "00100000";
		
		elsif selector = "110" then selected <= "01000000";
		
		else selected <= "10000000";

		end if;
	end process;	
end Behavioral;

