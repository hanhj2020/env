target=makefile.pdf latex_study.pdf mark_down.html git服务器安装与设置.html bash.html  linux_env_study.html  linux_env.html mount.html
all:$(target)
mark_down.html:mark_down.md
bash.html:bash.md
linux_env_study.html:linux_env_study.md
linux_env.html:linux_env.md
mount.html:mount.md
git服务器安装与设置.html:git服务器安装与设置.md

%.html:%.md	
	pandoc -f markdown  $< -o $@ -c dox.css
latex_study.pdf:latex_study.tex
	xelatex $<
%.pdf:%.dvi
	dvipdf $< 
%.dvi:%.tex
	latex $<  
	-makeindex $(basename $<).idx
	latex $<
.PHONY:clean
clean:
	rm -f *.out *.fls *.idx *.ind *.dvi *.ps *.log *.toc *.aux *.ilg *.lof *.lot *.html 
