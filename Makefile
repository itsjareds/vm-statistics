include Make.defines

PROGS =	 hw1

OPTIONS = -DUNIX  -DANSI


COBJECTS = checksum.o	 
CSOURCES = checksum.c

CPLUSOBJECTS = 

COMMONSOURCES =

CPLUSSOURCES =

all:	${PROGS}


ex2:		exampleUnixTime.o $(CPLUSOBJECTS) $(COBJECTS) $(LIBS) $(COMMONSOURCES) $(SOURCES)
		${CC} ${LINKOPTIONS}  $@ exampleUnixTime.o $(CPLUSOBJECTS) $(COBJECTS) $(LIBS) $(LINKFLAGS)


hw1:		hw1.o $(CPLUSOBJECTS) $(COBJECTS) $(LIBS) $(COMMONSOURCES) $(SOURCES)
		${CC} ${LINKOPTIONS}  $@ hw1.o $(CPLUSOBJECTS) $(COBJECTS) $(LIBS) $(LINKFLAGS)


.cc.o:	$(HEADERS)
	$(CPLUS) $(CPLUSFLAGS) $(OPTIONS) $<

.c.o:	$(HEADERS)
	$(CC) $(CFLAGS) $(OPTIONS) $<



backup:
	rm -f hw1.tar
	rm -f hw1.tar.gz
	tar -cf hw1.tar *
	gzip -f hw1.tar

clean:
		rm -f ${PROGS} ${CLEANFILES}


