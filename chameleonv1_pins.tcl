# PIN IO locations
set_location_assignment PIN_111 -to red[0]
set_location_assignment PIN_110 -to red[1]
set_location_assignment PIN_106 -to red[2]
set_location_assignment PIN_105 -to red[3]
set_location_assignment PIN_104 -to red[4]
set_location_assignment PIN_103 -to grn[0]
set_location_assignment PIN_101 -to grn[1]
set_location_assignment PIN_100 -to grn[2]
set_location_assignment PIN_99 -to grn[3]
set_location_assignment PIN_98 -to grn[4]
set_location_assignment PIN_112 -to blu[0]
set_location_assignment PIN_133 -to blu[1]
set_location_assignment PIN_135 -to blu[2]
set_location_assignment PIN_136 -to blu[3]
set_location_assignment PIN_137 -to blu[4]
set_location_assignment PIN_44 -to sd_clk
set_location_assignment PIN_42 -to sd_addr[12]
set_location_assignment PIN_33 -to sd_addr[11]
set_location_assignment PIN_144 -to sd_addr[10]
set_location_assignment PIN_31 -to sd_addr[9]
set_location_assignment PIN_28 -to sd_addr[8]
set_location_assignment PIN_11 -to sd_addr[7]
set_location_assignment PIN_10 -to sd_addr[6]
set_location_assignment PIN_8 -to sd_addr[5]
set_location_assignment PIN_7 -to sd_addr[4]
set_location_assignment PIN_30 -to sd_addr[3]
set_location_assignment PIN_32 -to sd_addr[2]
set_location_assignment PIN_6 -to sd_addr[1]
set_location_assignment PIN_4 -to sd_addr[0]
set_location_assignment PIN_39 -to sd_ba_0
set_location_assignment PIN_143 -to sd_ba_1
set_location_assignment PIN_50 -to sd_we_n
set_location_assignment PIN_43 -to sd_ras_n
set_location_assignment PIN_46 -to sd_cas_n
set_location_assignment PIN_76 -to sd_data[15]
set_location_assignment PIN_77 -to sd_data[14]
set_location_assignment PIN_72 -to sd_data[13]
set_location_assignment PIN_69 -to sd_data[12]
set_location_assignment PIN_67 -to sd_data[11]
set_location_assignment PIN_65 -to sd_data[10]
set_location_assignment PIN_60 -to sd_data[9]
set_location_assignment PIN_58 -to sd_data[8]
set_location_assignment PIN_59 -to sd_data[7]
set_location_assignment PIN_64 -to sd_data[6]
set_location_assignment PIN_66 -to sd_data[5]
set_location_assignment PIN_68 -to sd_data[4]
set_location_assignment PIN_71 -to sd_data[3]
set_location_assignment PIN_79 -to sd_data[2]
set_location_assignment PIN_80 -to sd_data[1]
set_location_assignment PIN_83 -to sd_data[0]
set_location_assignment PIN_51 -to sd_ldqm
set_location_assignment PIN_49 -to sd_udqm
set_location_assignment PIN_25 -to clk8
set_location_assignment PIN_142 -to nHSync
set_location_assignment PIN_141 -to nVSync
set_location_assignment PIN_87 -to mux_clk
set_location_assignment PIN_119 -to mux[0]
set_location_assignment PIN_115 -to mux[1]
set_location_assignment PIN_114 -to mux[2]
set_location_assignment PIN_113 -to mux[3]
set_location_assignment PIN_125 -to mux_d[0]
set_location_assignment PIN_121 -to mux_d[1]
set_location_assignment PIN_120 -to mux_d[2]
set_location_assignment PIN_132 -to mux_d[3]
set_location_assignment PIN_126 -to mux_q[0]
set_location_assignment PIN_127 -to mux_q[1]
set_location_assignment PIN_128 -to mux_q[2]
set_location_assignment PIN_129 -to mux_q[3]
set_location_assignment PIN_86 -to sigmaL
set_location_assignment PIN_85 -to sigmaR
set_location_assignment PIN_89 -to dotclock_n
set_location_assignment PIN_88 -to phi2_n
set_location_assignment PIN_91 -to romlh_n
set_location_assignment PIN_90 -to ioef_n
set_location_assignment PIN_13 -to spi_miso
set_location_assignment PIN_22 -to mmc_cd_n
set_location_assignment PIN_24 -to mmc_wp
set_location_assignment PIN_52 -to usart_tx
set_location_assignment PIN_53 -to usart_clk
set_location_assignment PIN_54 -to usart_rts
set_location_assignment PIN_55 -to usart_cts
set_location_assignment PIN_23 -to freeze_n

# Pin IO Standard options

set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to mux_clk
set_instance_assignment -name FAST_INPUT_REGISTER ON -to mux_q[3]
set_instance_assignment -name FAST_INPUT_REGISTER ON -to mux_q[2]
set_instance_assignment -name FAST_INPUT_REGISTER ON -to mux_q[1]
set_instance_assignment -name FAST_INPUT_REGISTER ON -to mux_q[0]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to mux_clk
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to mux_d[3]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to mux_d[2]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to mux_d[1]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to mux_d[0]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to red[4]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to red[3]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to red[2]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to red[1]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to red[0]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to grn[0]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to blu[4]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to blu[3]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to blu[2]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to blu[1]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to blu[0]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to grn[4]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to grn[3]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to grn[2]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to grn[1]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to nHSync
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to nVSync
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_addr[12]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_addr[11]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_addr[10]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_addr[9]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_addr[8]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_addr[7]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_addr[6]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_addr[5]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_addr[4]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_addr[3]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_addr[2]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_addr[1]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_addr[0]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_ba_0
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_ba_1
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_cas_n
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_data[15]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_data[14]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_data[13]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_data[12]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_data[11]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_data[10]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_data[9]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_data[8]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_data[7]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_data[6]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_data[5]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_data[4]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_data[3]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_data[2]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_data[1]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_data[0]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_ldqm
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_ras_n
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_udqm
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_we_n
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to sd_clk
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_addr[12]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_addr[11]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_addr[10]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_addr[9]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_addr[8]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_addr[7]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_addr[6]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_addr[5]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_addr[4]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_addr[3]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_addr[2]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_addr[1]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_addr[0]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_ba_0
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_ba_1
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_cas_n
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_data[15]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_data[14]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_data[13]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_data[12]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_data[11]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_data[10]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_data[9]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_data[8]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_data[7]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_data[6]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_data[5]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_data[4]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_data[3]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_data[2]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_data[1]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_data[0]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_ldqm
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_ras_n
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_udqm
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_we_n
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to sd_clk
set_instance_assignment -name FAST_INPUT_REGISTER ON -to sd_data[15]
set_instance_assignment -name FAST_INPUT_REGISTER ON -to sd_data[14]
set_instance_assignment -name FAST_INPUT_REGISTER ON -to sd_data[13]
set_instance_assignment -name FAST_INPUT_REGISTER ON -to sd_data[12]
set_instance_assignment -name FAST_INPUT_REGISTER ON -to sd_data[11]
set_instance_assignment -name FAST_INPUT_REGISTER ON -to sd_data[10]
set_instance_assignment -name FAST_INPUT_REGISTER ON -to sd_data[9]
set_instance_assignment -name FAST_INPUT_REGISTER ON -to sd_data[8]
set_instance_assignment -name FAST_INPUT_REGISTER ON -to sd_data[7]
set_instance_assignment -name FAST_INPUT_REGISTER ON -to sd_data[6]
set_instance_assignment -name FAST_INPUT_REGISTER ON -to sd_data[5]
set_instance_assignment -name FAST_INPUT_REGISTER ON -to sd_data[4]
set_instance_assignment -name FAST_INPUT_REGISTER ON -to sd_data[3]
set_instance_assignment -name FAST_INPUT_REGISTER ON -to sd_data[2]
set_instance_assignment -name FAST_INPUT_REGISTER ON -to sd_data[1]
set_instance_assignment -name FAST_INPUT_REGISTER ON -to sd_data[0]

