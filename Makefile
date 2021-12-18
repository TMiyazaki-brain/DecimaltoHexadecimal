AS = nasm -felf
LD = ld
LDFLAGS = -m elf_i386
OBJS_MUL = test_mul_10k.o mul_10k.o mul_edx.o print_eax_hex.o

%.o: %.s
	$(AS) $<

test_mul_10k: $(OBJS_MUL)
	$(LD) $(LDFLAGS) $+ -o $@

.PHONY: test clean

test: test_mul_10k
	./test_mul_10k

clean:
	rm -f *.o *~ a.out
