#!/bin/bash
cd /projects/personal/my-notes
gstatus=`git status --porcelain`

if [ ${#gstatus} -ne 0 ]
then

    git add --all
    git commit -m "$gstatus"

	git pull
    git push 
 
fi
