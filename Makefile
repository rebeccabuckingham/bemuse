ifeq ($(CROSS_COMPILE_WINDOWS),1)
	SDL2CONFIG?=$(WIN_SDL2)/bin/sdl2-config --prefix=$(WIN_SDL2)
else
	SDL2CONFIG=sdl2-config
endif

CFLAGS=-std=c99 -O3 -Wall -Werror -g $(shell $(SDL2CONFIG) --cflags) 
CXXFLAGS=-std=c++17 -O3 -Wall -Werror 
LDFLAGS=$(shell $(SDL2CONFIG) --libs) -lm -lz

ODIR = build/bemu
SDIR = src

OUTPUT = bemu

# probably don't need this, dunno yet.
ifeq ($(MAC_STATIC),1)
	LDFLAGS=$(LIBSDL_FILE) -lm -liconv -lz -Wl,-framework,CoreAudio -Wl,-framework,AudioToolbox -Wl,-framework,ForceFeedback -lobjc -Wl,-framework,CoreVideo -Wl,-framework,Cocoa -Wl,-framework,Carbon -Wl,-framework,IOKit -Wl,-weak_framework,QuartzCore -Wl,-weak_framework,Metal -Wl,-weak_framework,CoreHaptics -Wl,-weak_framework,GameController
endif

_OBJS = main.o emu816.o mem816.o wdc816.o video.o vera_spi.o sdcard.o files.o
OBJS = $(patsubst %,$(ODIR)/%,$(_OBJS))

.PHONY: all clean
all: bemu

bemu: $(OBJS)
	$(CXX) -o bemu $(OBJS) $(LDFLAGS)

$(ODIR)/%.o: $(SDIR)/%.c
	@mkdir -p $$(dirname $@)
	$(CC) $(CFLAGS) -c $< -MD -MT $@ -MF $(@:%o=%d) -o $@

$(ODIR)/%.o: $(SDIR)/%.cc
	@mkdir -p $$(dirname $@)
	$(CXX) $(CXXFLAGS) -c $< -MD -MT $@ -MF $(@:%o=%d) -o $@

# Empty rules so that renames of header files do not trigger a failure to compile
$(SDIR)/%.h:;

clean:
	rm -rf $(ODIR) bemu