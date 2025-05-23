
## AUTHORING:
Jordan Maglalang

## Affiliation: UMBC Class of 2027 CMSC 313

## Date: 5/15/25
# HW11: Translate bytes to ASCII Hex

## Description
This program reads a list of bytes and converts each byte into its ASCII hexadecimal representation, displaying all the bytes with each byte being 2 ASCII characters.


## What the program produces

### Input:
An input buffer of:

inputBuf: 
  db  0x83,0x6A,0x88,0xDE,0x9A,0xC3,0x54,0x9A 
### Output:
83 6A 88 DE 9a c3 54 9A


## How to Compile and Execute
-Must be in 32-bit Linux environment (or 64-bit Linux with 32-bit support)

-SSH into a linux server (gl.umbc.edu) or use Docker or linux VM

-Install NASM (The Netwide Assembler)

-Use 'ld' or 'gcc' as a linker to create final executable
nasm -f elf32 hw11translate2Ascii.asm -o hw11translate2ascii.o
 
## On Linux (local or on SSH to gl.umbc.edu)

# Assemble 32-bit object file
 ```bash
  nasm -f elf32 hw11translate2Ascii.asm -o hw11translate2ascii.o
  ```

# Linker to produce executable

```bash
  ld -m elf_i386 hw11translate2ascii.o -o hw11translate2ascii
  ```
# Run the program
```bash
 ./hw11translate2ascii
  ```

