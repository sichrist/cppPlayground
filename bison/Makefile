
CC=cc
CFLAGS = -lfl

BISON = bison
BISON_FLAGS = -d 

FLEX = flex
FLEX_FLAGS = -o

DIRECTORY = $(filter-out . ,$(sort $(shell find -maxdepth 1 -not -empty -type d)))
TMPVAR := $(DIRECTORY)
DIRECTORY = $(filter-out ./build, $(TMPVAR))

BINARYS = $(DIRECTORY:./%=%)

LEX_FILES = $(wildcard fb1-*/*.l)
LEX_PATH = $(LEX_FILES:%/%.l=%)

BISON_FILES = $(notdir $(wildcard fb*/*.y))
BISON_BLANK = $(BISON_FILES:%.y=%)
BISON_PATHS = $(wildcard fb*/*.y)

BUILDDIR = build/
BINDIR = $(BUILDDIR)bin/

all: build $(BINARYS) $(BISON_FILES)
	@echo "LEX FILES    : " $(LEX_FILES)
	@echo "BISON PATHS  : " $(BISON_PATHS)
	@echo "BISON FILES  : " $(BISON_FILES)
	@echo "ENDE"

build: 
	@mkdir -p $(BUILDDIR)
	@mkdir -p $(BINDIR)

$(BINARYS):
	@mkdir -p $(BUILDDIR)$@
	@$(FLEX) $(FLEX_FLAGS) $(BUILDDIR)$@/$@.yy.c $@/$@.l

$(BISON_BLANK):
	$(BISON) $(BISON_FLAGS) $@/$@.y

.PHONY: all $(BINARYS) $(BISON_FILES)

clean:
	rm -rf build *.yy.c *.tab.*
