library ieee;
use ieee.std_logic_1164.all;

entity fsm_elevador is
port(
    andar1 : in std_logic; --recebe do arduino
    andar2 : in std_logic; --recebe do arduino
    andar3 : in std_logic; --recebe do arduino
    botao1 : in std_logic; --chave switch
    botao2 : in std_logic; --chave switch
    botao3 : in std_logic; --chave switch
    b1 : out std_logic; --manda para o arduino
    b2 : out std_logic; --manda para o arduino
    b3 : out std_logic; --manda para o arduino
    reset : in std_logic;
    motor : out std_logic; --manda para o arduino
    sentido : out std_logic --manda para o arduino
);
end fsm_elevador;

architecture hardware of fsm_elevador is
    type casos is (espera, casoA, casoB, casoC, casoD);
    signal aux1, aux2, aux3 : std_logic;
    signal estado : casos;

begin
    b1 <= botao1;
    b2 <= botao2;
    b3 <= botao3;

    my_process1 : process(botao1, botao2, botao3, andar1, andar2, andar3)
    begin
        if (botao1 = '1') then
            aux1 <= botao1;
        elsif(botao2 = '1') then
            aux2 <= botao2;
        elsif(botao3 = '1') then
            aux3 <= botao3;
        end if;

        if(andar1 = '1') then
            aux1 <= '0';
        elsif(andar2 = '1') then
            aux2 <= '0';
        elsif(andar3 = '1') then
            aux3 <= '0';
        end if;
    end process my_process1;

    my_process2 : process(andar1, andar2, andar3, aux1, aux2, aux3)
    begin
        if ((aux1 OR aux2 OR aux3) = '0') then
            estado <= espera;
        elsif((aux1 OR aux2 OR aux3) = '1') then
            case estado is
                when espera =>
                    if(aux1 ='1' AND ((andar2 ='1') OR (andar3 ='1'))) then
                        estado <= casoA;
                    elsif(aux3 ='1' AND ((andar1='1') OR (andar2='1'))) then
                        estado <= casoB;
                    elsif((aux2 AND andar3) = '1' ) then
                        estado <= casoC;
                    elsif((aux2 AND andar1) = '1') then
                        estado <= casoD;
                    else
                        estado <= espera;
                    end if;
                when casoA =>
                    if(andar1 = '0') then
                        estado <= casoA;
                    else
                        estado <= espera;
                    end if;
                when casoB =>
                    if(andar3 = '0') then
                        estado <= casoB;
                    else
                        estado <= espera;
                    end if;
                when casoC =>
                    if(andar2 = '0') then
                        estado <= casoC;
                    else
                        estado <= espera;
                    end if;
                when casoD =>
                    if(andar2 = '0') then
                        estado <= casoD;
                    else
                        estado <= espera;
                    end if;
            end case;
        end if;
    end process my_process2;

    my_process3 : process(estado)
    begin
        case estado is
            when espera =>
                sentido <= '0';
                motor <= '0';
            when casoA =>
                sentido <= '0';
                motor <= '1';
            when casoB =>
                sentido <= '1';
                motor <= '1';
            when casoC =>
                sentido <= '0';
                motor <= '1';
            when casoD =>
                sentido <= '1';
                motor <= '1';
        end case;
    end process my_process3;
end hardware;
