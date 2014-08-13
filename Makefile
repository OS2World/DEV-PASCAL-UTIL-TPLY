#######################################################################  
#       GNU makefile for Pascal yacc and lex 
#        (with Free Pascal compiler)
#######################################################################

# Compiler to use
PP=ppc386

# options to pass (needed options are added by makefile)
OPT=

# Where are the Units ?
UNITDIR=/usr/lib/fpc/0.99.5/linuxunits

# Where to install binaries ?
BININSTALLDIR=/usr/local/bin

# Where to install the lexlib and yacclib units ?
UNITINSTALLDIR=/usr/lib/fpc/0.99.5/linuxunits

# Where to install .cod files ?
# DO NOT CHANGE unless you change this path in the lex.pas yacc.pas files
# TOO !!
CODINSTALLDIR=/usr/lib/fpc/lexyacc

#######################################################################
# No need to edit below this line.
#######################################################################

# General stuff
OBJECTS = pyacc plex 
CODFILES = yylex.cod yyparse.cod
LEXYACCNAMES = lexlib yacclib
LEXYACCUNITS = $(addsuffix .ppu, $(LEXYACCNAMES))
LEXYACCOBJECTS = $(addsuffix .o, $(LEXYACCNAMES))
LEXYACCSOURCES = $(addsuffix .pas, $(LEXYACCNAMES))

.PHONY: all install clean
.SUFFIXES: .pas .ppu

# Add needed options
override OPT:=$(OPT) -Sg -Up$(UNITDIR)

# Default rule for units

.pas.ppu:
	$(PP) $(OPT) $<

all: $(OBJECTS) $(LEXYACCUNITS)

pyacc: yacc.pas $(LEXYACCUNITS)
	$(PP) $(OPT) yacc.pas
	mv yacc pyacc

plex: lex.pas $(LEXYACCUNITS)
	$(PP) $(OPT) lex.pas
	mv lex plex

clean:
	-rm -f *.o *.ppu core $(OBJECTS)

install: all
	install -m 755 -d $(BININSTALLDIR)
	install -m 755 $(OBJECTS) $(BININSTALLDIR)
	install -m 755 -d $(UNITINSTALLDIR)
	install -m 666 $(LEXYACCUNITS) $(LEXYACCOBJECTS) $(UNITINSTALLDIR)
	install -m 755 -d $(CODINSTALLDIR)
	install -m 666 $(CODFILES) $(LEXYACCSOURCES) $(CODINSTALLDIR)
