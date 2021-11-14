C1541 = c1541
PETCAT = petcat
PRG_FILENAME = mega dos shell

.PHONY: all build extract new

all:

build: mega-dos-shell.d81 mega-dos-shell.bas
	$(PETCAT) -w65 -o mega-dos-shell.prg mega-dos-shell.bas
	$(C1541) $(PWD)/mega-dos-shell.d81 \
		-delete "$(PRG_FILENAME)" \
		-write mega-dos-shell.prg "$(PRG_FILENAME)"

extract: mega-dos-shell.d81 mega-dos-shell.bas
	$(C1541) $(PWD)/mega-dos-shell.d81 -read "$(PRG_FILENAME)" mega-dos-shell.prg
	$(PETCAT) -65 -o mega-dos-shell.bas mega-dos-shell.prg

new:
	$(C1541) -format 'mega dos shell,ds' d81 "$(PWD)/mega-dos-shell.d81"
