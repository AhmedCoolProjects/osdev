org 0x7C00
bits 16

%define ENDL 0x0D, 0x0A

start:
    jmp main



;
; Prints the string at the given address to the screen
; Params:
;   - ds:si points to string
;
puts:
    push si
    push ax

.loop:
    lodsb
    or al, al
    jz .done
    mov ah, 0x0E ; teletype output
    mov bh, 0 ; page number
    int 0x10 ; BIOS interrupt to print character

    jmp .loop

.done:
    pop ax
    pop si
    ret

; This is a simple bootloader that does nothing but halt the CPU.
main:

    ; setup data segments
    mov ax, 0 ; can't write to ds/es directory
    mov ds, ax
    mov es, ax

    ; setup stack (FIFO), we need to set up a stack pointer for the program
    mov ss, ax
    mov sp, 0x7C00 ; stack pointer at the top of the boot sector

    mov si, msg_hello ; load the address of the message into si
    call puts ; call the puts function to print the message


    hlt

msg_hello: db 'Hello, Ahmed!', ENDL, 0

.halt:
    jmp .halt
    ; This is a simple assembly program that does nothing but halt. means 
    ; it will run indefinitely in a loop at the halt label.

times 510-($-$$) db 0
dw 0xAA55

; The above line fills the remaining space in the boot sector with zeros
; until it reaches 510 bytes, and then writes the boot signature 0xAA55
; at the end of the sector. This is required for the BIOS to recognize
; the sector as a valid bootable disk.