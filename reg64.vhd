library ieee;
use ieee.std_logic_1164.all;

entity reg64 is
	port(
		clk	:	in std_logic;
		clr	:	in std_logic;
		en		:	in std_logic;
		d		:	in std_logic_vector(63 downto 0);
		q1		:	out std_logic_vector(31 downto 0);
		q0		:	out std_logic_vector(31 downto 0)
	);
end entity;

architecture behavior of reg64 is
begin
	process(clk, clr)
		begin
			if(clr = '0') then
				q1 <= (others => '0');
				q0 <= (others => '0');
			elsif(rising_edge(clk)) then
				if(en = '1') then
					q1 <= d(63 downto 32);
					q0 <= d(31 downto 0);
				end if;
			end if;
		end process;
end architecture;
