library ieee;
use ieee.std_logic_1164.all;

entity parte1 is
    port(
        clk, reset_signal, entrada: in std_logic;
        saida: out std_logic_vector(1 downto 0)
    );
end entity parte1;

architecture comportamento of parte1 is

type estado is (ResetState, A, B, C, D);
signal estado_atual, proximo_estado: estado;
signal clk_05hz : std_logic := '0';
signal contador : integer range 0 to 100000000 := 0;

begin

    -- processo para o divisor de frequência
    divisor_freq: process(clk, reset_signal)
    begin
        if reset_signal = '1' then
            contador <= 0;
            clk_05hz <= '0';
        elsif rising_edge(clk) then
            if contador = 100000000 then
                contador <= 0;
                clk_05hz <= not clk_05hz;
            else
                contador <= contador + 1;
            end if;
        end if;
    end process divisor_freq;

    -- processo para definição do sincronismo da FSM
    sincrono: process(clk_05hz, reset_signal)
    begin
        if reset_signal = '1' then
            estado_atual <= ResetState;
        elsif rising_edge(clk_05hz) then
            estado_atual <= proximo_estado;
        end if;
    end process sincrono;

    -- processo para a lógica combinacional da máquina
    combinacional: process(estado_atual)
    begin
        case estado_atual is
            when ResetState =>
                saida <= "00";
                proximo_estado <= A;
            when A =>
                saida <= "00";
                proximo_estado <= B;
            when B =>
                saida <= "01";
                proximo_estado <= C;
            when C =>
                saida <= "10";
                proximo_estado <= D;
            when D =>
                saida <= "11";
                proximo_estado <= A;
        end case;
    end process combinacional;
end architecture comportamento;