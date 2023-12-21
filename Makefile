.PHONY: clean


resume: resume.tex
	latexmk ./resume.tex -pdf -jobname=./aux/resume
view: aux/resume.pdf
	open aux/resume.pdf

clean:
	latexmk -c -output-directory=aux
