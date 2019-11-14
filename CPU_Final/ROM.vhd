library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;         -- Needed for shift

entity rom is
    Port ( A : in   std_logic_vector (31 downto 0);
           D : out  std_logic_vector (31 downto 0));
end rom;

architecture Behavioral of rom is
  signal W : unsigned(31 downto 0);

  -- The ROM is represented as an array
  --
  -- TODO: change the value 7 to reflect the size of your ROM. In this
  -- there are 8 words, numbered 0 to 7.
  --
  type rom_type is array (0 to 10) of std_logic_vector (31 downto 0);   
  
  -- These are the contents of the ROM in 32 bit hex words
  -- The contents of address zero comes first in this array
  --
  -- TODO: change the contents to be what you want - the array must be
  --       the same size as the value you entered above
  -- 
  
 
  constant ROMarr : rom_type :=
  (
	-- program_1
--    x"00004820",	-- add $t1, $0, $0
--    x"200a0009",  -- addi $t2, $0, 9
--	 -- loop:
--    x"ac09fff0",  -- sw $t1, 0xFFFFFFF0
--    x"112a0002",  -- beq $t1, $t2, reset
--    x"21290001",  -- addi, $t1, $t1, 1
--    x"08000002",  -- j loop
--	 -- reset:
--    x"00004820",  -- add $t1, $0, $0
--    x"08000002"); -- j loop
	 
	-- program_2
	 x"20040001",
	 x"10c40003",		-- if $a2 and $a0 is equal, jump to compare
	 x"20c60001",		-- increase $a2
	 x"00a42820",		-- add $a0 and $a1, store in $a1
	 x"1000fffc",		-- jump to "gain" loop
	 x"00054820",		-- get ready for display it
	 x"ac09fff0",		-- display $ti
	 x"00002820",		-- release $a1
	 x"00003020",		-- release $a2
	 x"20840001",		-- increase $a0
	 x"1000fff6");		-- jump to "gain" loop




begin
  W <= shift_right(unsigned(A), 2); -- The address is in bytes and we want a word address
  D <= ROMarr(to_integer(W));       -- Get the value from the array
end Behavioral;
