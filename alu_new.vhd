-- USN VHDL 101 course
-- very small ALU

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_new is
    Port ( opA, opB: in std_logic_vector(3 downto 0);
           ctr: in std_logic_vector(3 downto 0);
           res: out std_logic_vector(4 downto 0)  	 );
end alu_new;

--  ctr="0000"  --> add
--  ctr="0001"   --> substract
--  ctr="0010"   --> multiply
--  ctr="0011"   --> divide
--  ctr="0100" -->right shift A
--  ctr="0101" --> left shift A
--  ctr="0110" --> right shift B
--  ctr="0111" --> left shift B        
--  ctr="1000"    --> nand
--  ctr="1001"     --> nor
--  ctr="1010"     --> and
--  ctr="1011"      --> or
--  ctr="1100"     -->xor
--  ctr="1101"    -->xnor
--  ctr="1110"  -->not A
--  ctr="1111" --> not B


architecture alu_new_arch of alu_new is
signal uopA1, uopB1: unsigned(4 downto 0);
signal ures1: unsigned(4 downto 0):= (others=>'0');
signal umult: unsigned(9 downto 0):= (others=> '0');  -- for multiplication the size should be sum of length of both operands

begin

uopA1 <= unsigned('0' & opA);
uopB1 <= unsigned('0' & opB); 
process(uopA1,uopB1,ctr)
    begin
    -- initialize ures1 to 0
    umult <= (others => '0');
    case ctr is 
        when "0000" =>
        ures1 <= uopA1 + uopB1 ;
        when  "0001" =>
        ures1 <=uopA1 - uopB1 ;
        when  "0010" =>
        umult <= uopA1 * uopB1 ;
        when  "0011" =>
        ures1 <= uopA1 / uopB1 ;
        when  "0100" =>
        ures1 <= '0' & uopA1(4 downto 1) ;
        when  "0101" =>
        ures1 <=uopA1(3 downto 0) & '0' ;
        when  "0110" =>
        ures1 <='0' & uopB1(4 downto 1) ;
        when  "0111" =>
        ures1 <=uopB1(3 downto 0) & '0' ;
        when  "1000" =>
        ures1 <=uopA1 nand uopB1 ;
        when  "1001" =>
        ures1 <=uopA1 nor uopB1 ;
        when  "1010" =>
        ures1 <=uopA1 and uopB1 ;
        when  "1011" =>
        ures1 <=uopA1 or uopB1 ;
        when  "1100" =>
        ures1 <=uopA1 xor uopB1 ;
        when  "1101" =>
        ures1 <=uopA1 xnor uopB1 ;
        when  "1110" =>
        ures1 <= not uopA1  ;
        when others =>
        ures1 <= not(uopB1);  
    end case;      
    end process;
    res <= std_logic_vector(umult(4 downto 0)) when ctr="0010" else std_logic_vector(ures1);
end alu_new_arch;

