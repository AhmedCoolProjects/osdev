# OS Development Project

This project is a simple operating system development experiment focused on creating a bootable system from scratch.

## Current Progress

So far, the project includes:

- A basic bootloader written in x86 assembly language
- BIOS interrupt calls for displaying text
- A "Hello, Ahmed!" message displayed on boot
- Proper boot sector formatting with the 0xAA55 signature

## Project Structure

- `src/` - Contains the assembly source code
  - `main.asm` - The main bootloader program
- `build/` - Contains build artifacts
  - `main.bin` - The compiled binary of the bootloader
  - `main_floppy.img` - A floppy disk image that can be booted in emulators

## Building and Running

This project uses `nasm` for assembly and `qemu` for emulation.

### Prerequisites

- NASM (Netwide Assembler)
- QEMU
- Make

### Commands

- `make all` - Builds the project and creates a bootable floppy image
- `make run` - Builds the project and runs it in QEMU
- `make clean` - Removes all build artifacts

## Technical Details

The bootloader:

1. Sets up the data segments and stack
2. Includes a `puts` function to display text on the screen using BIOS interrupts
3. Displays a welcome message
4. Halts the CPU

The floppy image is configured to be 1.44MB in size, which is standard for legacy systems.

## Next Steps

Potential next steps for this OS development project could include:

- Implementing more BIOS utilities
- Adding disk reading functionality
- Creating a simple file system
- Transitioning to protected mode
- Adding a simple kernel
