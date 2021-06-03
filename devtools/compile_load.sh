nasm -f elf64 ../core/leya.asm -o leya.o
ld leya.o -o leya
./leya
