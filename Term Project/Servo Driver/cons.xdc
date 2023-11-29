set_property PACKAGE_PIN J1 [get_ports {out1}]
set_property IOSTANDARD LVCMOS33 [get_ports {out1}]

set_property PACKAGE_PIN V17 [get_ports {angle[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {angle[0]}]
set_property PACKAGE_PIN V16 [get_ports {angle[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {angle[1]}]
set_property PACKAGE_PIN W16 [get_ports {angle[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {angle[2]}]
set_property PACKAGE_PIN W17 [get_ports {angle[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {angle[3]}]
set_property PACKAGE_PIN W15 [get_ports {angle[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {angle[4]}]
set_property PACKAGE_PIN V15 [get_ports {angle[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {angle[5]}]
set_property PACKAGE_PIN W14 [get_ports {angle[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {angle[6]}]
set_property PACKAGE_PIN W13 [get_ports {angle[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {angle[7]}]

set_property PACKAGE_PIN W19 [get_ports start]
set_property IOSTANDARD LVCMOS33 [get_ports start]



set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports