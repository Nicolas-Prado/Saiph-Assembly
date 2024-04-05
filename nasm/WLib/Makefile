# Parameters used by the compiler and linker
NASMPARAMS = -f elf32
LDPARAMS = -m elf_i386
PROJECT_NAME = $(notdir $(CURDIR))

# List of objects to link for executable creation
objects = $(patsubst src/%.asm,build/%.o,$(wildcard src/*.asm))

# Compile code library
build: src/$(PROJECT_NAME).asm
	mkdir -p build
	nasm $(NASMPARAMS) -o build/$(PROJECT_NAME).o $<

# Clean the project
.PHONY: clean
clean:
	rm -f $(objects)

# Em makefiles, a syntax $(some_function operand1,operand2,...) 
# denota uma invocação de função dentro do Makefile. Aqui, por exemplo, temos:
# patsubst substitui um padrão por outro, o primeiro parametro pega o padrão a ser substituido, o segundo o que ira substituir, o terceiro a lista de strings a serem usadas como input
# nesse caso, a lista de input bem de um wildcard, que retorna todos os arquivos com o padrão consultado no operando dado, uma lista dos nomes deles em string

# The phony directive so fala que o clean executa sem estar associado com um file. Isso significa que, independente se existe ou nao um file com esse nome, o comando sera executado.