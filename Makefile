# Makefile automatically generated by ghdl
# Version: GHDL 0.36 (tarball) [Dunoon edition] - llvm code generator
# Command used to generate this makefile:
# ghdl --gen-makefile --workdir=simu edice_test

WORKDIR=simu
GHDL=ghdl
GHDLFLAGS= --ieee=synopsys --warn-no-vital-generic --workdir=$(WORKDIR) --work=work

TARGET_SIM= alu_new_tb 
# Default target
all: 
	mkdir -p $(WORKDIR)
	$(GHDL) -i $(GHDLFLAGS) `find . -name "*.vhd"`
	$(GHDL) -m $(GHDLFLAGS) $(TARGET_SIM) 

# Run target
run: $(TARGET_SIM)
	$(GHDL) -r $(TARGET_SIM) $(GHDLRUNFLAGS) --stop-time=1000ns --vcd=out.vcd
	open out.vcd

clean:
	rm -f $(WORKDIR)/*
