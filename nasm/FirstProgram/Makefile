# Parameters used by the compiler and linker
NASMPARAMS = -iinclude/ -f elf32
LDPARAMS = -m elf_i386
PROJECT_NAME = $(notdir $(CURDIR))

# List of objects to link for executable creation
objects = $(patsubst src/%.asm,build/%.o,$(wildcard src/*.asm))

# Compile code
build/%.o: src/%.asm
	mkdir -p build
	nasm $(NASMPARAMS) -o $@ $<

# Link objects
bin/%.exe: $(objects)
	mkdir -p bin
	ld $(LDPARAMS) -o $@ $(objects)

# Run the program
run: bin/$(PROJECT_NAME).exe
	$<

# Clean the project
.PHONY: clean
clean:
	rm -f $(objects) bin/$(PROJECT_NAME).exe