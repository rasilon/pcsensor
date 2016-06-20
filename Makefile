all:	pcsensor

CFLAGS = -O2 -Wall -I/usr/include/postgresql
LDFLAGS = -lusb -lpq


pcsensor:	pcsensor.c
	${CC} ${CFLAGS} -DUNIT_TEST -o $@ $^ ${LDFLAGS}

clean:		
	rm -f pcsensor *.o

rules-install:			# must be superuser to do this
	cp 99-tempsensor.rules /etc/udev/rules.d
