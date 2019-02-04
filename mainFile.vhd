----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/04/2019 02:40:04 PM
-- Design Name: 
-- Module Name: mainFile - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mainFile is
--  Port ( );
port(
    clk: in  STD_LOGIC;
    sw: in std_logic_vector (15 downto 0);
    led: out std_logic_vector (15 downto 0);
    seg: out std_logic_vector (6 downto 0);
    dp: out std_logic;
    an: out std_logic_vector(3 downto 0)
    );
    
end mainFile;

architecture Behavioral of mainFile is
    
--    component mux
--        port(
--        in1, in2: in std_logic;
--        out1, out2, out3, out4: out std_logic);
--    end component;
      component four_to_one_multiplexer
      port(
            s: in std_logic_vector (1 downto 0);
            x: in std_logic_vector (3 downto 0);
            y: out std_logic
          );
      end component;

    
begin
--    U1: mux port map
--        (
--        in1=>sw(0), 
--        in2=>sw(1),
--        out1=>led(0),
--        out2=>led(1),
--        out3=>led(2),
--        out4=>led(3)
--        );
      U2: four_to_one_multiplexer port map
          (s => sw(1 downto 0),
           x => sw(5 downto 2),
           y => led(0)
           );
               
end Behavioral;

----------------------------------------------------------------------------------
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
--  Port ( );
port(
    in1, in2:               in std_logic;
    out1, out2, out3, out4: out std_logic
    );
end mux;

architecture Dataflow of mux is
begin
    out1 <= ((not in1) and (not in2));
    out2 <= (in1 and (not in2));
    out3 <= ((not in1) and in2);
    out4 <= (in1 and in2);
end Dataflow;

----------------------------------------------------------------------------------
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
-- one 7 segment

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity four_to_one_multiplexer is
--  Port ( );
port(
    s: in std_logic_vector (1 downto 0);
    x: in std_logic_vector (3 downto 0);
    y: out std_logic
    );
end four_to_one_multiplexer;

architecture Dataflow of four_to_one_multiplexer is
begin 
process(x)
begin
case s is
    when "00" => y<=x(0);
    when "01" => y<=x(1);
    when "10" => y<=x(2);
    when others => y<=x(3);
end case;
end process;
end Dataflow;
----------------------------------------------------------------------------------






