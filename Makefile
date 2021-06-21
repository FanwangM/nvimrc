.PHONY: all
all:
	# Start Neovim to trigger the bootstrapping of plugins
	nvim -R install/bootstrap.txt; cat install/bootstrap.txt

.PHONY: pkg
pkg:
	cd install && makepkg -sfi

.PHONY: clean
clean:
	# NOTE: this removes *EVERYTHING* in this directory
	git clean -ffxd
