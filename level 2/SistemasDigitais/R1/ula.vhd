----------------------------------------------------------------------------------
-- Company:   Federal University of Santa Catarina
-- Engineer:  <Arthur Mesquita Pickcius>
-- 
-- Create Date: <2017-09-17> 
-- Design Name: 
-- Module Name:    
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
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ULA is
	generic(width: positive := 14);
	port(
		a, b: in std_logic_vector(width-1 downto 0);
		op: in std_logic_vector(2 downto 0);  --000:AND , 001:OR , 010:ADD, 110:SUB, 111:SLT
		zero: out std_logic;
		res: out std_logic_vector(width-1 downto 0)
	);
end entity;

architecture Behavioral of ULA is
	signal r: std_logic_vector(width-1 downto 0);
begin
	r	 <= 	a and b 			when op="000" else
				a or b 			when op="001" else 
				(others=>'1')	when op="111" and (a < b) else
				(others=>'0')	when op="111" else
				a - b 			when op="110" else
				a + b;
	zero <= '1' when r=0 else '0';
	res <= r;
end architecture;