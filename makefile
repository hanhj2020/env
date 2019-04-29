target=makefile.pdf latex_study.pdf
all:$(target)
%.pdf:%.dvi
	dvipdf $< 
%.dvi:%.tex
	latex $< 
.PHONY:clean
clean:
	rm -f *.log *.aux $(target)
