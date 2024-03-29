library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.chameleon_c64keys_pkg.all;

-------------------------------------------------------------------------

entity chameleon_mergeinputs is
	generic (
		joybits : integer :=8;
		button1 : integer :=4;
		button2 : integer :=5;
		button3 : integer :=6;
		button4 : integer :=7;
		button5 : integer :=6;
		button6 : integer :=7;
		c64key_start1 : integer := c64key_return;
		c64key_select1 : integer := c64key_equals;
		c64key_start2 : integer := c64key_control;
		c64key_select2 : integer := c64key_stop
	);
	port (
		clk : in std_logic; -- 100 MHz input clock
		reset_n : in std_logic;
		ena_1mhz : in std_logic;
		ir_data : in std_logic;
		
		button_menu_n : in std_logic;
		button_freeze_n : in std_logic;
		button_reset_n : in std_logic;
		
		c64_joy1 : in unsigned(6 downto 0);
		c64_joy2 : in unsigned(6 downto 0);
		c64_joy3 : in unsigned(6 downto 0);
		c64_joy4 : in unsigned(6 downto 0);
		c64_keys : in unsigned(63 downto 0);
		c64_joykey_ena : in std_logic;
		
		c64_restore_in : in std_logic := '1'; -- C64 restore key tends to be a very narrow momentary pulse
		c64_restore_out : out std_logic; -- So we convert it to something wider and more likely to be noticed...

		keypad : out std_logic_vector(11 downto 0);
		
		joy1_out : out unsigned(joybits-1 downto 0);
		joy2_out : out unsigned(joybits-1 downto 0);
		joy3_out : out unsigned(joybits-1 downto 0);
		joy4_out : out unsigned(joybits-1 downto 0);
		menu_out_n : out std_logic;
		freeze_out_n : out std_logic;
		
		coin_start : out std_logic_vector(7 downto 0);
		
		usart_cts : in std_logic;
		usart_rxd : in std_logic;
		usart_txd : out std_logic;
		usart_clk : in std_logic
	);
end entity;

architecture rtl of chameleon_mergeinputs is
	constant joybits_internal : integer := 10;
	signal ena_1khz : std_logic;
	signal merged_menu : std_logic;
	signal keypad_i : std_logic_vector(11 downto 0);

begin

	keypad <= keypad_i;

	my1Khz : entity work.chameleon_1khz
	port map (
		clk => clk,
		ena_1mhz => ena_1mhz,
		ena_1khz => ena_1khz
	);

	inputs : block
		-- CDTV pad signals:
		signal ir : std_logic;
		signal ir_d : std_logic;
		signal cdtv_port : std_logic;
		signal cdtv_joya : unsigned(5 downto 0);
		signal cdtv_joyb : unsigned(5 downto 0);
		signal cdtv_power : std_logic;
		signal cdtv_play : std_logic;
		signal cdtv_volup : std_logic;
		signal cdtv_voldown : std_logic;
		signal cdtv_ffwd : std_logic;
		signal cdtv_coin_start : std_logic_vector(7 downto 0);

		-- c64 keyboard-related signals
		signal keys_safe : std_logic;
		signal c64_menu : std_logic :='1';
		signal c64_a1 : std_logic :='1';
		signal c64_b1 : std_logic :='1';
		signal c64_c1 : std_logic :='1';
		signal c64_d1 : std_logic :='1';
		signal c64_start1 : std_logic :='1';
		signal c64_select1 :std_logic :='1';
		signal c64_a2 : std_logic :='1';
		signal c64_b2 : std_logic :='1';
		signal c64_c2 : std_logic :='1';
		signal c64_d2 : std_logic :='1';
		signal c64_start2 : std_logic :='1';
		signal c64_select2 : std_logic :='1';
		signal c64_left1 : std_logic :='1';
		signal c64_right1 : std_logic :='1';
		signal c64_up1 : std_logic :='1';
		signal c64_down1 : std_logic :='1';
		signal c64_left2 : std_logic :='1';
		signal c64_right2 : std_logic :='1';
		signal c64_up2 : std_logic :='1';
		signal c64_down2 : std_logic :='1';
		signal c64_emu1 : unsigned(5 downto 0);
		signal c64_emu2 : unsigned(5 downto 0);

		signal c64_coin_start : std_logic_vector(7 downto 0);

		-- Merged signals for joypad buttons 
		signal porta_a : std_logic;
		signal porta_b : std_logic;
		signal porta_c : std_logic;
		signal porta_d : std_logic;
		signal porta_start : std_logic;
		signal porta_select : std_logic;
		signal portb_a : std_logic;
		signal portb_b : std_logic;
		signal portb_c : std_logic;
		signal portb_d : std_logic;
		signal portb_start : std_logic;
		signal portb_select : std_logic;

		signal joy1 : unsigned(joybits_internal-1 downto 0);
		signal joy2 : unsigned(joybits_internal-1 downto 0);
		signal joy3 : unsigned(joybits_internal-1 downto 0);
		signal joy4 : unsigned(joybits_internal-1 downto 0);

	begin
		-- Synchronise IR signal
		process (clk)
		begin
			if rising_edge(clk) then
				ir_d<=ir_data;
				ir<=ir_d;
			end if;
		end process;


		cdtv : entity work.chameleon_cdtv_remote
		port map(
			clk => clk,
			ena_1mhz => ena_1mhz,
			ir => ir,
			key_power => cdtv_power,
			key_play => cdtv_play,
			joystick_a => cdtv_joya,
			joystick_b => cdtv_joyb,
			key_vol_up => cdtv_volup,
			key_vol_dn => cdtv_voldown,
			key_ff => cdtv_ffwd,
			currentport => cdtv_port,
			key_0 => keypad_i(0),
			key_1 => keypad_i(1),
			key_2 => keypad_i(2),
			key_3 => keypad_i(3),
			key_4 => keypad_i(4),
			key_5 => keypad_i(5),
			key_6 => keypad_i(6),
			key_7 => keypad_i(7),
			key_8 => keypad_i(8),
			key_9 => keypad_i(9),
			key_enter => keypad_i(10),
			key_escape => keypad_i(11)		
		);


		keys_safe <= '1' when c64_joy1="1111111" else '0';

		-- Update c64 keys only when the joystick isn't active.
		process (clk,reset_n)
		begin
			if reset_n='0' then
				c64_start1<='1';
				c64_select1<='1';
				c64_start2<='1';
				c64_select2<='1';
				c64_menu<='1';
			elsif rising_edge(clk) then
				if keys_safe='1' then

					-- Game port 1 emulation

					-- right shift+cursorupdown or i;
					c64_up1 <= not c64_joykey_ena or ((c64_keys(c64key_cursorupdown) or c64_keys(c64key_rightshift)) and c64_keys(c64key_i));
					-- cursorupdown without right shift, or k;
					c64_down1 <= not c64_joykey_ena or ((c64_keys(c64key_cursorupdown) or not c64_keys(c64key_rightshift)) and c64_keys(c64key_k));
					-- right shift+cursorleftright or j;
					c64_left1 <= not c64_joykey_ena or ((c64_keys(c64key_cursorleftright) or c64_keys(c64key_rightshift)) and c64_keys(c64key_j));
					-- cursorleftright without right shift, or l;
					c64_right1 <= not c64_joykey_ena or ((c64_keys(c64key_cursorleftright) or not c64_keys(c64key_rightshift)) and c64_keys(c64key_l));

					c64_a1 <= not c64_joykey_ena or (c64_keys(c64key_n) and c64_keys(c64key_period));
					c64_b1 <= not c64_joykey_ena or (c64_keys(c64key_b) and c64_keys(c64key_slash));
					c64_c1 <= not c64_joykey_ena or c64_keys(c64key_comma);
					c64_d1 <= not c64_joykey_ena or c64_keys(c64key_m);
					c64_start1 <= not c64_joykey_ena or c64_keys(c64key_start1);
					c64_select1 <= not c64_joykey_ena or c64_keys(c64key_select1);					

					-- Game port 2 emulation
					c64_up2 <= not c64_joykey_ena or c64_keys(c64key_w);
					c64_down2 <= not c64_joykey_ena or c64_keys(c64key_s);
					c64_left2 <= not c64_joykey_ena or c64_keys(c64key_a);
					c64_right2 <= not c64_joykey_ena or c64_keys(c64key_d);

					c64_a2 <= not c64_joykey_ena or (c64_keys(c64key_leftshift) and c64_keys(c64key_c));
					c64_b2 <= not c64_joykey_ena or (c64_keys(c64key_commodore) and c64_keys(c64key_v));
					c64_c2 <= not c64_joykey_ena or c64_keys(c64key_z);
					c64_d2 <= not c64_joykey_ena or c64_keys(c64key_x);
					c64_start2 <= not c64_joykey_ena or c64_keys(c64key_start2);
					c64_select2 <= not c64_joykey_ena or c64_keys(c64key_select2);

					c64_menu <= not c64_joykey_ena or c64_keys(c64key_leftarrow); -- Left arrow;
					
					c64_coin_start(0) <= not c64_joykey_ena or c64_keys(c64key_1);
					c64_coin_start(1) <= not c64_joykey_ena or c64_keys(c64key_2);
					c64_coin_start(2) <= not c64_joykey_ena or c64_keys(c64key_3);
					c64_coin_start(3) <= not c64_joykey_ena or c64_keys(c64key_4);
					c64_coin_start(4) <= not c64_joykey_ena or c64_keys(c64key_5);
					c64_coin_start(5) <= not c64_joykey_ena or c64_keys(c64key_6);
					c64_coin_start(6) <= not c64_joykey_ena or c64_keys(c64key_7);
					c64_coin_start(7) <= not c64_joykey_ena or c64_keys(c64key_8);

				end if;
			end if;
		end process;

		cdtv_coin_start <= not keypad_i(8 downto 1);
		
		coin_start <= c64_coin_start and cdtv_coin_start;
		
		c64_emu1 <= c64_b1 & c64_a1 & c64_right1 & c64_left1 & c64_down1 & c64_up1;
		c64_emu2 <= c64_b2 & c64_a2 & c64_right2 & c64_left2 & c64_down2 & c64_up2;

		merged_menu <= c64_menu and (not cdtv_power);

		-- 3rd and 4th buttons, active low
		porta_a <= cdtv_joya(4) and c64_joy1(4) and c64_a1;
		porta_b <= cdtv_joya(5) and c64_joy1(5) and c64_b1;
		porta_c <= (cdtv_port or not cdtv_voldown) and c64_c1;
		porta_d <= (cdtv_port or not cdtv_ffwd) and c64_d1;
		porta_start <= (cdtv_port or not cdtv_play) and c64_start1;
		porta_select <= ((cdtv_port or not cdtv_volup) and c64_select1) and c64_joy1(6);

		portb_a <= cdtv_joyb(4) and c64_joy2(4) and c64_a2;
		portb_b <= cdtv_joyb(5) and c64_joy2(5) and c64_b2;
		portb_c <= (not cdtv_port or not cdtv_voldown) and c64_c2;
		portb_d <= (not cdtv_port or not cdtv_ffwd) and c64_b2;
		portb_start <= (not cdtv_port or not cdtv_play) and c64_start2;
		portb_select <= ((not cdtv_port or not cdtv_volup) and c64_select2) and c64_joy2(6);

		-- Output mapping
		process(c64_emu1,c64_emu2,c64_joy1,c64_joy2,c64_joy3,c64_joy4,cdtv_joya,cdtv_joyb,
					porta_select,portb_select,porta_start,portb_start,porta_a,porta_b,portb_a,portb_b)
		begin
			joy1<=(others=>'1');
			joy2<=(others=>'1');
			joy3<=(others=>'1');
			joy4<=(others=>'1');

			joy1(3 downto 0)<=c64_joy1(3 downto 0) and cdtv_joya(3 downto 0) and c64_emu1(3 downto 0);
			joy2(3 downto 0)<=c64_joy2(3 downto 0) and cdtv_joyb(3 downto 0) and c64_emu2(3 downto 0);
			joy3(3 downto 0)<=c64_joy3(3 downto 0);
			joy4(3 downto 0)<=c64_joy4(3 downto 0);

			-- First button
			joy1(button1)<=porta_a and c64_joy1(4);
			joy2(button1)<=portb_a and c64_joy2(4);
			joy3(button1)<=c64_joy3(4);
			joy4(button1)<=c64_joy4(4);

			-- Second button
			joy1(button2)<=porta_b and c64_joy1(5);
			joy2(button2)<=portb_b and c64_joy2(5);
			joy3(button2)<=c64_joy3(5);
			joy4(button2)<=c64_joy4(5);

			-- Third button
			joy1(button3)<=porta_select and c64_joy1(6);
			joy2(button3)<=portb_select and c64_joy2(6);
			joy3(button3)<=c64_joy3(6);
			joy4(button3)<=c64_joy4(6);

			-- Fourth button
			joy1(button4)<=porta_start;
			joy2(button4)<=portb_start;
			joy3(button4)<='1';
			joy4(button4)<='1';

			-- Fifth button
			joy1(button5)<=porta_c;
			joy2(button5)<=portb_c;
			joy3(button5)<='1';
			joy4(button5)<='1';

			-- Sixth button
			joy1(button6)<=porta_d;
			joy2(button6)<=portb_d;
			joy3(button6)<='1';
			joy4(button6)<='1';

		end process;

		joy1_out <= joy1(joybits-1 downto 0);
		joy2_out <= joy2(joybits-1 downto 0);
		joy3_out <= joy3(joybits-1 downto 0);
		joy4_out <= joy4(joybits-1 downto 0);

	end block;


	cartbuttons : block
		signal debounce_ctr : unsigned(5 downto 0);
		signal debouncer1 : std_logic_vector(3 downto 0);
		signal debouncer2 : std_logic_vector(3 downto 0);
		signal debouncer3 : std_logic_vector(3 downto 0);

		signal db_menu_n : std_logic := '1';
		signal db_freeze_n : std_logic := '1';
		signal db_reset_n : std_logic := '1';
	
		-- Reconfiguration - triggered by pressing middle and right buttons simultaneously
		signal reconfig_trigger : std_logic := '0';	
	begin
		-- Debounce buttons, and assert reconfig_trigger if reset and freeze are pressed together.
		-- Doesn't have a reset, since the reset button is being debounced!
		process(clk)
		begin
			if rising_edge(clk) then
				reconfig_trigger<='0';
				if ena_1khz='1' then
					debouncer1<=debouncer1(2 downto 0) & button_menu_n;
					debouncer2<=debouncer2(2 downto 0) & button_freeze_n;
					debouncer3<=debouncer3(2 downto 0) & button_reset_n;
					if (debouncer1(3) xor debouncer1(2))='1'
							or (debouncer2(3) xor debouncer2(2))='1'
							or (debouncer3(3) xor debouncer3(2))='1' then
						debounce_ctr<=(others=>'0');
					elsif debounce_ctr(debounce_ctr'high)='1' then
						db_menu_n<=debouncer1(3);
						db_freeze_n<=debouncer2(3);
						db_reset_n<=debouncer3(3);
						
						if db_freeze_n='0' and db_reset_n='0' then
							reconfig_trigger<='1';
						end if;
					else
						debounce_ctr<=debounce_ctr+1;
					end if;
				end if;
			end if;
		end process;

		menu_out_n<=db_menu_n and merged_menu;
		freeze_out_n<=db_freeze_n;

		usbmcu : entity work.chameleon_reconfig
		port map (
			clk => clk,

			reconfig => reconfig_trigger,
			reconfig_slot => X"0",

			serial_clk => usart_clk,
			serial_rxd => usart_rxd,
			serial_txd => usart_txd,
			serial_cts_n => usart_cts
		);

	end block;
	
	-- Restore key: widen the pulse to make it more likely to be picked up by the guest core...

	restorekey : block
		signal restore_key_ctr : unsigned(8 downto 0);			
	begin
		process(clk)
		begin
			if rising_edge(clk) then
				if ena_1khz='1' and restore_key_ctr(8)='0' then
					restore_key_ctr<=restore_key_ctr+1;
				else
					restore_key_ctr(8)<=restore_key_ctr(8) and c64_restore_in;
				end if;
			end if;
		end process;		
		c64_restore_out <= restore_key_ctr(8);
	end block;
	
end architecture;
