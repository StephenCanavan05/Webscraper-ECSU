# Introduction

This is Stephen Canavan's coding work for his 2025 Thesis. This includes a webscrapper for ECSU faculty contact information, office hours, and all course times.

This project contain currently 4 jupyter notebook files that perform a certain function regarding ECSU information.

On installation this repository contains 4 jupyter notebook files. Run the prologconverter file last.

# File Breakdown

## allCourses:

allCourses is a python script that webscrapers ECSU classes from eWeb and formats them into prolog statements. They way you use it is by running all, or running the script, and then entering a filename for it, and then chosing a semester as explained in the prompt when ran

## officeHours: 

officeHours is a python script that webscrapers the ECSU professors and there office hour times and formats that into prolog statements. This can be done by running the program and then entering a file name

## ContactInfo:

ContactInfo is a python script that does the same thing as officeHours except it just gives the contact info of each professor rather than office hours. 

## PrologConverter:

PrologConverter is a python script that integrates some aspect of a gui and allows the user to upload the selected final product files. In order for proper prolog conversion you must upload all 3 files. So you must run all the notebooks before this one. When you run this notebook, under the final files folder you will be able to select the specific files for each category, ensure that they go in the correct slots for proper conversion. After you have uploaded them, run the final code segment and your prologfiles should be available for access under the prologFiles folder. Note you must have some form of prolog compiler, perferbally the SWI Desktop Prolog compiler to properly use these files.

# Accessing your files:

After running the files, 4 folders contain the rest of the info. 

## finalFiles:

This is where you go to find the final output or the prolog statements. These are all CSV files

## intermediateFiles:

This is where you go to find the csv files that go into making the final one, they are a way to check the process.

## webscrapedInfo:

This is the raw webscraped data and can be useful if you want to check over what has been extracted.


## prologFiles:

This is all the prolog files that are converted from the formatted webscrapped data. This can be best used along side a prolog compiler. The SWI Desktop Prolog compiler is recommended.

# Notes:

This project is currently in the works and if you have any questions please reach out to canavans@my.easternct.edu for more details.