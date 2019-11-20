########################################################
CC=gcc
CFLAGS= -g -Wall -pedantic
EJS = pr_afnd
########################################################
OBJECTS = pr_afnd.o afnd_ofus.o transforma.o
########################################################

all: $(EJS) clear

pr_afnd: $(OBJECTS)
	$(CC) $(CFLAGS) -o pr_afnd $(OBJECTS)

pr_afnd.o: pr_afnd.c transforma.h afnd.h
	$(CC) $(CFLAGS) -c pr_afnd.c

afnd_ofus.o: afnd_ofus.c afnd.h
	$(CC) -c afnd_ofus.c

transforma.o: transforma.c transforma.h afnd.h
	$(CC) $(CFLAGS) -c transforma.c

clear:
	rm -rf *.o

clean:
	rm -rf *.o $(EJS) pr_afnd

runv:
	valgrind --leak-check=full ./pr_afnd
