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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"

-- DATE "11/22/2023 22:09:13"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	teste IS
    PORT (
	clk : IN std_logic;
	reset_signal : IN std_logic;
	entrada : IN std_logic;
	saida : OUT std_logic_vector(1 DOWNTO 0)
	);
END teste;

ARCHITECTURE structure OF teste IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset_signal : std_logic;
SIGNAL ww_entrada : std_logic;
SIGNAL ww_saida : std_logic_vector(1 DOWNTO 0);
SIGNAL \entrada~input_o\ : std_logic;
SIGNAL \saida[0]~output_o\ : std_logic;
SIGNAL \saida[1]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \reset_signal~input_o\ : std_logic;
SIGNAL \estado_atual.C~q\ : std_logic;
SIGNAL \estado_atual.D~q\ : std_logic;
SIGNAL \estado_atual.ResetState~q\ : std_logic;
SIGNAL \proximo_estado.A~combout\ : std_logic;
SIGNAL \estado_atual.A~q\ : std_logic;
SIGNAL \estado_atual.B~q\ : std_logic;
SIGNAL \saida~3_combout\ : std_logic;
SIGNAL \saida~4_combout\ : std_logic;
SIGNAL \ALT_INV_estado_atual.B~q\ : std_logic;
SIGNAL \ALT_INV_estado_atual.D~q\ : std_logic;
SIGNAL \ALT_INV_estado_atual.C~q\ : std_logic;
SIGNAL \ALT_INV_estado_atual.ResetState~q\ : std_logic;
SIGNAL \ALT_INV_reset_signal~input_o\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset_signal <= reset_signal;
ww_entrada <= entrada;
saida <= ww_saida;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_estado_atual.B~q\ <= NOT \estado_atual.B~q\;
\ALT_INV_estado_atual.D~q\ <= NOT \estado_atual.D~q\;
\ALT_INV_estado_atual.C~q\ <= NOT \estado_atual.C~q\;
\ALT_INV_estado_atual.ResetState~q\ <= NOT \estado_atual.ResetState~q\;
\ALT_INV_reset_signal~input_o\ <= NOT \reset_signal~input_o\;

\saida[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \saida~3_combout\,
	devoe => ww_devoe,
	o => \saida[0]~output_o\);

\saida[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \saida~4_combout\,
	devoe => ww_devoe,
	o => \saida[1]~output_o\);

\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\reset_signal~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset_signal,
	o => \reset_signal~input_o\);

\estado_atual.C\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \estado_atual.B~q\,
	clrn => \ALT_INV_reset_signal~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_atual.C~q\);

\estado_atual.D\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \estado_atual.C~q\,
	clrn => \ALT_INV_reset_signal~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_atual.D~q\);

\estado_atual.ResetState\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => VCC,
	clrn => \ALT_INV_reset_signal~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_atual.ResetState~q\);

\proximo_estado.A\ : cyclonev_lcell_comb
-- Equation(s):
-- \proximo_estado.A~combout\ = (!\estado_atual.ResetState~q\) # (\estado_atual.D~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101110111011101110111011101110111011101110111011101110111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_estado_atual.D~q\,
	datab => \ALT_INV_estado_atual.ResetState~q\,
	combout => \proximo_estado.A~combout\);

\estado_atual.A\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \proximo_estado.A~combout\,
	clrn => \ALT_INV_reset_signal~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_atual.A~q\);

\estado_atual.B\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \estado_atual.A~q\,
	clrn => \ALT_INV_reset_signal~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \estado_atual.B~q\);

\saida~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \saida~3_combout\ = (\estado_atual.D~q\) # (\estado_atual.B~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011101110111011101110111011101110111011101110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_estado_atual.B~q\,
	datab => \ALT_INV_estado_atual.D~q\,
	combout => \saida~3_combout\);

\saida~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \saida~4_combout\ = (\estado_atual.C~q\) # (\estado_atual.D~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011101110111011101110111011101110111011101110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_estado_atual.D~q\,
	datab => \ALT_INV_estado_atual.C~q\,
	combout => \saida~4_combout\);

\entrada~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_entrada,
	o => \entrada~input_o\);

ww_saida(0) <= \saida[0]~output_o\;

ww_saida(1) <= \saida[1]~output_o\;
END structure;


