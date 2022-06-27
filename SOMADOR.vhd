-------------- DATA: 22/06/2022                        --------------
-------------- AUTOR: LUCAS TAVARES DA SILVA FERREIRA  --------------
-------------- DRE: 120152739                          --------------
-------------- TÍTULO: TRABALHO 1 DE LABORATÓRIO       --------------
-------------- DISCIPLINA: SISTEMAS DIGITAIS           --------------
-------------- PROFESSOR: ROBERTO PACHECO              --------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-- SOMADOR SIMPLES DE 1 BIT PARA USARMOS NO SOMADOR DE 4 BITS

ENTITY SOMADOR IS 
	PORT( A,B,CARRY_IN : IN STD_LOGIC;      -- RECEBE A, B E CARRY IN
			CARRY_OUT, SOMA : OUT STD_LOGIC -- DEVOLVE COUT E O RESULTADO
			);
END SOMADOR;

ARCHITECTURE DADOS OF SOMADOR IS
	SIGNAL X1, X2, X3, X4, Y1 : STD_LOGIC; -- VARIÁVEIS INTERMEDIARIAS
	
	BEGIN
		X1 <= A AND B; 
		X2 <= A AND CARRY_IN;  
		X3 <= B AND CARRY_IN; 
		X4 <= X1 OR X2; 
		CARRY_OUT <= X3 OR X4;  
		Y1 <= A XOR B;
		SOMA <= Y1 XOR CARRY_IN;
END DADOS;
