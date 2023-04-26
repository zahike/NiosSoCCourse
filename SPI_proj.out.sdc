## Generated SDC file "SPI_proj.out.sdc"

## Copyright (C) 2018  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"

## DATE    "Wed Apr 26 09:52:58 2023"

##
## DEVICE  "EP4CE22F17C6"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {altera_reserved_tck} -period 100.000 -waveform { 0.000 50.000 } [get_ports {altera_reserved_tck}]
create_clock -name {CLOCK_50} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK_50}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {CLOCK_50}]  0.000 [get_ports {GPIO_0[2]}]
set_input_delay -add_delay  -clock [get_clocks {CLOCK_50}]  0.000 [get_ports {GPIO_1[0]}]
set_input_delay -add_delay  -clock [get_clocks {CLOCK_50}]  0.000 [get_ports {GPIO_1[1]}]
set_input_delay -add_delay  -clock [get_clocks {CLOCK_50}]  0.000 [get_ports {GPIO_1[3]}]
set_input_delay -add_delay  -clock [get_clocks {CLOCK_50}]  0.000 [get_ports {KEY[0]}]
set_input_delay -add_delay  -clock [get_clocks {altera_reserved_tck}]  0.000 [get_ports {altera_reserved_tdi}]
set_input_delay -add_delay  -clock [get_clocks {altera_reserved_tck}]  0.000 [get_ports {altera_reserved_tms}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  0.000 [get_ports {GPIO_0[0]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  0.000 [get_ports {GPIO_0[1]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  0.000 [get_ports {GPIO_0[3]}]
set_output_delay -add_delay  -clock [get_clocks {CLOCK_50}]  0.000 [get_ports {GPIO_1[2]}]
set_output_delay -add_delay  -clock [get_clocks {altera_reserved_tck}]  0.000 [get_ports {altera_reserved_tdo}]


#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 


#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from [get_registers {*|alt_jtag_atlantic:*|jupdate}] -to [get_registers {*|alt_jtag_atlantic:*|jupdate1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|rdata[*]}] -to [get_registers {*|alt_jtag_atlantic*|td_shift[*]}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|read}] -to [get_registers {*|alt_jtag_atlantic:*|read1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|read_req}] 
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|rvalid}] -to [get_registers {*|alt_jtag_atlantic*|td_shift[*]}]
set_false_path -from [get_registers {*|t_dav}] -to [get_registers {*|alt_jtag_atlantic:*|tck_t_dav}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|user_saw_rvalid}] -to [get_registers {*|alt_jtag_atlantic:*|rvalid0*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|wdata[*]}] -to [get_registers *]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write}] -to [get_registers {*|alt_jtag_atlantic:*|write1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_stalled}] -to [get_registers {*|alt_jtag_atlantic:*|t_ena*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_stalled}] -to [get_registers {*|alt_jtag_atlantic:*|t_pause*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_valid}] 
set_false_path -to [get_keepers {*altera_std_synchronizer:*|din_s1}]
set_false_path -to [get_pins -nocase -compatibility_mode {*|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain*|clrn}]
set_false_path -from [get_keepers {*NiosSoC_nios2_gen2_0_cpu:*|NiosSoC_nios2_gen2_0_cpu_nios2_oci:the_NiosSoC_nios2_gen2_0_cpu_nios2_oci|NiosSoC_nios2_gen2_0_cpu_nios2_oci_break:the_NiosSoC_nios2_gen2_0_cpu_nios2_oci_break|break_readreg*}] -to [get_keepers {*NiosSoC_nios2_gen2_0_cpu:*|NiosSoC_nios2_gen2_0_cpu_nios2_oci:the_NiosSoC_nios2_gen2_0_cpu_nios2_oci|NiosSoC_nios2_gen2_0_cpu_debug_slave_wrapper:the_NiosSoC_nios2_gen2_0_cpu_debug_slave_wrapper|NiosSoC_nios2_gen2_0_cpu_debug_slave_tck:the_NiosSoC_nios2_gen2_0_cpu_debug_slave_tck|*sr*}]
set_false_path -from [get_keepers {*NiosSoC_nios2_gen2_0_cpu:*|NiosSoC_nios2_gen2_0_cpu_nios2_oci:the_NiosSoC_nios2_gen2_0_cpu_nios2_oci|NiosSoC_nios2_gen2_0_cpu_nios2_oci_debug:the_NiosSoC_nios2_gen2_0_cpu_nios2_oci_debug|*resetlatch}] -to [get_keepers {*NiosSoC_nios2_gen2_0_cpu:*|NiosSoC_nios2_gen2_0_cpu_nios2_oci:the_NiosSoC_nios2_gen2_0_cpu_nios2_oci|NiosSoC_nios2_gen2_0_cpu_debug_slave_wrapper:the_NiosSoC_nios2_gen2_0_cpu_debug_slave_wrapper|NiosSoC_nios2_gen2_0_cpu_debug_slave_tck:the_NiosSoC_nios2_gen2_0_cpu_debug_slave_tck|*sr[33]}]
set_false_path -from [get_keepers {*NiosSoC_nios2_gen2_0_cpu:*|NiosSoC_nios2_gen2_0_cpu_nios2_oci:the_NiosSoC_nios2_gen2_0_cpu_nios2_oci|NiosSoC_nios2_gen2_0_cpu_nios2_oci_debug:the_NiosSoC_nios2_gen2_0_cpu_nios2_oci_debug|monitor_ready}] -to [get_keepers {*NiosSoC_nios2_gen2_0_cpu:*|NiosSoC_nios2_gen2_0_cpu_nios2_oci:the_NiosSoC_nios2_gen2_0_cpu_nios2_oci|NiosSoC_nios2_gen2_0_cpu_debug_slave_wrapper:the_NiosSoC_nios2_gen2_0_cpu_debug_slave_wrapper|NiosSoC_nios2_gen2_0_cpu_debug_slave_tck:the_NiosSoC_nios2_gen2_0_cpu_debug_slave_tck|*sr[0]}]
set_false_path -from [get_keepers {*NiosSoC_nios2_gen2_0_cpu:*|NiosSoC_nios2_gen2_0_cpu_nios2_oci:the_NiosSoC_nios2_gen2_0_cpu_nios2_oci|NiosSoC_nios2_gen2_0_cpu_nios2_oci_debug:the_NiosSoC_nios2_gen2_0_cpu_nios2_oci_debug|monitor_error}] -to [get_keepers {*NiosSoC_nios2_gen2_0_cpu:*|NiosSoC_nios2_gen2_0_cpu_nios2_oci:the_NiosSoC_nios2_gen2_0_cpu_nios2_oci|NiosSoC_nios2_gen2_0_cpu_debug_slave_wrapper:the_NiosSoC_nios2_gen2_0_cpu_debug_slave_wrapper|NiosSoC_nios2_gen2_0_cpu_debug_slave_tck:the_NiosSoC_nios2_gen2_0_cpu_debug_slave_tck|*sr[34]}]
set_false_path -from [get_keepers {*NiosSoC_nios2_gen2_0_cpu:*|NiosSoC_nios2_gen2_0_cpu_nios2_oci:the_NiosSoC_nios2_gen2_0_cpu_nios2_oci|NiosSoC_nios2_gen2_0_cpu_nios2_ocimem:the_NiosSoC_nios2_gen2_0_cpu_nios2_ocimem|*MonDReg*}] -to [get_keepers {*NiosSoC_nios2_gen2_0_cpu:*|NiosSoC_nios2_gen2_0_cpu_nios2_oci:the_NiosSoC_nios2_gen2_0_cpu_nios2_oci|NiosSoC_nios2_gen2_0_cpu_debug_slave_wrapper:the_NiosSoC_nios2_gen2_0_cpu_debug_slave_wrapper|NiosSoC_nios2_gen2_0_cpu_debug_slave_tck:the_NiosSoC_nios2_gen2_0_cpu_debug_slave_tck|*sr*}]
set_false_path -from [get_keepers {*NiosSoC_nios2_gen2_0_cpu:*|NiosSoC_nios2_gen2_0_cpu_nios2_oci:the_NiosSoC_nios2_gen2_0_cpu_nios2_oci|NiosSoC_nios2_gen2_0_cpu_debug_slave_wrapper:the_NiosSoC_nios2_gen2_0_cpu_debug_slave_wrapper|NiosSoC_nios2_gen2_0_cpu_debug_slave_tck:the_NiosSoC_nios2_gen2_0_cpu_debug_slave_tck|*sr*}] -to [get_keepers {*NiosSoC_nios2_gen2_0_cpu:*|NiosSoC_nios2_gen2_0_cpu_nios2_oci:the_NiosSoC_nios2_gen2_0_cpu_nios2_oci|NiosSoC_nios2_gen2_0_cpu_debug_slave_wrapper:the_NiosSoC_nios2_gen2_0_cpu_debug_slave_wrapper|NiosSoC_nios2_gen2_0_cpu_debug_slave_sysclk:the_NiosSoC_nios2_gen2_0_cpu_debug_slave_sysclk|*jdo*}]
set_false_path -from [get_keepers {sld_hub:*|irf_reg*}] -to [get_keepers {*NiosSoC_nios2_gen2_0_cpu:*|NiosSoC_nios2_gen2_0_cpu_nios2_oci:the_NiosSoC_nios2_gen2_0_cpu_nios2_oci|NiosSoC_nios2_gen2_0_cpu_debug_slave_wrapper:the_NiosSoC_nios2_gen2_0_cpu_debug_slave_wrapper|NiosSoC_nios2_gen2_0_cpu_debug_slave_sysclk:the_NiosSoC_nios2_gen2_0_cpu_debug_slave_sysclk|ir*}]
set_false_path -from [get_keepers {sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1]}] -to [get_keepers {*NiosSoC_nios2_gen2_0_cpu:*|NiosSoC_nios2_gen2_0_cpu_nios2_oci:the_NiosSoC_nios2_gen2_0_cpu_nios2_oci|NiosSoC_nios2_gen2_0_cpu_nios2_oci_debug:the_NiosSoC_nios2_gen2_0_cpu_nios2_oci_debug|monitor_go}]


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

