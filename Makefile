TESTBENCH_NAME = testbench
STOP_TIME = 30fs

all: compile_vhd create_testbench_executable run_simulation open_gtkwave

compile_vhd: *.vhd
	ghdl -a *.vhd
create_testbench_executable: $(TESTBENCH_NAME).o
	ghdl -e $(TESTBENCH_NAME)
run_simulation: $(TESTBENCH_NAME).exe
	ghdl -r $(TESTBENCH_NAME) --stop-time=$(STOP_TIME) --vcd=sim.vcd
open_gtkwave: sim.vcd
	gtkwave sim.vcd

clean: *.o *.exe *.cf *.vcd
	rm *.o *.exe *.cf *.vcd