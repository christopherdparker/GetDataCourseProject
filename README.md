Create a tidy data set for the activity sensor data
===================================================

### Overview
This repo will take the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and convert it into a "tidy" dataset. The final data includes the average and standard deviation of all measurements in the original data calculated for each individual-activity pair. More information on the original data is here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

### Getting tidy data
1. Download data into working directory.
2. Unzip file into working directory.
3. Download run_analysis.R into working directory. (Note that the unzipped "UCI HAR Dataset" folder is *in* the working directory.)
4. Run run_analysis.R.
5. Tidy data will be in tidydata.txt in the working directory.