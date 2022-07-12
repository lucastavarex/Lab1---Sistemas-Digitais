-------------- DATA: 22/06/2022                        --------------
-------------- AUTOR: LUCAS TAVARES DA SILVA FERREIRA  --------------
-------------- DRE: 120152739                          --------------
-------------- TÍTULO: TRABALHO 1 DE LABORATÓRIO       --------------
-------------- DISCIPLINA: SISTEMAS DIGITAIS           --------------
-------------- PROFESSOR: ROBERTO PACHECO              --------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- NESTE ARQUIVO PRINCIPAL(MAIN), SERÁ ARQUITETADO A 
-- COMUNICAÇÃO DO SOFTWARE COM O HARDWARE(PLACA), DEFININDO AS ENTRADAS E SAÍDAS.

ENTITY MAIN IS -- COMPONENTES DA FPGA
    PORT( 
		V_SW: IN STD_LOGIC_VECTOR (2 DOWNTO 0);  -- VETOR DAS ENTRADAS 
		CLOCK_50: in STD_LOGIC;
	    LEDR: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)  --  LED DAS FLAGS + LED DO RESULTADO  |                                                                            
		  --                                                                           | 
		  --                           ATENÇÃO!!!                    <-----------------*  
          --   1)   OS 4 PRIMEIRO BITS SÃO REFERENTES AS FLAGS !!!	 
		  --   2)   OS OUTROS 4 BITS SÃO REFERENTES AO RESULTADO DA OPERAÇÃO!!!
		  --   3)   AS VARIÁVEIS ESCOLHIDAS SÃO COMPATIVEIS COM O LABSLANDS
		
            );
END MAIN;
ARCHITECTURE DADOS OF MAIN IS
-- SIGNAL SAIDA TEMPORÁRIO : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL RES : STD_LOGIC_VECTOR(3 DOWNTO 0); 
-- SIGNAL SAIDA FINAL : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL RES2: STD_LOGIC_VECTOR (3 DOWNTO 0); 
 
			


COMPONENT ULA IS 
    PORT( 
		A, B: IN STD_LOGIC_VECTOR (3 DOWNTO 0); 
		SEL : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
		RES: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		COUT,NULO,OVRF,NEG: OUT STD_LOGIC;
		RES2: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
	    R1,R2,R3,R4: OUT STD_LOGIC
        

            );
END COMPONENT ULA;

signal A: STD_LOGIC_VECTOR(3 downto 0) := "0000";
	signal B: STD_LOGIC_VECTOR(3 downto 0) := "0000";
	
	--Counter Vector
	signal counter: unsigned(7 downto 0) := "00000000";

-- Dos 8 bits gerados por esse contador, os 4 menos significativos compoem A e os 4 mais significativos, B.
-- Como clock recebido é de 50 Mhz, esta frequência foi dividida por 80 milhões, o que gera
-- um período de contagem da ordem de 1,6 segundos.

-- OBS! O contador não funcionou quando a frequencia foi dividida por 100 milhões para gerar um período 
-- contagem de 2 segundos!

BEGIN 
    A(0) <= counter(0);
	A(1) <= counter(1);
	A(2) <= counter(2);
	A(3) <= counter(3);
	B(0) <= counter(4);
	B(1) <= counter(5);
	B(2) <= counter(6);
	B(3) <= counter(7);
	
	

-- AQUI ASSOCIA-SE AS SAIDAS E ENTRADAS DA NOSSA UNIDADE LÓGICA ARITMÉTICA COM A FPGA !!!

UNIDADE: ULA PORT MAP (A,B,V_SW( 2 DOWNTO 0),RES,LEDR(3),LEDR(1),LEDR(2),LEDR(0),RES2,LEDR(7),LEDR(6),LEDR(5) ,LEDR(4));


process(CLOCK_50)
	
	 VARIABLE reductClock : integer range 100000000 downto 0 := 0;
	 
	begin
	
	    if (CLOCK_50'event and CLOCK_50='1') then
	        if (reductClock <= 80000000) then
	            reductClock := reductClock + 1;
	       else
	        counter <= counter + 1;
	        reductClock := 0;
	        
	        end if;
	    end if;
	end process;
	
	end DADOS;
