# Mega DOS Shell
This the beginning of an idea to reimagine the DOS shell Commodore provided on the 1571 test/demo diskette, but for the [Mega65](https://mega65.org/).

There's nothing much here yet. But there are [some ideas](https://github.com/jimnicholls/mega-dos-shell/discussions/categories/ideas) growing over in the discussions.


## Building
[The user's guide](https://github.com/jimnicholls/mega-dos-shell/wiki/User's-guide) might provide some clues on how to use the Mega DOS Shell.
Before you can, you'll need to build a disk image.

1. Build VICE with patch [320](https://sourceforge.net/p/vice-emu/patches/320/). Make `petcat` and `c1541` findable via `PATH`.
2. `make new-disk` if you don't have a `mega-dos-shell.d81` disk image yet.
3. `make build-disk` to add/replace `MEGA DOS SHELL` in the disk image with [mega-dos-shell.bas](https://github.com/jimnicholls/mega-dos-shell/blob/main/mega-dos-shell.bas). 


## Committing changes
[The code page](https://github.com/jimnicholls/mega-dos-shell/wiki/Code) in the wiki describes the code.

1. `make extract-disk` to replace [mega-dos-shell.bas](https://github.com/jimnicholls/mega-dos-shell/blob/main/mega-dos-shell.bas) with `MEGA DOS SHELL` in the disk image.
2. Commit mega-dos-shell.bas.
