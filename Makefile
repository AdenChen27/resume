.PHONY: clean, view


resume: resume.tex
	latexmk ./resume.tex -pdf -jobname=./aux/resume

view: resume.pdf
	open resume.pdf

clean:
	latexmk -c -output-directory=aux
