.PHONY: release build install uninstall clean test doc format

release:
	dune build @install --profile=release

build:
	dune build @install

install:
	install -D _build/install/default/bin/xcp-rrdd $(DESTDIR)$(SBINDIR)/xcp-rrdd
	install -D _build/install/default/bin/rrd-cli $(DESTDIR)$(SBINDIR)/rrd-cli

uninstall:
	rm -f $(DESTDIR)$(SBINDIR)/xcp-rrdd
	rm -f $(DESTDIR)$(SBINDIR)/rrd-cli

clean:
	dune clean

test:
	dune runtest --profile=release

# requires odoc
doc:
	dune build @doc --profile=release

gh-pages:
	bash .docgen.sh

format:
	dune build @fmt --auto-promote
