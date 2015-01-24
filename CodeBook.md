Codebook
========

### Overview
This codebook describes the steps taken to convert will take the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and convert it into a "tidy" dataset. The final data includes the average and standard deviation of all measurements in the original data calculated for each individual-activity pair. More information on the original data is here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

### Original data
The original data is from an experiment with 30 participants performing six different activities while wearing a smartphone. The data captures many dimensions of the subjects' movement which performing these activities. After the experiment, subjects were randomly split into two sets: test and train. 

- subject_test.txt: contains the participant number (1-30) for the test data  
- y_test.txt: contains the activity number (1-6) for the test data  
- x_test.txt: contains the vector information (1-531) for the test data  
- subject_training.txt: contains the participant number (1-30) for the training data  
- y_training.txt: contains the activity number (1-6) for the training data  
- x_trainingt.txt: contains the vector information (1-531) for the training data  
- features.txt: contains the descriptive names of activities
- activity_labels.txt: contains the labels for the y_test/train files.

More information on the original data is here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. Specifically, the readme.txt file is very descriptive.
 
### Transformations

1. Get column names from the features file.
2. Import test and training datasets for X, Y, and subject using column names from Step 1.
3. Combine test and training datasets for  X, Y, and subject into one data frame.
4. Only include data for the mean and standard deviation of measurements.
5. Give activities meaning by adding labels to the factor variable from activity_labels.txt
6. Give meaningful names to the columns.
7. Create a tidy dataset with the average of all variables by subject and activity.
8. Write the tidy data to a file called "tidydata.txt" in the working directory.

### Data Dictionary
The final data contains 180 observations (30 subjects x 6 activities = 180). The identifiers are as follows:

- subjectid - the subject identifier (1-30) 
- activityid - factor variable for the activity

The remaining variables contain the average for the subject-activity pair. Descriptions of parts of the variables in the order of their appearance in the variables name are:

- time - measurement was calculated using the time domain  
- fourier - measurement was calculated using the frequency domain
- body - the person's own movement  
- gravity - movement due to gravity  
- accelerometer - acceleration - m/s^2  
- jerk - jerk - m/s^3  
- gyroscope - angular velocity - radians/s  
- magnitude - magnitude using the Euclidean norm
- std - standard deviation  
- mean - average  
- dimension {x, y, z} - which axis the measurement corresponds to  