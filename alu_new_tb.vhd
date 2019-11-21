library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity alu_new_tb is

end entity;


architecture alu_new_tb_arch of alu_new_tb is

signal opA_tb, opB_tb: std_logic_vector(3 downto 0);
signal ctr_tb: std_logic_vector(3 downto 0);
signal res_tb: std_logic_vector(4 downto 0);

begin

component_init: entity work.alu_new(alu_new_arch) port map( opA => opA_tb, opB => opB_tb, ctr => ctr_tb, res => res_tb); 

io_process: process
begin

    opA_tb <= "0010"; -- 2
    opB_tb <= "0101"; -- 5
    ctr_tb<="0000";  --> add
    wait for 30 ns;
    ctr_tb<="0001";   --> substract
    wait for 30 ns;
    ctr_tb<="0010";   --> multiply
    wait for 30 ns;
    ctr_tb<="0011";   --> divide
    wait for 30 ns;
    ctr_tb<="0100"; -->right shift A
    wait for 30 ns;
    ctr_tb<="0101"; --> left shift A
    wait for 30 ns;
    ctr_tb<="0110"; --> right shift B
    wait for 30 ns;
    ctr_tb<="0111"; --> left shift B        
    wait for 30 ns;
    ctr_tb<="1000";    --> nand
    wait for 30 ns;
    ctr_tb<="1001";     --> nor
    wait for 30 ns;
    ctr_tb<="1010";     --> and
    wait for 30 ns;
    ctr_tb<="1011";      --> or
    wait for 30 ns;
    ctr_tb<="1100";     -->xor
    wait for 30 ns;
    ctr_tb<="1101";    -->xnor
    wait for 30 ns;
    ctr_tb<="1110";  -->not A
    wait for 30 ns;
    ctr_tb<="1111"; --> not B
    wait for 30 ns;

end process;

end alu_new_tb_arch;
