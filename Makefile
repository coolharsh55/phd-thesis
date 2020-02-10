DOC_SRC:=main.tex
DOC_TARGET:=$(DOC_SRC:.tex=.pdf)
BIB_FILES:=$(shell find -iname '*.bib')
.PHONY: all clean

all: $(DOC_TARGET)

# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.
# -interaction=nonstopmode keeps the pdflatex backend from stopping at a
#     missing file reference and interactively asking you for an alternative.

$(DOC_TARGET): $(DOC_SRC) $(BIB_FILES)
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode -shell-escape" -use-make $<

draft:
	pdflatex -interaction=nonstopmode -shell-escape $(DOC_SRC)

test:
	pdflatex -shell-escape $(DOC_SRC)

clean:
	latexmk -C $(DOC_SRC)

xclean:
	sh ./clean.sh
