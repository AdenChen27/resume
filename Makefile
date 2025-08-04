resume:
	rendercv render resume.yaml -nomd -nohtml -nopng --use-local-latex-command "pdflatex"
	cp rendercv_output/Aden_Chen_CV.pdf resume.pdf
	open resume.pdf
