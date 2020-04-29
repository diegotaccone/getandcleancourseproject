# getandcleancourseproject
Getting and Cleaning Data Course Project - Diego Taccone

The code goes through the following steps:
1. First in loads the data that is in the working directory.
2. It creates a Test Dataset.  

It creates the Test dataset, adding the actcode, subject, code and type variables.
actcode: associates xtest observation data with activity.
subject: associates xtest observation data with subject.
code: gives each observation a unique code, for when it is merged with train data.
type: indicates it es either part of the test or train dat.

3. It creates a Train dataset, following the same steps as described for Test.
4. The Test and Train is merged into one dataset, called "mergedData".  

"With the mergeData dataset, point 1 of the Assignment is resolved."

5. Names are added to the columns in the "mergedData" dataset, so it is easier to select the desired columns to make the extraction described in point 2 of the assignment.

The names are taken from the "feature.txt" file, which has been downloaded to the "features" object, and with this data de names of the "mergedData" dataset are modified.

6. A subset of the "mergedData" dataset is created, extracting the columns which have Mean and Standard Deviation in the names.
7. This new dataset is called "meanstdData"

"With the creation of the "meanstdData dataset"", point 2 of the assignment is resolved"

8. The "meanstdData" dataset is merged with the "actlabels" object, which contains the information in the "activity_labels.txt" file. (the names of the "actlabels" columns have been modified to "number" and "activity")  It merges the data by the "actcode" column.  The new datset is called "dataset1"  
9. The columns of "dataset1" are reordered and arranged by "code".

"With the creation of the "dataset1" datastet, point 3 of the assignment is resolved."

10. The names of the "dataset1" dataset are edited to more descriptive and easier to manipulate values.
11. Gsub function is used to edit the dataset names.  (The codebook for the new variable names is at the end of this text.)

"With the editing of the names, point 4 of the assignment is resolved"

12. "dataset1" is grouped by subject and activity columns. 
13. with the "summarize" function, a new dataset with the average of each variable by subject and activity is created.  The new dataset is named "dataset2"

"With "dataset2", point 5 of the assignment is resolved."

CODE BOOK FOR DATASET1 AND DATASET2:

code:      Observation number. 1 to 10299, observations from test and train.

subject:   Subject associated to the observation.  There are 30 subjects, going            from 1 to 30.

activity:  Activity peformed in that observation.  There are six observations,            labeled by "LAYING","SITTING","STANDING","WALKING",                            "WALKING_DOWNSTAIRS" and "WALKING_UPSTAIRS".

Type:       if the observation is in the Train or the Test data.

TBAccMx:	"tbodyacc-mean()-x"
TBAccMy:	"tbodyacc-mean()-y"
TBAccMz:	"tbodyacc-mean()-z"
TBAccSDx:	"tbodyacc-std()-x"
TBAccSDy:	"tbodyacc-std()-y"
TBAccSDz:	"tbodyacc-std()-z"
TGravAccMx:	"tgravityacc-mean()-x"
TGravAccMy:	"tgravityacc-mean()-y"
TGravAccMz:	"tgravityacc-mean()-z"
TGravAccSDx:	"tgravityacc-std()-x"
TGravAccSDy:	"tgravityacc-std()-y"
TGravAccSDz:	"tgravityacc-std()-z"
TBAccJMx:	"tbodyaccjerk-mean()-x"
TBAccJMy:	"tbodyaccjerk-mean()-y"
TBAccJMz:	"tbodyaccjerk-mean()-z"
TBAccJSDx:	"tbodyaccjerk-std()-x"
TBAccJSDy:	"tbodyaccjerk-std()-y"
TBAccJSDz:	"tbodyaccjerk-std()-z"
TBGyMx:	         "tbodygyro-mean()-x"
TBGyMy:  	"tbodygyro-mean()-y"
TBGyMz: 	"tbodygyro-mean()-z"
TBGySDx:	"tbodygyro-std()-x"
TBGySDy:	"tbodygyro-std()-y"
TBGySDz:	"tbodygyro-std()-z"
TBGyJMx:	"tbodygyrojerk-mean()-x"
TBGyJMy:	"tbodygyrojerk-mean()-y"
TBGyJMz:	"tbodygyrojerk-mean()-z"
TBGyJSDx:	"tbodygyrojerk-std()-x"
TBGyJSDy:	"tbodygyrojerk-std()-y"
TBGyJSDz:	"tbodygyrojerk-std()-z"
TBAccMagM:	"tbodyaccmag-mean()"
TBAccMagSD:	"tbodyaccmag-std()"
TGravAccMagM:	"tgravityaccmag-mean()"
TGravAccMagSD:	"tgravityaccmag-std()"
TBAccJMagM:	"tbodyaccjerkmag-mean()"
TBAccJMagSD:	"tbodyaccjerkmag-std()"
TBGyMagM:	"tbodygyromag-mean()"
TBGyMagSD:	"tbodygyromag-std()"
TBGyJMagM:	"tbodygyrojerkmag-mean()"
TBGyJMagSD:	"tbodygyrojerkmag-std()"
FBAccMx:	"fbodyacc-mean()-x"
FBAccMy:	"fbodyacc-mean()-y"
FBAccMz:	"fbodyacc-mean()-z"
FBAccSDx:	"fbodyacc-std()-x"
FBAccSDy:	"fbodyacc-std()-y"
FBAccSDz:	"fbodyacc-std()-z"
FBAccMFrx:	"fbodyacc-meanfreq()-x"
FBAccMFry:	"fbodyacc-meanfreq()-y"
FBAccMFrz:	"fbodyacc-meanfreq()-z"
FBAccJMx:	"fbodyaccjerk-mean()-x"
FBAccJMy:	"fbodyaccjerk-mean()-y"
FBAccJMz:	"fbodyaccjerk-mean()-z"
FBAccJSDx:	"fbodyaccjerk-std()-x"
FBAccJSDy:	"fbodyaccjerk-std()-y"
FBAccJSDz:	"fbodyaccjerk-std()-z"
FBAccJMFrx:	"fbodyaccjerk-meanfreq()-x"
FBAccJMFry:	"fbodyaccjerk-meanfreq()-y"
FBAccJMFrz:	"fbodyaccjerk-meanfreq()-z"
FBGyMx: 	"fbodygyro-mean()-x"
FBGyMy: 	"fbodygyro-mean()-y"
FBGyMz: 	"fbodygyro-mean()-z"
FBGySDx:	"fbodygyro-std()-x"
FBGySDy:	"fbodygyro-std()-y"
FBGySDz:	"fbodygyro-std()-z"
FBGyMFrx:	"fbodygyro-meanfreq()-x"
FBGyMFry:	"fbodygyro-meanfreq()-y"
FBGyMFrz:	"fbodygyro-meanfreq()-z"
FBAccMagM:	"fbodyaccmag-mean()"
FBAccMagSD:	"fbodyaccmag-std()"
FBAccMagMFr:	"fbodyaccmag-meanfreq()"
FBBAccJMagM:	"fbodybodyaccjerkmag-mean()"
FBBAccJMagSD:	"fbodybodyaccjerkmag-std()"
FBBAccJMagMFr:	"fbodybodyaccjerkmag-meanfreq()"
FBBGyMagM:	"fbodybodygyromag-mean()"
FBBGyMagSD:	"fbodybodygyromag-std()"
FBBGyMagMFr:	"fbodybodygyromag-meanfreq()"
FBBGyJMagM:	"fbodybodygyrojerkmag-mean()"
FBBGyJMagSD:	"fbodybodygyrojerkmag-std()"
FBBGyJMagMFr:	"fbodybodygyrojerkmag-meanfreq()"
AntBAccMGrav:	"angle(tbodyaccmean,gravity)"
AntBAccJMGravM:	"angle(tbodyaccjerkmean),gravitymean)"
AntBGyMGravM:	"angle(tbodygyromean,gravitymean)"
AntBGyJMGravM:	"angle(tbodygyrojerkmean,gravitymean)"
AnxGravM:	"angle(x,gravitymean)"
AnyGravM:	"angle(y,gravitymean)"
AnzGravM:	"angle(z,gravitymean)"





