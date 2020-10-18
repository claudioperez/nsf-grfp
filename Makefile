#----------------------------------------------------------
# Makefile for document processing with Pandoc and lualatex
#
#----------------------------------------------------------

SHELL = /usr/bin/bash

srcdir := src
outdir := build
figdir := build/figs
stydir := style

# Collect all *.md files in the source directory
sources := $(wildcard $(srcdir)/*.md)
targets := $(patsubst %.md,%.pdf,$(subst $(srcdir),$(outdir),$(sources)))
texTarg = $(patsubst %.md,%.tex,$(subst $(srcdir),$(outdir),$(sources)))
styles := $(wildcard $(stydir)/*.sty)
styles += $(wildcard *.tex)

timestampFlag := true

.PHONY: all help final latex touch

# PDFs
pdf: $(targets); $(info $$targets are: [${targets}], ${timestampFlag})

final:
	touch $(sources)
	$(eval timestampFlag=)
	$(eval flattenEqnsFlag=true)

latex: $(texTarg) $(styles); $(info $$targets are: [${texTarg}])


touch:
	touch $(sources)

# Markdown -> Tex
$(outdir)/%.tex: $(srcdir)/%.md
	pandoc '$<' -o $@ \
	--defaults $(stydir)/conf.yaml \
	--template $(stydir)/temp.tex \
	-H $(stydir)/nsf-grfp.tex \
	-F pandoc-citeproc \
	--verbose \
	$(if $(timestampFlag),-VtimestampFlag=timestampFlag) \

# Tex -> PDF
$(outdir)/%.pdf: $(outdir)/%.tex $(styles)
	cd $(outdir) && lualatex \
	--shell-escape \
	--interaction=nonstopmode \
	--verbose \
	../$< -o ../$@

$(figdir)/%.pdf: $(srcdir)/%.gv
	dot $< -Tpdf > $@

help:
	@echo ' 																	  '
	@echo 'Makefile for the Pandoc workflow                                       '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make [final] [pdf | latex]       Generate PDF or latex files		  '
	@echo '                                    from src/*.md                      '
	@echo '   make touch [pdf | latex]		   Force a draft build when source		'
	@echo ' 																	  '
