define hook-stop
x/10i $pc
x/10b $sp
end

set architecture i8086
target remote localhost:1234
br *0x7c00
c
