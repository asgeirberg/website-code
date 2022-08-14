#!/bin/bash

echo "Running Rmarkdown to generate HTML..."

echo "rmarkdown::render('/Users/asgeir/Dropbox/Philosophy/website/cv/cv.Rmd')" | R --no-save

if [ $? -eq 0 ]; then
   echo "HTML generated sucessfully."
else
   echo "Failed to genarate HTML. Aborting..."
   exit 1
fi

echo "Running Chrome to generate PDF..."
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --run-all-compositor-stages-before-draw  --headless --print-to-pdf="cv/cv.pdf" --virtual-time-budget=100000000 file:///Users/asgeir/Dropbox/Philosophy/website/cv/cv.html

if [ $? -eq 0 ]; then
   echo "PDF generated sucessfully."
else
   echo "Failed to genarate PDF. Aborting..."
   exit 1
fi

OLD_PATH=cv/cv.pdf
NEW_PATH=public/cv/cv_english_full_asgeir_matthiasson.pdf
if [ -f "$OLD_PATH" ]; then
	echo "Moving PDF to public/cv/..."
	mv $OLD_PATH $NEW_PATH
    
else 
    echo "$OLD_PATH does not exist. Aborting..."
	exit 1
fi

git --git-dir=/Users/asgeir/Dropbox/Philosophy/website/public/.git --work-tree=/Users/asgeir/Dropbox/Philosophy/website/public/ add cv/cv_english_full_asgeir_matthiasson.pdf
git --git-dir=/Users/asgeir/Dropbox/Philosophy/website/public/.git --work-tree=/Users/asgeir/Dropbox/Philosophy/website/public/ commit -m "updated CV"
git --git-dir=/Users/asgeir/Dropbox/Philosophy/website/public/.git --work-tree=/Users/asgeir/Dropbox/Philosophy/website/public/ push -u origin master


