--------------------------------------------------------------------------------
--  ПРОШИВКА ПЛИС ДЛЯ УСТРОЙСТВА: "zx-keyboard"                              --                        
--  ВЕРСИЯ:                                                 ДАТА:             --
--  АВТОР:   fomonster                                                        --
--                                                                            --
--  ПЛИС: EPM7128SLC84-15                                                     --
--------------------------------------------------------------------------------

library IEEE;
library altera; 
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use altera.altera_primitives_components.all;

--(* Altera_attribute = "-name WEAK_PULL_UP_RESISTOR ON -to K" *)

entity zxkeyboard is 
port
(

--------------------------------------------------------------------------------
--                         СИГНАЛЫ ПЛИС СО СПЕКТРУМА                          --
--------------------------------------------------------------------------------

-- шина адреса клавиатуры

KBA       : in std_logic_vector( 7 downto 0 ) := "11111111";

KBD		 : out std_logic_vector(4 downto 0 ) := "11111";

RES       : out std_logic := 'Z';

NMI       : out std_logic := 'Z';

CS       : out std_logic := '1';

TAPEIN   : out std_logic := '1';

TAPEOUT  : in std_logic := '1';

TAPEPIC  : inout std_logic := 'Z';

REFOCLK : in std_logic := '1';

RDATA : in std_logic := '1';

DSIDE : in std_logic := '1';

TRK00 : in std_logic := '1';

WGATE : in std_logic := '1';

WDATA : in std_logic := '1';

DS1A : in std_logic := '1';

DS1B : in std_logic := '1';

DS0B : in std_logic := '1';

DS0A : in std_logic := '1';

MTON : in std_logic := '1';

INDEX : in std_logic := '1';

--------------------------------------------------------------------------------
--                     ВХОДНЫЕ СИГНАЛЫ ПЛИС PIC                               --
--------------------------------------------------------------------------------

DAT       : in std_logic_vector (3 downto 0 ) := "1111";
STROBE	  : in std_logic := '0';  
RESTRIG	  : in std_logic := '0'

--------------------------------------------------------------------------------
--                                                   					      --
--------------------------------------------------------------------------------

);
end zxkeyboard;

architecture RTL of zxkeyboard is

component PULLUP

PORT ( A: in std_logic );

end component;

--------------------------------------------------------------------------------
--                       ВНУТРЕННИЕ СИГНАЛЫ ПЛИС                              --
--------------------------------------------------------------------------------

shared variable count   : integer;

-- keyboard ports data
shared variable keyData : STD_LOGIC_VECTOR (44 downto 0) := (others => '1'); -- 39..0 keyboard 44..40 data
--shared variable portA : STD_LOGIC_VECTOR (4 downto 0) := "11111";
--shared variable portB : STD_LOGIC_VECTOR (4 downto 0) := "11111";
--shared variable portC : STD_LOGIC_VECTOR (4 downto 0) := "11111";
--shared variable portD : STD_LOGIC_VECTOR (4 downto 0) := "11111";
--shared variable portE : STD_LOGIC_VECTOR (4 downto 0) := "11111";
--shared variable portF : STD_LOGIC_VECTOR (4 downto 0) := "11111";
--shared variable portG : STD_LOGIC_VECTOR (4 downto 0) := "11111";
--shared variable portH : STD_LOGIC_VECTOR (4 downto 0) := "11111";

signal row, row0, row1, row2, row3, row4, row5, row6, row7 : std_logic_vector(4 downto 0);


--------------------------------------------------------------------------------
--                            ПРОЦЕССЫ                                        --
--------------------------------------------------------------------------------

begin

	--------------------------------------------------------------------------------
	-- Клавиатура
	--------------------------------------------------------------------------------
	
	-- получение данных клавиатуры и мышки от PIC 			
	clk_proc : process (STROBE, RESTRIG)
    begin
		if RESTRIG = '1' then
			count := 0;
		else
			if STROBE'event and STROBE = '0' then --falling_edge STROBE'event and STROBE = '0'								
				keyData(count) := DAT(0); 
				keyData(count + 1) := DAT(1); 
				keyData(count + 2) := DAT(2); 
				keyData(count + 3) := DAT(3); 
                count := count + 4;
            end if;                        
        end if;
    end process;
    
    -- клавиатурная матица
	row0 <= keyData(4 downto 0) when KBA(0) = '0' else (others => '1');
	row1 <= keyData(9 downto 5) when KBA(1) = '0' else (others => '1');
	row2 <= keyData(14 downto 10) when KBA(2) = '0' else (others => '1');
	row3 <= keyData(19 downto 15) when KBA(3) = '0' else (others => '1');
	row4 <= keyData(24 downto 20) when KBA(4) = '0' else (others => '1');
	row5 <= keyData(29 downto 25) when KBA(5) = '0' else (others => '1');
	row6 <= keyData(34 downto 30) when KBA(6) = '0' else (others => '1');
	row7 <= keyData(39 downto 35) when KBA(7) = '0' else (others => '1');
	
	-- объединение колонок клавиатурной матрицы
	KBD <= row0 and row1 and row2 and row3 and row4 and row5 and row6 and row7;

	CS <= not keyData(40); -- keyData(40)==1 is light on, keyData(40)==0 - is light off
	
	RES <= 'Z' when keyData(42) = '1' else '0';
	
	NMI <= 'Z' when keyData(43) = '1' else '0';
	
	-- tape control
	
	TAPEPIC <= TAPEOUT when (keyData(40) = '0') else 'Z';
	
	TAPE: process (TAPEPIC ) begin
		if (keyData(40) = '1') then
		  TAPEIN <= TAPEPIC;
		else
		  TAPEIN <= '0';
		end if;
	end process;
	
	--------------------------------------------------------------------------------
	--                                   The end.
	--------------------------------------------------------------------------------

end RTL;

