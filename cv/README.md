# Welcome to `pagedown-cv`
This repository holds templates for dynamically generating a cv with the [`rmarkdown`](https://rmarkdown.rstudio.com) and [`pagedown`](https://github.com/rstudio/pagedown) R packages, illustrated with my personal resumé.

(NOTE: 1-3 only displays properly in Chrome, as some aspects of CSS Paged Media are only supported by this browser):

1. [Paged, academic resume (**one-column-paged-academic.Rmd**)](https://ulyngs.github.io/pagedown-cv/one-column-paged-academic.html)
1. [Paged, 2-column brief resume (**two-column-paged-brief.Rmd**)](https://ulyngs.github.io/pagedown-cv/two-column-paged-brief.html)
1. [Paged, 1-column resume (**one-column-paged.Rmd**)](https://ulyngs.github.io/pagedown-cv/one-column-paged.html)
1. [Ordinary scrolling HTML resume (**one-column.Rmd**)](https://ulyngs.github.io/pagedown-cv/one-column.html)
1. [Ordinary scrolling HTML resume, formatted in the style of an old version of my personal website (**website-cv.Rmd**)](https://ulyngs.github.io/pagedown-cv/website-cv.html)
1. (For an in-practice example of the website cv, [see the current version on my website](https://ulriklyngs.com/cv/))

## Why?
The [`pagedown`](https://github.com/rstudio/pagedown) package lets you output an R Markdown file to paged HTML content which can then be saved as PDF.
This means you can use R Markdown to programmatically pull out content from some spreadsheet with our CV data, output it to a paged format, do the styling with CSS, then save as PDF and/or host it online. Brilliant!

Nick Strayer's excellent [data-driven cv](http://nickstrayer.me/datadrivencv/)) package, as well as the base format for resumés provided by `pagedown` (`pagedown::html_resume`), make this easy to do.

However, their available layouts don't really suit my tastes (especially for an academic CV), so I developed my own paged formats.

## Which format do you use?
My favored format for academic purposes (example 1) is inspired by the resumés of [Matthew Kay](http://www.mjskay.com/) and [Elena Agapie](https://eagapie.com/pubs/cv.pdf):

<a href="https://ulriklyngs.com/pdfs/2021_jan_academic_cv.pdf"><img src="examples/cur_cv_pg1.jpg"></a>

The two-column resume layout I use for brief, professional 2-page resumés. I originally made this layout in Microsoft Word. 
After I became enamoured with R Markdown, I at some point set out to recreate it with `pagedown` (example 2):

<a href="https://ulyngs.github.io/pagedown-cv/two-column-paged-brief.html"><img src="examples/page1_new.png"></a>


## How does it work?
Each resumé is generated by an R Markdown file that pulls in content from **\_content/cv_entries.csv** and **\_content/publications.csv**.

The CSV files with the content are local copies of the corresponding tabs in [this google sheet](https://docs.google.com/spreadsheets/d/1ta71CAGkcLqm-W1UdVRA_JJSddWV2TsrRZsCnQlmOis/edit?usp=sharing), which holds most of the content for [my website](https://ulriklyngs.com/).

The R script **sync_w_gsheets.R** grabs the current content of the 'cv_entries' and the 'publications' tabs in the google sheet and stores it in the **\_content** folder.


## How do I use it?
To use this for your own CV, download or clone the GitHub repo: https://github.com/ulyngs/pagedown-cv/ 

Then replace the content in the CSV files with your own stuff and tweak the **.Rmd** files accordingly.