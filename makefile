target=makefile.pdf latex_study.pdf
all:$(target)
%.pdf:%.dvi
	dvipdf $< 
%.dvi:%.tex
	latex $<  
	-makeindex $(basename $<).idx
	latex $<
.PHONY:clean
clean:
	rm -f *.out *.fls *.idx *.ind *.dvi *.ps *.log *.toc *.aux *.ilg *.lof *.lot 
