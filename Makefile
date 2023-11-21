.PHONY: clean


resume: resume.tex
	latexmk ./resume.tex -pdf -jobname=./aux/resume


clean:
	latexmk -c -output-directory=aux
