library ieee;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_1164.all;
entity forming_parts  is
	port(
          IR      : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
          PSW     : IN STD_LOGIC;
          RESET	  : IN STD_LOGIC;
          CLK     : IN STD_LOGIC;
		  output  : IN std_logic_vector(4  downto 0);
	      sign    : IN std_logic_vector(1  downto 0);
          ADDRESS : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)		  
	);
end  forming_parts ;

ARCHITECTURE forming_part_body of forming_parts is
begin
    process(IR,RESET,CLK,PSW,OUTPUT,SIGN)
	 BEGIN 
	     IF RESET = '1'  THEN   ADDRESS <=  "00000";
		 ELSIF CLK'EVENT AND CLK = '0' THEN 
		     IF SIGN = "00"     THEN ADDRESS <= OUTPUT ;
			 ELSIF SIGN = "10"  THEN ADDRESS <= IR;
			 ELSIF SIGN = "01"  then
			      IF PSW ='0' THEN ADDRESS <= "00000";
				  ELSE                 ADDRESS <= "ZZZZZ";
				  END IF;
			END IF;
		END IF ;
	END PROCESS;
END forming_part_body;