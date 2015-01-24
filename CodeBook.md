Codebook
========

### Overview
This codebook describes the steps taken to convert will take the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and convert it into a "tidy" dataset. The final data includes the average and standard deviation of all measurements in the original data calculated for each individual-activity pair. More information on the original data is here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

### Original data
Their data was obtained from carrying out experiments with 30 participants performing six different activities while wearing a smartphone. The data was randomly split into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. Using the phone's embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.  

- subject_test.txt: contains the participant number (1-30) for the test data  
- y_test.txt: contains the activity number (1-6) for the test data  
- x_test.txt: contains the vector information (1-531) for the test data  
- subject_training.txt: contains the participant number (1-30) for the training data  
- y_training.txt: contains the activity number (1-6) for the training data  
- x_trainingt.txt: contains the vector information (1-531) for the training data  
- features.txt: contains the descriptive names of activities

More information on the original data is here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. Specifically, the readme.txt file is very descriptive.
 
### Transformations

1. Get column names from the features file.
2. Import test and training datasets for X, Y, and subject using column names from Step 1.
3. Combine test and training datasets for  X, Y, and subject into one data frame.
4. Only include data for the mean and standard deviation of measurements.
5. Give activities meaning by adding labels to the factor variable from activity_labels.txt
6. Give meaningful names to the columns. These begin with {time, fourier}

The tidy data frame was written to a file called "tidydata.txt" in the working directory.

### Data Dictionary

The identifiers are as follows:

- participant - the participant number (1-30) 
- activity - the activity description

The vector information contains 81 rows that are compromised of many elements for each measurement. For example "tBodyAcc-mean-X" denotes a measurement of the mean of a person's acceleration along the x axis as calculated using time. Below are the list of parameters that appear in the tidy data set:  

- t prefix - measurement was calculated using the time domain  
- f prefix- measurement was calculated using the frequency domain
- Body - the person's own movement  
- Gravity - movement due to gravity  
- Acc - acceleration - m/s^2  
- Jerk - jerk - m/s^3  
- Gyro - angular velocity - radians/s  
- Mag - magnitude using the Euclidean norm
- std - standard deviation  
- mean - average  
- x, y, z - which axis the measurement corresponds to  