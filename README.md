---
title: "README"
output: html_document
---

## Getting and cleaning data final project

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Files

This project has this files:

- "CodeBook.md": A markdown file that is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.
- "datameanact.txt": The final tidy data, which only have the mean of each variable in the tables related to the "mean" and "std" of the data, grouped by each activity.
- "run_analysis.R": An R file with all the script used in order to complete the project.

The run_analysis.R file should have the script in order to:

- Merge the training and the test sets to create one data set.
- Extract only the measurements on the mean and standard deviation for each measurement.
- Use descriptive activity names to name the activities in the data set
- Appropriately label the data set with descriptive variable names.
- From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

