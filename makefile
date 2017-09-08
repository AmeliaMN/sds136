#!/usr/bin/env Rscript

all: www 

www: schedule.Rmd _site.yml
	cp -f ~/oiLabs-mosaic/*/*.html labs/
	cp -f ~/oiLabs-mosaic/*/*.Rmd labs/
	cp -f ./data/movies.csv data/
#	cp -f ~/oiLabs-mosaic/*/*.css labs/
	cp -f ../student_info/project/gradesheet.pdf handouts/
	cp ./handouts/Syntax-cheatsheet.pdf handouts/
	cp ../quizzes/R-guide.pdf handouts/
	cp ../quizzes/questionnaire.pdf handouts/
	Rscript -e "rmarkdown::render_site();"

upload: 
	find _site/lectures/ -type f -regex ".*\(gz\|log\|tex\)$$" | xargs rm
#	find _site/handouts/ -type f -not -name "*.pdf" | xargs rm
	rsync -avz --exclude-from .rsync-ignore --delete ~/SDS220/www/_site/ amcnamara@www.science.smith.edu:public_html/sds220/

