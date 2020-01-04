CC=gcc
CFLAGS=-Wall -g

.PHONY: dist
dist: clean calcula
	rm -rf ../dist;
	mkdir -p ../dist/usr/bin/calcula
	cp calcula ../dist/usr/bin/calcula
.PHONY: targz
targz: clean
	mkdir -p source
	cp *.c *.h Makefile source
	tar -cvf calcula.tar source
	gzip calcula.tar
	rm -rf calcula.tar
	rm -rf source

install:dist
	cp -r ../dist/* /

calc.o: calc.c calc.h
	$(CC) $(CFLAGS) -c calc.c -o calc.o

.PHONY: clean

calcula: calcula.c calc.o
	$(CC) $(CFLAGS) calcula.c calc.o -o calcula

clean:
	rm -rf *.o
	rm calcula
