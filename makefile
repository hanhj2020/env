target=makefile.pdf
all:$(target)
%.pdf:%.dvi
	dvipdf $< 
%.dvi:%.tex
	latex $< 
.PHONY:clean
clean:
	rm -f *.log *.aux $(target)
