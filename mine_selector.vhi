
-- VHDL Instantiation Created from source file mine_selector.vhd -- 15:47:09 11/25/2019
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT mine_selector
	PORT(
		selector : IN std_logic_vector(2 downto 0);          
		selected : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_mine_selector: mine_selector PORT MAP(
		selector => ,
		selected => 
	);


