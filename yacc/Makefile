CC=gcc

#CFLAGS=-Wall -pedantic -Werror -g -DVERSION=\"$(GIT_VERSION)\" 

#LDFLAGS= -lpthread -lrt

### C files einlesen ###

#SOURCES = $(wildcard *.c)

### Namen der .o files aus den .c files generieren

#OBJECTS = $(SOURCES:.c=.o)

### Name zum ausführen generieren

#NAME = $(SOURCES:.c=)

all: lex myscanner

lex:
	lex myscanner.l

myscanner:
	$(CC) myscanner.c lex.yy.c -o myscanner


#server: $(OBJECTS)
#	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $@.o socket.o msgHandler.o fifo.o

#client: $(OBJECTS)
#	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $@.o socket.o msgHandler.o
	
#msgHandler:
#	$(CC) $(CFLAGS) $(LDFLAGS) $@ msgHandler.c msgHandler.h

#socket:
#	$(CC) $(CFLAGS) $(LDFLAGS) $@ socket.c socket.h

#fifo:
#	$(CC) $(CFLAGS) $(LDFLAGS) $@ fifo.c fifo.h

#$(OBJECTS) : %.o : %.c
#	$(CC) $(CFLAGS) -c $<


# CleanUp .......................................#



clean:
	rm -f *.o myscanner lex.yy.c