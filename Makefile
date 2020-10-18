#----------------------------------------------------------
# Makefile for document processing with Pandoc and lualatex
#
# Inspirations and alternatives:
# - https://gist.github.com/kristopherjohnson/7466917
# - https://gist.github.com/bertvv/e77e3a5d24d8c2a9bcc4
# - https://keleshev.com/my-book-writing-setup/
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
flattenEqnsFlag := #false

.PHONY: all help final latex touch

# PDFs
pdf: $(targets); $(info $$targets are: [${targets}], ${timestampFlag})

final:
	touch $(sources)
	$(eval timestampFlag=)
	$(eval flattenEqnsFlag=true)

latex: $(texTarg) $(styles); $(info $$targets are: [${texTarg}])

# latex: $(outdir)/%.tex

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
	# $(if $(flattenEqnsFlag),-H $(stydir)/imageeqn.sty) \

# Tex -> PDF
$(outdir)/%.pdf: $(outdir)/%.tex $(styles)
	cd $(outdir) && lualatex \
	--shell-escape \
	--output-directory=../$(outdir) \
	--interaction=nonstopmode \
	../$< -o ../$@
	# --verbose

$(figdir)/%.pdf: $(srcdir)/%.gv
	dot $< -Tpdf > $@

help:
	@echo ' 																	  '
	@echo 'Makefile for the Pandoc workflow                                       '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make [final] [pdf | latex]       generate PDF file  				  '
	@echo '   make latex	                   generate Latex files	 			  '
	@echo '                                                                       '
	@echo ' 																	  '
	@echo ' 																	  '
