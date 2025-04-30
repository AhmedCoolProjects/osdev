org 0x7C00
bits 16

main:
    hlt

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