-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "11/22/2023 22:09:10"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          teste
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY teste_vhd_vec_tst IS
END teste_vhd_vec_tst;
ARCHITECTURE teste_arch OF teste_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL entrada : STD_LOGIC;
SIGNAL reset_signal : STD_LOGIC;
SIGNAL saida : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT teste
	PORT (
	clk : IN STD_LOGIC;
	entrada : IN STD_LOGIC;
	reset_signal : IN STD_LOGIC;
	saida : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : teste
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	entrada => entrada,
	reset_signal => reset_signal,
	saida => saida
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		clk <= '0';
		WAIT FOR 40000 ps;
		clk <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	clk <= '0';
WAIT;
END PROCESS t_prcs_clk;

-- entrada
t_prcs_entrada: PROCESS
BEGIN
	entrada <= '0';
WAIT;
END PROCESS t_prcs_entrada;

-- reset_signal
t_prcs_reset_signal: PROCESS
BEGIN
	reset_signal <= '1';
	WAIT FOR 150000 ps;
	reset_signal <= '0';
WAIT;
END PROCESS t_prcs_reset_signal;
END teste_arch;
