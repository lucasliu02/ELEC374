library ieee;
use ieee.std_logic_1164.all;

entity reg32_tb is
end;

architecture test of reg32_tb is
	signal clk_tb	: std_logic;
	signal clr_tb : std_logic;
	signal en_tb : std_logic;
	signal d_tb : std_logic_vector(31 downto 0);
	signal q_tb : std_logic_vector(31 downto 0);
	
	component reg32
		port(
			clk	:	in std_logic;
			clr	:	in std_logic;
			en		:	in std_logic;
			d		:	in std_logic_vector(31 downto 0);
			q		:	out std_logic_vector(31 downto 0)
		);
	end component reg32;

begin
	DUT	:	reg32
	port map(
		clk	=> clk_tb,
		clr	=> clr_tb,
		en		=> en_tb,
		d		=> d_tb,
		q		=> q_tb
	);
	
	clk_process: process
	begin
		clk_tb	<= '1', '0' after 10 ns;
		wait for 20 ns;
	end process clk_process;
	
	sim_process: process
	begin
		wait for 0 ns;
		clr_tb	<= '0';
		en_tb		<= '1';
		d_tb		<= (others => '1');
		wait for 20 ns;
		clr_tb	<= '1';
		en_tb		<= '1';
		d_tb		<= (others => '1');
		wait;
	end process sim_process;
end;