global start

section .text
bits 32
start:
    mov word [0xb8000], 0x0257 ; W
    mov word [0xb8002], 0x0269 ; i
    mov word [0xb8004], 0x026e ; n
    mov word [0xb8008], 0x0273 ; s
    mov word [0xb800a], 0x0274 ; t
    mov word [0xb800c], 0x026f ; o
    mov word [0xb800e], 0x026e ; n
    mov word [0xb8010], 0x024f ; O
    mov word [0xb8012], 0x0253 ; S
    mov word [0xb8014], 0x0221 ; !
    hlt
