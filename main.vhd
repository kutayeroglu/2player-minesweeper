----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:54:22 11/19/2019 
-- Design Name: 
-- Module Name:    main - Behavioral 
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



entity main is
    Port ( column : in  STD_LOGIC_VECTOR (7 downto 0);
           hit : in  STD_LOGIC;
			  mode : in STD_LOGIC;
			  clk : IN std_logic;          
			  SevenSegControl : OUT std_logic_vector(7 downto 0):=x"00";
			  SevenSegBus : OUT std_logic_vector(7 downto 0));
end main;

architecture Behavioral of main is
	COMPONENT sevenSegment
	PORT(
		A : IN std_logic_vector(3 downto 0);
		B : IN std_logic_vector(3 downto 0);
		C : IN std_logic_vector(3 downto 0);
		D : IN std_logic_vector(3 downto 0);
		E : IN std_logic_vector(3 downto 0);
		F : IN std_logic_vector(3 downto 0);
		G : IN std_logic_vector(3 downto 0);
		H : IN std_logic_vector(3 downto 0);
		clk : IN std_logic;          
		SevenSegControl : OUT std_logic_vector(7 downto 0);
		SevenSegBus : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT mine_selector
	PORT(
		selector : IN std_logic_vector(2 downto 0); --selector comes from user we map it into 8-bit to compare with mines         
		selected : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
signal selector : std_logic_vector (2 downto 0);
signal selected : std_logic_vector (7 downto 0);

signal resultA, resultB, resultC, resultD, resultE, resultF, resultG, resultH : std_logic_vector (3 downto 0);
signal prevA, prevB, prevC, prevD, prevE, prevF, prevG, prevH : std_logic := '1';


begin
--instantiation of player1 mine selection 
	Inst_mine_selector: mine_selector PORT MAP(
	selector => selector,
	selected => selected
	);

	process begin
		if mode = '0' then
			if hit = '1' then --1st user selects the mine place 
				selector(0) <= column(0); -- selectors 0th bit is rightmost pin 
				selector(1) <= column(1); 
				selector(2) <= column(2);
			end if;
			
		-- to save space and for simplicity we used column here 	for selectors values 
		else
			if column = "00000000" then -- Kind of works as a memory. Previous defused areas stay blank 
				if(prevA = '0') then
					resultA <= x"f";
				end if;
				
				if(prevB = '0') then
					resultB <= x"f";
				end if;
				
				if(prevC = '0') then
					resultC <= x"f";
				end if;
				
				if(prevD = '0') then
					resultD <= x"f";
				end if;
				
				if(prevE = '0') then
					resultE <= x"f";
				end if;
				
				if(prevF = '0') then
					resultF <= x"f";
				end if;
				
				if(prevG = '0') then
					resultG <= x"f";
				end if;
				
				if(prevH = '0') then
					resultH <= x"f";
				end if;	
				
				if (prevB or prevC or prevD or prevE or prevF or prevG or prevH) = '0' then --meaning all other fields are cleared. bomb at A
					resultH <= x"5"; 
					resultG <= x"3";
					resultF <= x"c";
					resultE <= x"c";
					resultD <= x"e";
					resultC <= x"5";
					resultB <= x"5";
					resultA <= x"f";
				end if;
						
				if (prevA or prevC or prevD or prevE or prevF or prevG or prevH) = '0' then --meaning all other fields are cleared. bomb at B
					resultH <= x"5"; 
					resultG <= x"3";
					resultF <= x"c";
					resultE <= x"c";
					resultD <= x"e";
					resultC <= x"5";
					resultB <= x"5";
					resultA <= x"f";
				end if;
						
						
				if (prevA or prevB or prevD or prevE or prevF or prevG or prevH) = '0' then --meaning all other fields are cleared. bomb at C
					resultH <= x"5"; 
					resultG <= x"3";
					resultF <= x"c";
					resultE <= x"c";
					resultD <= x"e";
					resultC <= x"5";
					resultB <= x"5";
					resultA <= x"f";
				end if;
						
				if (prevA or prevB or prevC or prevE or prevF or prevG or prevH) = '0' then --meaning all other fields are cleared. bomb at D
					resultH <= x"5"; 
					resultG <= x"3";
					resultF <= x"c";
					resultE <= x"c";
					resultD <= x"e";
					resultC <= x"5";
					resultB <= x"5";
					resultA <= x"f";
				end if;
						
						
				if (prevA or prevB or prevC or prevD or prevF or prevG or prevH) = '0' then --meaning all other fields are cleared. bomb at E
					resultH <= x"5"; 
					resultG <= x"3";
					resultF <= x"c";
					resultE <= x"c";
					resultD <= x"e";
					resultC <= x"5";
					resultB <= x"5";
					resultA <= x"f";
				end if;
						
						
				if (prevA or prevB or prevC or prevD or prevE or prevG or prevH) = '0' then --meaning all other fields are cleared. bomb at F
					resultH <= x"5"; 
					resultG <= x"3";
					resultF <= x"c";
					resultE <= x"c";
					resultD <= x"e";
					resultC <= x"5";
					resultB <= x"5";
					resultA <= x"f";
				end if;
						
				if (prevA or prevB or prevC or prevD or prevE or prevF or prevH) = '0' then --meaning all other fields are cleared. bomb at G
					resultH <= x"5"; 
					resultG <= x"3";
					resultF <= x"c";
					resultE <= x"c";
					resultD <= x"e";
					resultC <= x"5";
					resultB <= x"5";
					resultA <= x"f";
				end if;
						
				if (prevA or prevB or prevC or prevD or prevE or prevF or prevG) = '0' then --meaning all other fields are cleared. bomb at H
					resultH <= x"5"; 
					resultG <= x"3";
					resultF <= x"c";
					resultE <= x"c";
					resultD <= x"e";
					resultC <= x"5";
					resultB <= x"5";
					resultA <= x"f";
				end if;				
		
		elsif column = "00000001" then -- 1st column is selected
			resultA <= x"5"; -- display S for selected
			
			--prev conditions make sure previous defused areas are not lit up
			if(prevB = '0') then
				resultB <= x"f";
			end if;
			
			if(prevC = '0') then
				resultC <= x"f";
			end if;
			
			if(prevD = '0') then
				resultD <= x"f";
			end if;
			
			if(prevE = '0') then
				resultE <= x"f";
			end if;
			
			if(prevF = '0') then
				resultF <= x"f";
			end if;
			
			if(prevG = '0') then
				resultG <= x"f";
			end if;
			
			if(prevH = '0') then
				resultH <= x"f";
			end if;	
				
			if hit = '1' then
				
				if selected = column then -- LOSE
					resultH <= x"f";
					resultG <= x"f";
					resultF <= x"1";
					resultE <= x"0";
					resultD <= x"5";
					resultC <= x"e";
					resultB <= x"f";
					resultA <= x"f";
					
				else --shut off successful area
					resultA <= x"f";
					prevA <= '0';
				end if;
					
					--this condition helped us with some cases during trouble shooting
			else
				if(prevA = '0') then
					resultA <= x"f";
				end if;				
			end if;
				
		elsif column = "00000010" then -- 2nd column is selected
			resultB <= x"5"; -- display S for selected
			
			if(prevA = '0') then
				resultA <= x"f";
			end if;
			
			if(prevC = '0') then
				resultC <= x"f";
			end if;
			
			if(prevD = '0') then
				resultD <= x"f";
			end if;
			
			if(prevE = '0') then
				resultE <= x"f";
			end if;
			
			if(prevF = '0') then
				resultF <= x"f";
			end if;
			
			if(prevG = '0') then
				resultG <= x"f";
			end if;
			
			if(prevH = '0') then
				resultH <= x"f";
			end if;	
			
			if hit = '1' then
				if selected = column then -- LOSE
					resultH <= x"f";
					resultG <= x"f";
					resultF <= x"1";
					resultE <= x"0";
					resultD <= x"5";
					resultC <= x"e";
					resultB <= x"f";
					resultA <= x"f";

				else
					resultB <= x"f";
					prevB <= '0';
				end if;	

			else
				if(prevB = '0') then
					resultB <= x"f";
				end if;	
			end if;
			
		elsif column = "00000100" then -- 3rd column is selected
			resultC <= x"5"; -- display S for selected
			
			if(prevA = '0') then
				resultA <= x"f";
			end if;
			
			if(prevB = '0') then
				resultB <= x"f";
			end if;
			
			if(prevD = '0') then
				resultD <= x"f";
			end if;
			
			if(prevE = '0') then
				resultE <= x"f";
			end if;
			
			if(prevF = '0') then
				resultF <= x"f";
			end if;
			
			if(prevG = '0') then
				resultG <= x"f";
			end if;
			
			if(prevH = '0') then
				resultH <= x"f";
			end if;	
			
			if hit = '1' then
				if selected = column then -- LOSE
					resultH <= x"f";
					resultG <= x"f";
					resultF <= x"1";
					resultE <= x"0";
					resultD <= x"5";
					resultC <= x"e";
					resultB <= x"f";
					resultA <= x"f";
				else
					resultC <= x"f";
					prevC <= '0';
				end if;

			else
				if(prevC = '0') then
					resultC <= x"f";
				end if;	
			end if;
			
		elsif column = "00001000" then -- 4th column is selected
			resultD <= x"5"; -- display S for selected
			
			if(prevA = '0') then
				resultA <= x"f";
			end if;
			
			if(prevB = '0') then
				resultB <= x"f";
			end if;
			
			if(prevC = '0') then
				resultC <= x"f";
			end if;
			
			if(prevE = '0') then
				resultE <= x"f";
			end if;
			
			if(prevF = '0') then
				resultF <= x"f";
			end if;
			
			if(prevG = '0') then
				resultG <= x"f";
			end if;
			
			if(prevH = '0') then
				resultH <= x"f";
			end if;	
			
			if hit = '1' then
				if selected = column then -- LOSE
					resultH <= x"f";
					resultG <= x"f";
					resultF <= x"1";
					resultE <= x"0";
					resultD <= x"5";
					resultC <= x"e";
					resultB <= x"f";
					resultA <= x"f";
				else
					resultD <= x"f";
					prevD <= '0';
				end if;

			else
				if(prevD = '0') then
					resultD <= x"f";
				end if;	
			end if;
			
		elsif column = "00010000" then -- 5th column is selected
			resultE <= x"5"; -- display S for selected
			
			if(prevA = '0') then
				resultA <= x"f";
			end if;
			
			if(prevB = '0') then
				resultB <= x"f";
			end if;
			
			if(prevC = '0') then
				resultC <= x"f";
			end if;
			
			if(prevD = '0') then
				resultD <= x"f";
			end if;
			
			if(prevF = '0') then
				resultF <= x"f";
			end if;
			
			if(prevG = '0') then
				resultG <= x"f";
			end if;
			
			if(prevH = '0') then
				resultH <= x"f";
			end if;	
			
			if hit = '1' then
				if selected = column then
					-- LOSE
					resultH <= x"f";
					resultG <= x"f";
					resultF <= x"1";
					resultE <= x"0";
					resultD <= x"5";
					resultC <= x"e";
					resultB <= x"f";
					resultA <= x"f";
				else
					resultE <= x"f";
					prevE <= '0';
				end if;
				
			else
				if(prevE = '0') then
					resultE <= x"f";
				end if;	
			end if;
			
		elsif column = "00100000" then -- 6th column is selected
			resultF <= x"5"; -- display S for selected
			
			if(prevA = '0') then
				resultA <= x"f";
			end if;
			
			if(prevB = '0') then
				resultB <= x"f";
			end if;
			
			if(prevC = '0') then
				resultC <= x"f";
			end if;
			
			if(prevD = '0') then
				resultD <= x"f";
			end if;
			
			if(prevE = '0') then
				resultE <= x"f";
			end if;
					
			if(prevG = '0') then
				resultG <= x"f";
			end if;
			
			if(prevH = '0') then
				resultH <= x"f";
			end if;	
			
			if hit = '1' then
				if selected = column then
					-- LOSE
					resultH <= x"f";
					resultG <= x"f";
					resultF <= x"1";
					resultE <= x"0";
					resultD <= x"5";
					resultC <= x"e";
					resultB <= x"f";
					resultA <= x"f";
				else
					resultF <= x"f";
					prevF <= '0';
				end if;
				
			else
				if(prevF = '0') then
					resultF <= x"f";
				end if;	
			end if;
			
		elsif column = "01000000" then -- 7th column is selected
			resultG <= x"5"; -- display S for selected
			
			if(prevB = '0') then
				resultB <= x"f";
			end if;
			
			if(prevC = '0') then
				resultC <= x"f";
			end if;
			
			if(prevD = '0') then
				resultD <= x"f";
			end if;
			
			if(prevE = '0') then
				resultE <= x"f";
			end if;
			
			if(prevF = '0') then
				resultF <= x"f";
			end if;
			
			if(prevH = '0') then
				resultH <= x"f";
			end if;	
			
			if hit = '1' then
				if selected = column then -- LOSE
					resultH <= x"f";
					resultG <= x"f";
					resultF <= x"1";
					resultE <= x"0";
					resultD <= x"5";
					resultC <= x"e";
					resultB <= x"f";
					resultA <= x"f";
				else
					resultG <= x"f";
					prevG <= '0';
				end if;
					
			else
				if(prevG = '0') then
					resultG <= x"f";
				end if;	
			end if;
			
		elsif column = "10000000" then -- 8th column is selected
			resultH <= x"5"; -- display S for selected
			
			if(prevA = '0') then
				resultA <= x"f";
			end if;	
			
			if(prevB = '0') then
				resultB <= x"f";
			end if;
			
			if(prevC = '0') then
				resultC <= x"f";
			end if;
			
			if(prevD = '0') then
				resultD <= x"f";
			end if;
			
			if(prevE = '0') then
				resultE <= x"f";
			end if;
			
			if(prevF = '0') then
				resultF <= x"f";
			end if;
			
			if(prevG = '0') then
				resultG <= x"f";
			end if;
			
			if hit = '1' then
				if selected = column then -- LOSE
					resultH <= x"f";
					resultG <= x"f";
					resultF <= x"1";
					resultE <= x"0";
					resultD <= x"5";
					resultC <= x"e";
					resultB <= x"f";
					resultA <= x"f";
				else
					resultH <= x"f";
					prevH <= '0';
				end if;
			
			else
				if(prevH = '0') then
					resultH <= x"f";
				end if;	
			end if;
		end if;
	end if;
end process;

--instantiation of seven segment provided by course instructor 
Inst_sevenSegment: sevenSegment PORT MAP(
		A => resultA,
		B => resultB,
		C => resultC,
		D => resultD,
		E => resultE,
		F => resultF,
		G => resultG,
		H => resultH,
		clk => clk,
		SevenSegControl => SevenSegControl,
		SevenSegBus => SevenSegBus
	);
end Behavioral;

