.code16
.intel_syntax noprefix

.global init
# init have to be first funtion in file
init:
    mov si, offset msg
    mov ah, 0x0e
myprint:
    lodsb
    cmp al, 0
    je loop
    int 0x10
    jmp myprint
loop:
    hlt

msg: .asciz "Hello world!"

.fill 510-(.-init),1,0
.word 0xAA55
