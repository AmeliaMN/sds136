#!/usr/bin/env Rscript

all: www 

www: index.Rmd _site.yml include/after_body.html include/smith.css schedule.Rmd assignments.Rmd
	Rscript -e "rmarkdown::render_site();"
