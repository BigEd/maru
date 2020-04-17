CFLAGS = -Wall -std=c99 -D_ISOC99_SOURCE

all: eval-opt

eval-opt: eval.c
	gcc $(CFLAGS) -O3 -fomit-frame-pointer -DNDEBUG -o eval eval.c

eval-debug: eval.c
	gcc $(CFLAGS) -g -o eval eval.c

eval-debuggc: .force
	$(MAKE) CFLAGS="$(CFLAGS) -DDEBUGGC=1" eval-debug

clean:
	rm -f *~ *.o eval

.force:
