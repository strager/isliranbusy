all: install.sh

clean:
	rm install.sh

install.sh: install-base.sh ping.sh x-idle
	(cat install-base.sh ; tar cz ping.sh x-idle) > $@
	chmod +x $@

.PHONY: all clean
