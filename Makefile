C1541 = c1541
PETCAT = petcat
PRG_FILENAME = mega dos shell

.PHONY: menu build extract new
.SILENT: menu

menu:
	echo 'You need to give a make target'
	echo
	echo 'make build       mega-dos-shell.bas  --> disk image'
	echo 'make extract     mega-dos-shell.bas <--  disk image'
	echo 'make new         create and format a new disk image'
	false

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
