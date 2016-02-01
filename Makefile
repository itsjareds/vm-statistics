include Make.defines

PROGS =	 ex2

OPTIONS = -DUNIX  -DANSI


COBJECTS = checksum.o	 
CSOURCES = checksum.c

CPLUSOBJECTS = 

COMMONSOURCES =

CPLUSSOURCES =

all:	${PROGS}


ex2:		exampleUnixTime.o $(CPLUSOBJECTS) $(COBJECTS) $(LIBS) $(COMMONSOURCES) $(SOURCES)
		${CC} ${LINKOPTIONS}  $@ exampleUnixTime.o $(CPLUSOBJECTS) $(COBJECTS) $(LIBS) $(LINKFLAGS)


.cc.o:	$(HEADERS)
	$(CPLUS) $(CPLUSFLAGS) $(OPTIONS) $<

.c.o:	$(HEADERS)
	$(CC) $(CFLAGS) $(OPTIONS) $<



backup:
	rm -f ex2.tar
	rm -f ex2.tar.gz
	tar -cf ex2.tar *
	gzip -f ex2.tar

clean:
		rm -f ${PROGS} ${CLEANFILES}


