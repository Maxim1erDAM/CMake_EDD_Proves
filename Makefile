CC=gcc
CFLAGS=-Wall -g
calcula: calcula.c calc.o
	$(CC) $(CFLAGS) calcula.c calc.o -o calcula
calc.o: calc.c calc.h
	$(CC) $(CFLAGS) -c calc.c -o calc.o
.PHONY: clean
clean:
	rm -rf *.o
	rm calcula