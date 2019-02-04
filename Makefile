TARGET=logo

.PHONY: all

all: $(TARGET).pdf

$(TARGET).pdf: $(TARGET).tex $(shell find . -type f -name "*.tex")
	latexmk -f -pdf -pdflatex="pdflatex -interaction nonstopmode -shell-escape" -use-make $(TARGET).tex

# Remove build files plus all the latex turds.
clean:
	latexmk -CA
	rm -f $(TARGET).bbl
	rm -f $(TARGET).tdo
	rm -f $(TARGET).figlist
	rm -f $(TARGET).makefile
	rm -f $(TARGET).auxlock
	rm -f $(TARGET).pyg
