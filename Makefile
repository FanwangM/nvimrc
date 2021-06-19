.PHONY: all
all:
	# Install julia language server
	command -v julia > /dev/null 2>&1 && julia -e 'using Pkg; Pkg.add("LanguageServer"); Pkg.add("SymbolServer")'
	# Start Neovim to trigger the bootstrapping of plugins
	cat install/bootstrap.txt | nvim -R; cat install/bootstrap.txt

.PHONY: pkgbuild
pkgbuild:
	cd install && makepkg -sfi

.PHONY: clean
clean:
	# NOTE: this removes *EVERYTHING* in this directory
	git clean -ffxd
