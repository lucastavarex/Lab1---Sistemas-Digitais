-------------- DATA: 22/06/2022                        --------------
-------------- AUTOR: LUCAS TAVARES DA SILVA FERREIRA  --------------
-------------- DRE: 120152739                          --------------
-------------- TÍTULO: TRABALHO 1 DE LABORATÓRIO       --------------
-------------- DISCIPLINA: SISTEMAS DIGITAIS           --------------
-------------- PROFESSOR: ROBERTO PACHECO              --------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ULA_TB IS
    END ULA_TB;
    
ARCHITECTURE TEST OF ULA_TB IS
COMPONENT ULA IS
		PORT(
		 A, B: IN STD_LOGIC_VECTOR (3 DOWNTO 0);      -- OPERANDOS
         SEL : IN STD_LOGIC_VECTOR (2 DOWNTO 0);      -- SELECIONA OPERAÇÃO 
         RES: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);      -- VETOR DE SAÍDA TEMPORÁRIA
         COUT,NULO,OVRF,NEG: OUT STD_LOGIC;           -- FLAGS
         RES2: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);     -- VETOR DE SAÍDA FINAL
         R1,R2,R3,R4: OUT STD_LOGIC );                -- VARIÁVEIS TEMPORÁRIAS DE RESULTADO

END COMPONENT ULA;
    
    SIGNAL A: STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL B: STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL SEL: STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL RES: STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL COUT: STD_LOGIC;
    SIGNAL NULO: STD_LOGIC;
    SIGNAL OVER: STD_LOGIC;
    SIGNAL NEG: STD_LOGIC;
    SIGNAL RES2: STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL R1: STD_LOGIC;
    SIGNAL R2: STD_LOGIC;
    SIGNAL R3: STD_LOGIC;
    SIGNAL R4: STD_LOGIC;
    
   
    
    
    
    -- GERAÇÃO DE ESTÍMULOS
    BEGIN
		
		ADD : ULA PORT MAP (A, B, SEL, RES, COUT, NULO, OVER, NEG,RES2,R1, R2, R3, R4);
	 
	 PROCESS
	
	 	 
    BEGIN

        -- SUBTRAÇÃO DE DOIS NÚMEROS POSITIVOS:
        WAIT FOR 2000000000 ns;
        A <= "0001";
        B <= "0011";
        SEL <= "000";
        
    
        -- SUBTRAÇÃO DE DOIS NÚMEROS NEGATIVOS:
        WAIT FOR 2000000000 ns;
        A <= "1111";
        B <= "1110";
        SEL <= "000";
        
    
        -- SUBTRAÇÃO COM CARRY OUT E OVERFLOW
        WAIT FOR 2000000000 ns;
        A <= "0111";
        B <= "1111";
        SEL <= "000";
        
    
        -- SUBTRAÇÃO POSITIVO E NEGATIVO
        WAIT FOR 2000000000 ns;
        A <= "1111";
        B <= "0001";
        SEL <= "000";
        
    
        -- SUBTRAÇÃO QUE VAI DAR ZERO
        WAIT FOR 2000000000 ns;
        A <= "0010";
        B <= "0010";
        SEL <= "000";
        
    
        -- SOMA DOIS POSITIVOS
        WAIT FOR 2000000000 ns;
        A <= "0010";
        B <= "0011";
        SEL <= "001";
        
    
        -- SOMA DOIS NEGATIVOS
        WAIT FOR 2000000000 ns;
        A <= "1111";
        B <= "1110";
        SEL <= "001";
        
    
        -- SOMA POSITIVO E NEGATIVO
        WAIT FOR 2000000000 ns;
        A <= "1010";
        B <= "0011";
        SEL <= "001";
        
        --POSITIVO OVERFLOW
        WAIT FOR 2000000000 ns;
        A <= "0110";
        B <= "0111";
        SEL <= "001";
        
        -- NEGATIVO OVERFLOW
        WAIT FOR 2000000000 ns;
        A <= "1000";
        B <= "1011";
        SEL <= "001";
        
        -- SOMA ZERO.
        WAIT FOR 2000000000 ns;
        A <= "0001";
        B <= "1111";
        SEL <= "001";
        
        -- INCREMENTO DE 1 DE A NÚMERO NEGATIVO
        WAIT FOR 2000000000 ns;
        A <= "1010";
        B <= "0011";
        SEL <= "010";
        
        --- INCREMENTO DE 1 DE A NÚMERO POSITIVO.
        WAIT FOR 2000000000 ns;
        A <= "0010";
        B <= "0011";
        SEL <= "010";
        
        -- INCREMENTO DE 1 DE A=7.
        WAIT FOR 2000000000 ns;
        A <= "0111";
        B <= "0011";
        SEL <= "010";
        
        -- COMPLEMENTO DE 2 POSITIVO
        WAIT FOR 2000000000 ns;
        A <= "0010";
        B <= "0011";
        SEL <= "011";
        
        -- COMPLEMENTO DE 2 NEGATIVO
        WAIT FOR 2000000000 ns;
        A <= "1110";
        B <= "1011";
        SEL <= "011";
        
        -- COMPLEMENTO DE 2 - 8
        WAIT FOR 2000000000 ns;
        A <= "1000";
        B <= "0011";
        SEL <= "011";
        
        -- A OR B 1
        WAIT FOR 2000000000 ns;
        A <= "0010";
        B <= "0011";
        SEL <= "100";
        
        -- A OR B 2
        WAIT FOR 2000000000 ns;
        A <= "1010";
        B <= "0101";
        SEL <= "100";
        
        -- NOT A 
        WAIT FOR 2000000000 ns;
        A <= "0110";
        B <= "0011";
        SEL <= "101";
        
        -- NOT A 2
        WAIT FOR 2000000000 ns;
        A <= "1111";
        B <= "0011";
        SEL <= "101";
        
        -- NOT B
        WAIT FOR 2000000000 ns;
        A <= "0110";
        B <= "0011";
        SEL <= "110";
        
        -- NOT B 2
        WAIT FOR 2000000000 ns;
        A <= "0110";
        B <= "1111";
        SEL <= "110";
        
        -- A AND B 1
        WAIT FOR 2000000000 ns;
        A <= "0110";
        B <= "1001";
        SEL <= "111";
        
        -- A ANB B 2
        WAIT FOR 2000000000 ns;
        A <= "1111";
        B <= "1001";
        SEL <= "111";
    
        WAIT FOR 10 ns;
        WAIT; 
    END PROCESS;
    END;
