SHELL = bash
all:
	@echo -e "JPKG package builder.\n\nUsage:\n\tmake package\n\tmake clean"
update_modules:
	@echo "Updating git submodules from remotes.."
	@git submodule update --init --recursive --remote .
	@echo -e "Submodules ready\n\nMake sure to git commit before procceding to make!!"
modules:
	@echo "Preparing git submodules.."
	@git submodule update --init --recursive .
	@echo "Submodules ready"
package: rminst modules geninst
	@python3 -u scripts/generate_package.py
clean: rminst
	@if [ -e "package.jpk" ]; then rm package.jpk; fi
	@if find "files" -maxdepth 1 -name '*.mpy' | grep -q .; then rm files/*.mpy; fi
geninst:
	@python3 -u scripts/gen_install_scripts.py
rminst:
	@if [ -e "files/installer.py" ]; then rm files/installer.py; fi
	@if [ -e "files/strap.py" ]; then rm files/strap.py; fi
	@if [ -e "files/uninstaller.py" ]; then rm files/uninstaller.py; fi
