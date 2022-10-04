library ieee;

use.ieee.std_logic_1164.all;

entity ULA is
    port(
        A: in std_logic_vector(3 downto 0);
        B: in std_logic_vector(3 downto 0);
        saida_led : out std_logic_vector(3 downto 0);
        saida_disp_op : out std_logic_vector(0 to 6);
        saida_disp_result1 : out std_logic_vector(0 to 6);
        saida_disp_result2 : out std_logic_vector(0 to 6);
        botao_op: in std_logic;
        botao_disp: in std_logic
    );
    end ULA;

architecture processador of ULA is
    signal cont : integer := 0;
    signal result_arit : integer := 0;
    signal op : integer := 0;
    signal result_logic : logic_vector(3 downto 0);

    begin
        process(botao_op)
            begin
                cont <= cont + 1;
                if cont = 1 then
                    saida_disp_op <= "" -- operação 1
                    result_arit <= to_integer(unsigned(A)) + to_integer(unsigned(B));
                    op <= 0;
                elsif cont = 2 then
                    saida_disp_op <= "" -- operação 2
                    result_arit <= to_integer(unsigned(A)) - to_integer(unsigned(B));
                    op <= 0;
                elsif cont = 3 then
                    saida_disp_op <= "" -- operação 3
                    result_logic <= A and B;
                    op <= 1;
                elsif cont = 4 then
                    saida_disp_op <= "" -- operação 4
                    result_logic <= A or B;
                    op <= 1;
                elsif cont = 5 then 
                    saida_disp_op <= "" -- operação 5
                    result_logic <= A xor B;
                    op <= 1;
                elsif cont = 6 then
                    saida_disp_op <= "" -- operação 6
                    result_logic <= not A;
                    op <= 1;
                elsif cont = 7 then
                    cont <= 1;
                end if; 

                if botao_disp = 0 then
                    if op = 1 then
                        saida_led <= result_logic;
                    elsif op = 0 then
                        case result_arit is
                            when 1 => 
                                saida_disp_result1 <= ""; -- 0
                                saida_disp_result2 <= ""; -- 1
                            when 2 =>   
                                saida_disp_result1 <= ""; -- 0
                                saida_disp_result2 <= ""; -- 2
                            when 3 =>   
                                saida_disp_result1 <= ""; -- 0
                                saida_disp_result2 <= ""; -- 3
                            when 4 =>   
                                saida_disp_result1 <= ""; -- 0
                                saida_disp_result2 <= ""; -- 4
                            when 5 =>   
                                saida_disp_result1 <= ""; -- 0
                                saida_disp_result2 <= ""; -- 5
                            when 6 =>   
                                saida_disp_result1 <= ""; -- 0
                                saida_disp_result2 <= ""; -- 6
                            when 7 =>   
                                saida_disp_result1 <= ""; -- 0
                                saida_disp_result2 <= ""; -- 7
                            when 8 =>   
                                saida_disp_result1 <= ""; -- 0
                                saida_disp_result2 <= ""; -- 8
                            when 9 =>   
                                saida_disp_result1 <= ""; -- 0
                                saida_disp_result2 <= ""; -- 9
                            when 10 =>   
                                saida_disp_result1 <= ""; -- 1
                                saida_disp_result2 <= ""; -- 0
                            when 11=>   
                                saida_disp_result1 <= ""; -- 1
                                saida_disp_result2 <= ""; -- 1
                            when 12=>   
                                saida_disp_result1 <= ""; -- 1
                                saida_disp_result2 <= ""; -- 1
                            when 13=>   
                                saida_disp_result1 <= ""; -- 1
                                saida_disp_result2 <= ""; -- 1
                            when 14=>   
                                saida_disp_result1 <= ""; -- 1
                                saida_disp_result2 <= ""; -- 1
                            when 15=>   
                                saida_disp_result1 <= ""; -- 1
                                saida_disp_result2 <= ""; -- 1
                            when 16=>   
                                saida_disp_result1 <= ""; -- 1
                                saida_disp_result2 <= ""; -- 1
                            when 17=>   
                                saida_disp_result1 <= ""; -- 1
                                saida_disp_result2 <= ""; -- 1
                            when 18 => 
                                saida_disp_result1 <= ""; -- 0
                                saida_disp_result2 <= ""; -- 1
                            when 19 =>   
                                saida_disp_result1 <= ""; -- 0
                                saida_disp_result2 <= ""; -- 2
                            when 20 =>   
                                saida_disp_result1 <= ""; -- 0
                                saida_disp_result2 <= ""; -- 3
                            when 21 =>   
                                saida_disp_result1 <= ""; -- 0
                                saida_disp_result2 <= ""; -- 4
                            when 22 =>   
                                saida_disp_result1 <= ""; -- 0
                                saida_disp_result2 <= ""; -- 5
                            when 23 =>   
                                saida_disp_result1 <= ""; -- 0
                                saida_disp_result2 <= ""; -- 6
                            when 24 =>   
                                saida_disp_result1 <= ""; -- 0
                                saida_disp_result2 <= ""; -- 7
                            when 25 =>   
                                saida_disp_result1 <= ""; -- 0
                                saida_disp_result2 <= ""; -- 8
                            when 26 =>   
                                saida_disp_result1 <= ""; -- 0
                                saida_disp_result2 <= ""; -- 9
                            when 27 =>   
                                saida_disp_result1 <= ""; -- 1
                                saida_disp_result2 <= ""; -- 0
                            when 28 =>   
                                saida_disp_result1 <= ""; -- 1
                                saida_disp_result2 <= ""; -- 1
                            when 29 =>   
                                saida_disp_result1 <= ""; -- 1
                                saida_disp_result2 <= ""; -- 1
                            when 30=>   
                                saida_disp_result1 <= ""; -- 3
                                saida_disp_result2 <= ""; -- 0
                           end case;
                    end if;
                end if
            end process;

end processador;