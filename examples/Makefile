SRC=$(wildcard *.pas)
OBJ=$(SRC:.pas=.o)
EXE=$(SRC:.pas=)

all: $(EXE)

$(EXE):

%: %.pas
	echo Build $@ from $<
	fpc -O2 $<

clean:
	rm -rf *.o *~ $(EXE)

.PHONY: all clean
