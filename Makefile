
default: xenon-release

#all: debug release
all: xenon-release

debug: cube-debug wii-debug xenon-debug

release: xenon-release 

readonly: xenon-readonly

readonlyinstall: xenon-readonly_install

xenon-readonly:
	$(MAKE) -C source PLATFORM=xenon BUILD=xenon_readonly

xenon-readonly_install:
	$(MAKE) -C source PLATFORM=xenon BUILD=xenon_readonly
	$(MAKE) -C source install

xenon-debug:
	$(MAKE) -C source PLATFORM=xenon BUILD=xenon_debug

cube-debug:
	$(MAKE) -C source PLATFORM=cube BUILD=cube_debug

wii-debug:
	$(MAKE) -C source  PLATFORM=wii BUILD=wii_debug

xenon-release:
	$(MAKE) -C source  PLATFORM=xenon BUILD=xenon_release
	
cube-release:
	$(MAKE) -C source  PLATFORM=cube BUILD=cube_release

wii-release:
	$(MAKE) -C source  PLATFORM=wii BUILD=wii_release

clean: 
	$(MAKE) -C source clean

install: xenon-release
	$(MAKE) -C source install

run: install
	$(MAKE) -C example
	$(MAKE) -C example run

