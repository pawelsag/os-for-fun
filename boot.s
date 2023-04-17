.code16 # use 16 bits
.global init

init:
  mov $msg, %si
  mov $0xe, %ah
print_hello:
  lodsb
  cmp $0, %al
  je done
  int $0x10
  jmp print_hello
done:
  jmp done

msg: .asciz "Hello world!"

.fill 510-(.-init), 1, 0
.word 0xaa55
