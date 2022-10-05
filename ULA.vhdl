-- Bruno Keller
-- Felipe Galvão Gregorio
library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity projeto is
    port(
        A: in std_logic_vector(3 downto 0);
        B: in std_logic_vector(3 downto 0);
        saida_led : out std_logic_vector(3 downto 0);
        saida_disp_op : out std_logic_vector(0 to 6);
        saida_disp_result1 : out std_logic_vector(0 to 6);
        saida_disp_result2 : out std_logic_vector(0 to 6);
		  saida_disp_negativo : out std_logic_vector(0 to 6);
        botao_op: in std_logic;
        botao_disp: in std_logic
    );
    end projeto;

architecture ULA of projeto is
    signal cont : integer := 1;
    signal result_arit : integer := 0;
    signal op : integer := 0;
    signal result_logic : std_logic_vector(3 downto 0);

    begin
        process(botao_op) is
            begin
					if rising_edge(botao_op) then
                cont <= cont + 1;
						if cont = 7 then
                    cont <= 1;
						end if;
					end if;
                if cont = 1 then
                    saida_disp_op <= "1001111"; 
                elsif cont = 2 then
                    saida_disp_op <= "0010010"; 
                elsif cont = 3 then
                    saida_disp_op <= "0000110"; 
                elsif cont = 4 then
                    saida_disp_op <= "1001100"; 
                elsif cont = 5 then 
                    saida_disp_op <= "0100100"; 
                elsif cont = 6 then
                    saida_disp_op <= "0100000"; 
					 elsif cont = 0 then 
						  saida_disp_op <= "1111111";
                end if; 
		end process;
		
		process(botao_disp) is
			begin
				if rising_edge(botao_disp) then
					if cont = 1 then
                    result_arit <= to_integer(unsigned(A)) + to_integer(unsigned(B));
						  op <= 0;
               elsif cont = 2 then
                    result_arit <= to_integer(unsigned(A)) - to_integer(unsigned(B));
						    op <= 0;
               elsif cont = 3 then
                    result_logic <= A and B;
						    op <= 1;
               elsif cont = 4 then
                    result_logic <= A or B;
						    op <= 1;
               elsif cont = 5 then 
                    result_logic <= A xor B;
						    op <= 1;
               elsif cont = 6 then
                    result_logic <= not A;
						    op <= 1;
               end if;
				end if;	
				  if op = 1 then
						saida_led <= result_logic;
						saida_disp_negativo <= "1111111";
						saida_disp_result1 <= "1111111"; 
						saida_disp_result2 <= "1111111";
				  elsif op = 0 then
						saida_led <= "0000";
						case result_arit is
							 when -1 => 
								  saida_disp_negativo <= "1111110";-- -
								  saida_disp_result1 <= "0000001"; -- 0
								  saida_disp_result2 <= "1001111"; -- 1
							 when -2 =>
								  saida_disp_negativo <= "1111110";-- -
								  saida_disp_result1 <= "0000001"; -- 0
								  saida_disp_result2 <= "0010010"; -- 2
							 when -3 => 
								  saida_disp_negativo <= "1111110";-- -
								  saida_disp_result1 <= "0000001"; -- 0
								  saida_disp_result2 <= "0000110"; -- 3
							 when -4 =>  
								  saida_disp_negativo <= "1111110";-- - 
								  saida_disp_result1 <= "0000001"; -- 0
								  saida_disp_result2 <= "1001100"; -- 4
							 when -5 =>  
								  saida_disp_negativo <= "1111110";-- - 
								  saida_disp_result1 <= "0000001"; -- 0
								  saida_disp_result2 <= "0100100"; -- 5
							 when -6 =>  
								  saida_disp_negativo <= "1111110";-- - 
								  saida_disp_result1 <= "0000001"; -- 0
								  saida_disp_result2 <= "0100000"; -- 6
							 when -7 => 
								  saida_disp_negativo <= "1111110";-- -	 
								  saida_disp_result1 <= "0000001"; -- 0
								  saida_disp_result2 <= "0001111"; -- 7
							 when -8 => 
								  saida_disp_negativo <= "1111110";-- -	 
								  saida_disp_result1 <= "0000001"; -- 0
								  saida_disp_result2 <= "0000000"; -- 8
							 when -9 =>
								  saida_disp_negativo <= "1111110";-- -		 
								  saida_disp_result1 <= "0000001"; -- 0
								  saida_disp_result2 <= "0001100"; -- 9
							 when -10 =>  
								  saida_disp_negativo <= "1111110";-- - 
								  saida_disp_result1 <= "1001111"; -- 1
								  saida_disp_result2 <= "0000001"; -- 0
							 when -11=>  
								  saida_disp_negativo <= "1111110";-- - 
								  saida_disp_result1 <= "1001111"; -- 1
								  saida_disp_result2 <= "1001111"; -- 1
							 when -12=>
								  saida_disp_negativo <= "1111110";-- -		 
								  saida_disp_result1 <= "1001111"; -- 1
								  saida_disp_result2 <= "0010010"; -- 2
							 when -13=>  
								  saida_disp_negativo <= "1111110";-- - 
								  saida_disp_result1 <= "1001111"; -- 1
								  saida_disp_result2 <= "0000110"; -- 3
							 when -14=>
								  saida_disp_negativo <= "1111111";-- -
								  saida_disp_result1 <= "1001111"; -- 1
								  saida_disp_result2 <= "1001100"; -- 4
							 when -15=>  
								  saida_disp_negativo <= "1111110";-- - 
								  saida_disp_result1 <= "1001111"; -- 1
								  saida_disp_result2 <= "0100100"; -- 5
							 when 0 =>
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "0000001"; -- 0
								  saida_disp_result2 <= "0000001"; -- 0
							 when 1 => 
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "0000001"; -- 0
								  saida_disp_result2 <= "1001111"; -- 1
							 when 2 =>
								  saida_disp_negativo <= "1111111";		 
								  saida_disp_result1 <= "0000001"; -- 0
								  saida_disp_result2 <= "0010010"; -- 2
							 when 3 =>
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "0000001"; -- 0
								  saida_disp_result2 <= "0000110"; -- 3
							 when 4 =>
								  saida_disp_negativo <= "1111111";		 
								  saida_disp_result1 <= "0000001"; -- 0
								  saida_disp_result2 <= "1001100"; -- 4
							 when 5 =>
								  saida_disp_negativo <= "1111111";		 
								  saida_disp_result1 <= "0000001"; -- 0
								  saida_disp_result2 <= "0100100"; -- 5
							 when 6 =>
								  saida_disp_negativo <= "1111111";		 
								  saida_disp_result1 <= "0000001"; -- 0
								  saida_disp_result2 <= "0100000"; -- 6
							 when 7 =>   
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "0000001"; -- 0
								  saida_disp_result2 <= "0001111"; -- 7
							 when 8 =>   
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "0000001"; -- 0
								  saida_disp_result2 <= "0000000"; -- 8
							 when 9 =>   
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "0000001"; -- 0
								  saida_disp_result2 <= "0001100"; -- 9
							 when 10 =>   
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "1001111"; -- 1
								  saida_disp_result2 <= "0000001"; -- 0
							 when 11=>   
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "1001111"; -- 1
								  saida_disp_result2 <= "1001111"; -- 1
							 when 12=>   
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "1001111"; -- 1
								  saida_disp_result2 <= "0010010"; -- 2
							 when 13=>   
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "1001111"; -- 1
								  saida_disp_result2 <= "0000110"; -- 3
							 when 14=>   
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "1001111"; -- 1
								  saida_disp_result2 <= "1001100"; -- 4
							 when 15=>   
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "1001111"; -- 1
								  saida_disp_result2 <= "0100100"; -- 5
							 when 16=>   
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "1001111"; -- 1
								  saida_disp_result2 <= "0100000"; -- 6
							 when 17=>   
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "1001111"; -- 1
								  saida_disp_result2 <= "0001111"; -- 7
							 when 18 => 
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "1001111"; -- 1
								  saida_disp_result2 <= "0000000"; -- 8
							 when 19 =>   
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "1001111"; -- 1
								  saida_disp_result2 <= "0001100"; -- 9
							 when 20 =>   
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "0010010"; -- 2
								  saida_disp_result2 <= "0000001"; -- 0
							 when 21 =>   
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "0010010"; -- 2
								  saida_disp_result2 <= "1001111"; -- 1
							 when 22 =>   
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "0010010"; -- 2
								  saida_disp_result2 <= "0010010"; -- 2
							 when 23 =>   
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "0010010"; -- 2
								  saida_disp_result2 <= "0000110"; -- 3
							 when 24 =>   
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "0010010"; -- 2
								  saida_disp_result2 <= "1001100"; -- 4
							 when 25 =>   
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "0010010"; -- 2
								  saida_disp_result2 <= "0100100"; -- 5
							 when 26 =>   
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "0010010"; -- 2
								  saida_disp_result2 <= "0100000"; -- 6
							 when 27 =>   
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "0010010"; -- 2
								  saida_disp_result2 <= "0001111"; -- 7
							 when 28 =>   
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "0010010"; -- 2
								  saida_disp_result2 <= "0000000"; -- 8
							 when 29 =>   
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "0010010"; -- 2
								  saida_disp_result2 <= "0001100"; -- 9
							 when 30 =>   
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <= "0000110"; -- 3
								  saida_disp_result2 <= "0000001"; -- 0
							when others => 
								  saida_disp_negativo <= "1111111";
								  saida_disp_result1 <=	"1111111";
								  saida_disp_result2 <=	"1111111";
							end case;
				  end if;
				 
			end process;
end ULA;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
