library ieee;
use ieee.std_logic_1164.all;

entity Sel_ACC is 
	port(ina,inb:in std_logic_vector(7 downto 0);
		 con:in std_logic_vector(1 downto 0);
		 output:out std_logic_vector(7 downto 0)
		);
end Sel_ACC ;

architecture Sel2_1 of Sel_ACC  is
begin
	process(ina,inb,con)
	begin
		if(con="10")then output<=ina;
		elsif(con="01")then output<=inb;
		else
			output<="ZZZZZZZZ";
		end if;
	end process;
end Sel2_1;