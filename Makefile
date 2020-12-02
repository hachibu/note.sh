current_dir = $(shell pwd)

install:
	ln -s $(current_dir)/src/note.sh /usr/local/bin/note.sh

uninstall:
	unlink /usr/local/bin/note.sh
